-- Hawklets CYO team app: database for Supabase.
-- Paste this whole file into Supabase > SQL Editor and click Run. Safe to run again.
-- All data sits in one locked table; the web page can only reach it through the functions below.

create extension if not exists pgcrypto;

create table if not exists items (
  kind text not null,          -- player | game | msg | news | session | settings
  id   text not null,
  d    jsonb not null default '{}',
  primary key (kind, id)
);
alter table items enable row level security;
revoke all on items from anon, authenticated;

-- ---------- helpers (not callable from the web page) ----------

create or replace function _now() returns text language sql stable as
$$ select to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"') $$;

create or replace function _rid() returns text language sql volatile as
$$ select encode(gen_random_bytes(4), 'hex') $$;

create or replace function _norm(t text) returns text language sql immutable as
$$ select lower(trim(coalesce(t, ''))) $$;

create or replace function _settings() returns jsonb language sql stable as
$$ select coalesce((select d from items where kind = 'settings' and id = 'main'), '{}') $$;

create or replace function _is_admin(e text) returns boolean language sql stable as
$$ select _norm(e) in (select _norm(x) from unnest(string_to_array(_settings()->>'admins', ',')) x) $$;

create or replace function _mine(e text) returns setof items language sql stable as
$$ select * from items where kind = 'player' and coalesce(d->>'status', '') <> 'declined'
     and _norm(e) in (_norm(d->>'email1'), _norm(d->>'email2'), _norm(d->>'studentEmail')) $$;

-- Normalizes a stored player for the page.
create or replace function _p(i text, d jsonb) returns jsonb language sql immutable as
$$ select d || jsonb_build_object('id', i,
     'registered', coalesce(d->>'registered', '') in ('true', '1'),
     'uniformOrdered', coalesce(d->>'uniformOrdered', '') in ('true', '1'),
     'paid', case when d->>'paid' ~ '^\d+(\.\d+)?$' then (d->>'paid')::numeric else 0 end,
     'avail', coalesce(d->'avail', '{}'::jsonb)) $$;

create or replace function _name(e text) returns text language sql stable as
$$ select coalesce((
     select case when _norm(d->>'studentEmail') = _norm(e) then d->>'name'
       else coalesce(case when _norm(d->>'email2') = _norm(e) then d->>'parent2' else d->>'parent1' end, 'Parent')
            || ' (' || split_part(d->>'name', ' ', 1) || '''s family)' end
     from _mine(e) order by id limit 1),
   'Coach ' || coalesce(_settings()->>'coach', '')) $$;

create or replace function _who(tok text) returns jsonb language plpgsql stable as $$
declare e text; ids jsonb; adm boolean;
begin
  select d->>'email' into e from items where kind = 'session' and id = tok and (d->>'exp')::timestamptz > now();
  if e is null then raise exception 'AUTH'; end if;
  select coalesce(jsonb_agg(id), '[]') into ids from _mine(e);
  adm := _is_admin(e);
  if not adm and jsonb_array_length(ids) = 0 then raise exception 'AUTH'; end if;
  return jsonb_build_object('email', e, 'admin', adm, 'ids', ids);
end $$;

create or replace function _admin(tok text) returns void language plpgsql stable as $$
begin if not (_who(tok)->>'admin')::boolean then raise exception 'Coach only.'; end if; end $$;

create or replace function _msgs(since text) returns jsonb language sql stable as
$$ select coalesce(jsonb_agg(x order by x->>'ts'), '[]') from (
     select d || jsonb_build_object('id', id) x from items
     where kind = 'msg' and d->>'ts' > coalesce(since, '') order by d->>'ts' desc limit 150) t $$;

-- ---------- phone alerts (ntfy) ----------
-- Families' saves and chat posts send a push notification to the coach's ntfy topic.
create extension if not exists pg_net;

create or replace function _alert(actor text, title text, msg text, tag text) returns void
language plpgsql security definer set search_path = public, extensions as $$
declare cfg jsonb := (select d from items where kind = 'secret' and id = 'alerts');
begin
  if cfg is null or coalesce(cfg->>'topic', '') = '' then return; end if;
  if _norm(actor) in (select _norm(x) from unnest(string_to_array(coalesce(cfg->>'mute', ''), ',')) x) then return; end if;
  perform net.http_post(
    url := 'https://ntfy.sh/',
    body := jsonb_build_object('topic', cfg->>'topic', 'title', left(title, 120), 'message', left(coalesce(nullif(msg, ''), 'Open the app for details.'), 1000),
                               'tags', jsonb_build_array(tag), 'click', 'https://travisbsmith.github.io/hawklets-cyo/'),
    headers := '{"Content-Type": "application/json"}'::jsonb);
exception when others then null;  -- an alert must never block a save
end $$;

-- ---------- web API ----------

create or replace function login(email text, password text) returns text
language plpgsql security definer set search_path = public, extensions as $$
declare tok text := encode(gen_random_bytes(24), 'hex');
begin
  email := _norm(email);
  if email = '' or coalesce(password, '') = '' then raise exception 'Enter your email and the team password.'; end if;
  if trim(password) <> trim(coalesce(_settings()->>'teamPassword', '')) then
    raise exception 'That team password is not right. Check the email from Coach Travis.'; end if;
  if not _is_admin(email) and not exists (select 1 from _mine(email)) then
    raise exception 'That email isn''t on the roster. Use the email you gave Coach Travis, or your son''s Rockhurst email.'; end if;
  delete from items where kind = 'session' and (d->>'exp')::timestamptz < now();
  insert into items values ('session', tok, jsonb_build_object('email', email, 'exp', now() + interval '120 days'));
  return tok;
end $$;

create or replace function get_data(token text) returns jsonb
language plpgsql security definer set search_path = public, extensions as $$
declare me jsonb := _who(token); s jsonb := _settings(); n int; share numeric; fee numeric; r numeric; out jsonb;
begin
  select count(*) into n from items where kind = 'player' and d->>'status' = 'committed';
  fee := coalesce(nullif(s->>'teamFee', '')::numeric, 0);
  r := coalesce(nullif(s->>'roundTo', '')::numeric, 0);
  share := case when n = 0 then null when r > 0 then ceil(fee / n / r) * r else ceil(fee / n * 100) / 100 end;
  out := jsonb_build_object(
    'me', jsonb_build_object('email', me->>'email', 'admin', (me->>'admin')::boolean, 'name', _name(me->>'email')),
    'settings', s - 'teamPassword' - 'admins', 'share', share, 'count', n,
    'players', coalesce((select jsonb_agg(jsonb_build_object('id', id, 'name', x->>'name', 'jersey', x->>'jersey',
        'registered', x->'registered', 'avail', x->'avail', 'form', coalesce(x->>'formAt', '') <> '', 'mine', me->'ids' ? id,
        'uniform', case when x->>'needsUniform' = 'no' then 'has' when (x->>'uniformOrdered')::boolean then 'ordered'
                        when x->>'needsUniform' = 'yes' then 'needs' else '' end) order by x->>'name')
      from (select id, _p(id, d) x from items where kind = 'player' and d->>'status' = 'committed') t), '[]'),
    'mine', coalesce((select jsonb_agg(_p(id, d) || jsonb_build_object('owed', share))
      from items where kind = 'player' and me->'ids' ? id), '[]'),
    'games', coalesce((select jsonb_agg(d || jsonb_build_object('id', id) order by d->>'date') from items where kind = 'game'), '[]'),
    'announcements', coalesce((select jsonb_agg(x order by x->>'ts' desc) from (
      select d || jsonb_build_object('id', id) x from items where kind = 'news' order by d->>'ts' desc limit 20) t), '[]'),
    'messages', _msgs(''));
  if (me->>'admin')::boolean then
    out := out || jsonb_build_object('adminSettings', s, 'adminPlayers', coalesce((select jsonb_agg(
      _p(id, d) || jsonb_build_object('owed', case when d->>'status' = 'committed' then share end) order by d->>'name')
      from items where kind = 'player'), '[]'));
  end if;
  return out;
end $$;

create or replace function get_messages(token text, since text) returns jsonb
language plpgsql security definer set search_path = public, extensions as $$
begin perform _who(token); return _msgs(since); end $$;

create or replace function save_player_info(token text, player_id text, info jsonb) returns jsonb
language plpgsql security definer set search_path = public, extensions as $$
declare me jsonb := _who(token); p jsonb; k text;
begin
  if not (me->>'admin')::boolean and not me->'ids' ? player_id then raise exception 'You can only edit your own player.'; end if;
  if length(info::text) > 2000 then raise exception 'Too long.'; end if;
  foreach k in array array['jersey1', 'jersey2'] loop
    if coalesce(info->>k, '') <> '' and info->>k <> all (array['0','1','2','3','4','5','10','11','12','13','14','15','20','21','22','23','24','25',
        '30','31','32','33','34','35','40','41','42','43','44','45','50','51','52','53','54','55']) then
      raise exception 'CYO only allows numbers 0-5, 10-15, 20-25, 30-35, 40-45 and 50-55.'; end if;
  end loop;
  select d into p from items where kind = 'player' and id = player_id for update;
  if p is null then raise exception 'Player not found.'; end if;
  p := p || (select coalesce(jsonb_object_agg(key, value), '{}') from jsonb_each(info)
             where key in ('jersey1','jersey2','topSize','shortSize','shortLength','needsUniform','uniformOrdered','phone'))
         || jsonb_build_object('formAt', to_char(now() at time zone 'America/Chicago', 'YYYY-MM-DD'));
  update items set d = p where kind = 'player' and id = player_id;
  perform _alert(me->>'email', _name(me->>'email') || ' updated ' || split_part(p->>'name', ' ', 1) || '''s info',
    concat_ws(' · ',
      case when coalesce(p->>'jersey1', '') <> '' then 'Wants #' || (p->>'jersey1') || coalesce(' or #' || nullif(p->>'jersey2', ''), '') end,
      case p->>'needsUniform' when 'no' then 'Has a uniform' when 'yes' then case when p->>'uniformOrdered' in ('true', '1') then 'Uniform ordered' else 'Needs a uniform' end end,
      'Jersey ' || nullif(p->>'topSize', ''),
      'Shorts ' || coalesce(nullif(p->>'shortLength', '') || '" ', '') || nullif(p->>'shortSize', ''),
      'Cell ' || nullif(p->>'phone', '')), 'basketball');
  return _p(player_id, p);
end $$;

create or replace function set_availability(token text, player_id text, game_date text, v text) returns jsonb
language plpgsql security definer set search_path = public, extensions as $$
declare me jsonb := _who(token); p jsonb; a jsonb;
begin
  if not (me->>'admin')::boolean and not me->'ids' ? player_id then raise exception 'You can only answer for your own player.'; end if;
  if coalesce(v, '') not in ('yes', 'maybe', 'no', '') or game_date !~ '^\d{4}-\d{2}-\d{2}$' then raise exception 'Bad value.'; end if;
  select d into p from items where kind = 'player' and id = player_id for update;
  if p is null then raise exception 'Player not found.'; end if;
  a := coalesce(p->'avail', '{}');
  a := case when coalesce(v, '') = '' then a - game_date else a || jsonb_build_object(game_date, v) end;
  p := p || jsonb_build_object('avail', a);
  if coalesce(p->>'formAt', '') = '' then p := p || jsonb_build_object('formAt', to_char(now() at time zone 'America/Chicago', 'YYYY-MM-DD')); end if;
  update items set d = p where kind = 'player' and id = player_id;
  -- one alert per family per 5 minutes, so tapping through every Saturday sends a single notification
  if not exists (select 1 from items where kind = 'alertlog' and id = 'avail:' || player_id and (d->>'ts')::timestamptz > now() - interval '5 minutes') then
    insert into items values ('alertlog', 'avail:' || player_id, jsonb_build_object('ts', now())) on conflict (kind, id) do update set d = excluded.d;
    perform _alert(me->>'email', _name(me->>'email') || ' updated ' || split_part(p->>'name', ' ', 1) || '''s availability',
      (select count(*) from jsonb_object_keys(a)) || ' of ' || (select count(*) from items where kind = 'game') || ' Saturdays answered.', 'calendar');
  end if;
  return a;
end $$;

create or replace function post_message(token text, body text) returns jsonb
language plpgsql security definer set search_path = public, extensions as $$
declare me jsonb := _who(token); m jsonb; i text := _rid();
begin
  body := left(trim(coalesce(body, '')), 1000);
  if body = '' then raise exception 'Type a message first.'; end if;
  m := jsonb_build_object('ts', _now(), 'email', me->>'email', 'name', _name(me->>'email'), 'text', body);
  insert into items values ('msg', i, m);
  perform _alert(me->>'email', case when body like '%?%' then 'Question from ' else 'Chat: ' end || (m->>'name'), body,
    case when body like '%?%' then 'question' else 'speech_balloon' end);
  return m || jsonb_build_object('id', i);
end $$;

create or replace function admin_save_player(token text, p jsonb) returns jsonb
language plpgsql security definer set search_path = public, extensions as $$
declare i text := coalesce(nullif(p->>'id', ''), _rid()); cur jsonb;
begin
  perform _admin(token);
  select d into cur from items where kind = 'player' and id = i;
  cur := coalesce(cur, '{}') || (p - 'id' - 'avail' - 'owed' - 'mine');
  if coalesce(cur->>'status', '') = '' then cur := cur || '{"status":"committed"}'; end if;
  insert into items values ('player', i, cur) on conflict (kind, id) do update set d = excluded.d;
  return _p(i, cur);
end $$;

create or replace function admin_save_game(token text, g jsonb) returns jsonb
language plpgsql security definer set search_path = public, extensions as $$
declare i text; cur jsonb;
begin
  perform _admin(token);
  if coalesce(g->>'date', '') !~ '^\d{4}-\d{2}-\d{2}$' then raise exception 'Pick a date.'; end if;
  i := coalesce(nullif(g->>'id', ''), g->>'date');
  select d into cur from items where kind = 'game' and id = i;
  cur := coalesce(cur, '{}') || (g - 'id');
  insert into items values ('game', i, cur) on conflict (kind, id) do update set d = excluded.d;
  return cur || jsonb_build_object('id', i);
end $$;

create or replace function admin_post_announcement(token text, a jsonb) returns jsonb
language plpgsql security definer set search_path = public, extensions as $$
declare i text := _rid(); rec jsonb;
begin
  perform _admin(token);
  rec := jsonb_build_object('ts', _now(), 'title', left(coalesce(a->>'title', ''), 120), 'body', left(coalesce(a->>'body', ''), 3000));
  insert into items values ('news', i, rec);
  return rec || jsonb_build_object('id', i);
end $$;

-- One delete for players, games, news and chat messages.
create or replace function admin_delete(token text, item_kind text, item_id text) returns boolean
language plpgsql security definer set search_path = public, extensions as $$
begin
  perform _admin(token);
  if item_kind not in ('player', 'game', 'news', 'msg') then raise exception 'Bad kind.'; end if;
  delete from items where kind = item_kind and id = item_id;
  return true;
end $$;

create or replace function admin_save_settings(token text, o jsonb) returns jsonb
language plpgsql security definer set search_path = public, extensions as $$
begin
  perform _admin(token);
  insert into items values ('settings', 'main', o) on conflict (kind, id) do update set d = items.d || excluded.d;
  return _settings();
end $$;

-- Only the web API is callable from the page.
do $$ declare f record; begin
  for f in select p.oid::regprocedure sig, p.proname from pg_proc p join pg_namespace n on n.oid = p.pronamespace
           where n.nspname = 'public' and p.proname in ('_alert','_now','_rid','_norm','_settings','_is_admin','_mine','_p','_name','_who','_admin','_msgs',
             'login','get_data','get_messages','save_player_info','set_availability','post_message','admin_save_player','admin_save_game',
             'admin_post_announcement','admin_delete','admin_save_settings')
  loop
    execute format('revoke all on function %s from public, anon, authenticated', f.sig);
    if left(f.proname, 1) <> '_' then execute format('grant execute on function %s to anon, authenticated', f.sig); end if;
  end loop;
end $$;
