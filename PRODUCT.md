# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users
- **Parents** of Rockhurst freshman CYO players, mostly on phones, in short visits: claim a jersey number, send uniform sizes, mark each Saturday In / Maybe / Out, read coach news, ask a question in team chat.
- **Coaches** (head coach and assistant), mostly on a laptop: see the whole roster, availability, uniforms, numbers, registration and fees at once, edit players and games, post announcements.

## Product Purpose
A private team app for the Hawklets, the Rockhurst freshman team in the CYO of Johnson & Wyandotte Counties league. It replaces scattered emails with one place for schedule, availability, jersey numbers, uniform orders and chat. Success: every family answers what the coach needs without being chased, and the coach can see the state of the team in one look.

## Positioning
Built for one team's actual season: first-come jersey numbers with CYO's legal number set, per-Saturday availability, CYO registration status and uniform ordering, with coach phone alerts on every family update.

## Operating Context
Season runs Saturdays Dec 5 – Feb (game times and gyms post about a week ahead). Families sign in with a shared team password plus their email. Coaches get alerts on their phones (ntfy). Coaches also work from email and a separate Team Desk tracker.

## Capabilities and Constraints
- Single static `index.html` on GitHub Pages; Supabase backend via RPC only. No build step.
- Views: Home (desktop dashboard), Schedule, Chat, My player, Team, Coach (overview, uniforms, roster, availability, money, games, news, settings).
- Must stay fast and fully usable on phones; desktop shows a dense one-screen dashboard.
- Team fee hidden from families until the coach turns it on.

## Brand Commitments
- Name: "Hawklets" (Rockhurst freshman CYO).
- Rockhurst school colors are preferred (navy and white); everything else in the visual style is open.
- Voice: short, plain, friendly and direct, written from the coach to parents.

## Evidence on Hand
Real roster, schedule and chat live in Supabase. No logo file or photography exists in the repo; do not invent sponsors, records or results.

## Product Principles
1. Answer the coach's question in one tap: every family task is a single screen with one save.
2. The state of the team is visible, not hunted for: counts and gaps show up front.
3. Phone first for families, density for coaches.
4. Never lose a parent's input: drafts persist until saved.

## Accessibility & Inclusion
Parents of all tech comfort levels on phones: large touch targets, readable contrast, no hidden gestures.
