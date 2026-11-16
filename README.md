# Hawklets CYO team app

Team page for a Rockhurst freshman CYO basketball team: schedule, availability, jersey numbers, uniform sizes, team chat and a coach view. Families sign in with their email and a shared team password.

- `index.html`: the whole web app, served by GitHub Pages.
- `schema.sql`: the database (Supabase). The page can only reach data through the functions in this file.

## Setup
1. Create a free Supabase project. In **SQL Editor**, run `schema.sql`, then the private roster seed (kept out of this repo).
2. In **Project Settings > API**, copy the project URL and the publishable (anon) key into `CFG` near the top of the script in `index.html`. Both are safe to publish.
3. Turn on GitHub Pages: **Settings > Pages > Deploy from a branch > main / root**.

Change the team password and admins in the app under **Coach > Settings**.
