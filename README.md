# Hawklets CYO team app

Team app for a Rockhurst freshman CYO basketball team. Families sign in with their email (or their son's Rockhurst email) and the team password. It covers the schedule and availability, jersey numbers and uniform sizes, team chat, and a coach panel (roster, availability, uniforms, money, games, updates, settings).

- `index.html`: the whole app, served by GitHub Pages.
- `schema.sql`: the Supabase database. The page can only reach data through the functions in this file.

The roster seed and team password are kept out of this repo. Change the password and admins in the app under **Coach > Settings**.
