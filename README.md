# Hawklets CYO team page

A single static page on GitHub Pages for a freshman CYO basketball team: schedule, team list, uniform ordering, and a form that emails the coach jersey numbers, sizes and availability. No server and no database.

- `index.html`: the page. Families unlock it with the team password.
- `data.enc`: the team data, encrypted (PBKDF2-SHA256 + AES-GCM). The page decrypts it in the browser.
- `build.js`: edits the data.
  - `TEAM_PASSWORD=... node build.js decrypt > data.json` to read it.
  - `TEAM_PASSWORD=... node build.js encrypt data.json` to write it back, then commit `data.enc`.

Keep `data.json` out of the repo. To change the password, decrypt with the old one and encrypt with the new one.
