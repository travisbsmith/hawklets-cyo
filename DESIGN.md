---
name: Hawklets
description: The Rockhurst freshman CYO team app, a quiet and precise team tool where the data and the players' numerals carry the page.
colors:
  rockhurst-navy: "#1e3a8a"
  navy-pressed: "#172f74"
  navy-wash: "#eef2ff"
  navy-wash-deep: "#e0e7ff"
  ground: "#f7f7f8"
  surface: "#ffffff"
  subtle: "#fafafa"
  hover: "#f4f4f5"
  ink: "#18181b"
  ink-soft: "#3f3f46"
  muted: "#6b6b76"
  hairline: "#e8e8ec"
  hairline-strong: "#d4d4d8"
  disabled-ink: "#b4b4bc"
  state-in: "#15803d"
  state-in-soft: "#ecfdf3"
  state-maybe: "#b45309"
  state-maybe-soft: "#fffbeb"
  state-out: "#b91c1c"
  state-out-soft: "#fef2f2"
typography:
  headline:
    fontFamily: "Inter, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "24px"
    fontWeight: 600
    lineHeight: 1.2
    letterSpacing: "-0.025em"
  stat:
    fontFamily: "Inter, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "22px"
    fontWeight: 600
    lineHeight: 1.2
    letterSpacing: "-0.025em"
    fontFeature: "\"tnum\""
  title-lg:
    fontFamily: "Inter, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "20px"
    fontWeight: 600
    lineHeight: 1.2
    letterSpacing: "-0.02em"
  title:
    fontFamily: "Inter, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "15px"
    fontWeight: 600
    lineHeight: 1.3
    letterSpacing: "-0.01em"
  body:
    fontFamily: "Inter, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "15px"
    fontWeight: 400
    lineHeight: 1.5
    fontFeature: "\"cv11\", \"ss01\""
  body-sm:
    fontFamily: "Inter, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "13px"
    fontWeight: 400
    lineHeight: 1.5
  label:
    fontFamily: "Inter, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "12px"
    fontWeight: 500
    lineHeight: 1.6
  numeral:
    fontFamily: "Inter, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "17px"
    fontWeight: 700
    lineHeight: 1
    letterSpacing: "-0.02em"
    fontFeature: "\"tnum\""
rounded:
  xs: "6px"
  sm: "8px"
  md: "10px"
  bubble: "12px"
  sheet: "14px"
  full: "999px"
spacing:
  xs: "4px"
  sm: "8px"
  md: "12px"
  lg: "16px"
  card: "18px"
  xl: "28px"
components:
  button-primary:
    backgroundColor: "{colors.rockhurst-navy}"
    textColor: "{colors.surface}"
    rounded: "{rounded.sm}"
    padding: "10px 16px"
    height: "44px"
  button-primary-hover:
    backgroundColor: "{colors.navy-pressed}"
  button-soft:
    backgroundColor: "{colors.navy-wash}"
    textColor: "{colors.rockhurst-navy}"
    rounded: "{rounded.sm}"
    padding: "10px 16px"
  button-soft-hover:
    backgroundColor: "{colors.navy-wash-deep}"
  button-ghost:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    rounded: "{rounded.sm}"
    padding: "10px 16px"
  button-ghost-hover:
    backgroundColor: "{colors.subtle}"
  button-danger:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.state-out}"
    rounded: "{rounded.sm}"
    padding: "10px 16px"
  button-danger-hover:
    backgroundColor: "{colors.state-out-soft}"
  card:
    backgroundColor: "{colors.surface}"
    rounded: "{rounded.md}"
    padding: "{spacing.card}"
  input:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    rounded: "{rounded.sm}"
    padding: "10px 12px"
    height: "44px"
  chip:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink-soft}"
    rounded: "{rounded.sm}"
    padding: "8px 12px"
    height: "40px"
  chip-selected:
    backgroundColor: "{colors.rockhurst-navy}"
    textColor: "{colors.surface}"
  pill:
    backgroundColor: "{colors.subtle}"
    textColor: "{colors.ink-soft}"
    typography: "{typography.label}"
    rounded: "{rounded.full}"
    padding: "1px 8px"
  pill-in:
    backgroundColor: "{colors.state-in-soft}"
    textColor: "{colors.state-in}"
  pill-maybe:
    backgroundColor: "{colors.state-maybe-soft}"
    textColor: "{colors.state-maybe}"
  pill-out:
    backgroundColor: "{colors.state-out-soft}"
    textColor: "{colors.state-out}"
  segment-in-on:
    backgroundColor: "{colors.state-in}"
    textColor: "{colors.surface}"
    rounded: "{rounded.xs}"
  segment-maybe-on:
    backgroundColor: "{colors.state-maybe}"
    textColor: "{colors.surface}"
    rounded: "{rounded.xs}"
  segment-out-on:
    backgroundColor: "{colors.state-out}"
    textColor: "{colors.surface}"
    rounded: "{rounded.xs}"
  jersey-patch:
    backgroundColor: "{colors.rockhurst-navy}"
    textColor: "{colors.surface}"
    typography: "{typography.numeral}"
    size: "44px"
  nav-item-active-desktop:
    backgroundColor: "#ececef"
    textColor: "{colors.ink}"
    rounded: "{rounded.xs}"
  savebar:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.surface}"
    rounded: "{rounded.md}"
---

# Design System: Hawklets

## Overview

**Creative North Star: "The Quiet Ledger"**

Hawklets is the category standard played straight, at the craft level of Linear, Notion, Stripe and Airbnb. A light neutral ground holds white surfaces divided by one-pixel hairlines; nothing decorates, so the page reads as a ledger of the team: who is in for Saturday, what is left to do, which numbers are taken. The two things allowed to carry weight are the data (counts, dates, availability, all in tabular figures) and the players' jersey numerals, worn as stitched navy patches beside every player.

Density follows the reader. Parents on phones get one calm column, a white header, cards stacked at 12px, a bottom tab bar and one save bar that appears only when there is something to save. Coaches on a laptop get a light sidebar and a three-column dashboard with sortable tables. Both are the same system: same ink, same hairlines, same single accent.

Rockhurst navy is the only brand color, and it means "act here, this is selected, this has focus". Green, amber and red appear only to report state (In / Maybe / Out, done / missing). Motion is short and functional: 150ms color transitions, a 220ms rise for sheets and the save bar, all removed under reduced motion.

**Key Characteristics:**
- Light neutral ground, white surfaces, hairline separation instead of shadow.
- One accent: Rockhurst navy for primary actions, selection and focus.
- State colors reserved for availability and completion, always paired with a word.
- Inter throughout, tight negative tracking on headings, tabular numerals for every count and date.
- Small, consistent radii (8 to 10px); fully round only for numerals, pills and status dots.
- The stitched jersey-number patch beside every player is the one signature device.

## Colors

A zinc neutral scale on a near-white ground, one navy accent, and three state colors kept on a short leash.

### Primary
- **Rockhurst Navy** (rockhurst-navy): The school color and the only accent. Primary buttons, the selected chip, the claimed jersey number, the availability bar fill, my own chat bubbles, the active tab on phone, focus outlines, caret and links. Pressed and hover state darkens to **Navy Pressed** (navy-pressed).
- **Navy Wash** (navy-wash): The quiet tint of the accent. Soft buttons, tile icon wells, the "blue" pill, and the highlighted "this is my player" row in coach tables. **Navy Wash Deep** (navy-wash-deep) is its hover step.

### Neutral
- **Ground** (ground): Page background behind every card, and the login backdrop.
- **Surface** (surface): Cards, header, phone tab bar, sheets, inputs, table cells.
- **Subtle** (subtle): Row hover, chat scroll area, desktop sidebar, date chips, neutral pills.
- **Hover** (hover): Segmented-control track, progress-bar track, desktop nav hover, taken jersey numbers.
- **Ink** (ink): Primary text, and the inverted fill of the save bar and toast.
- **Ink Soft** (ink-soft): Secondary text on controls: chip and segment labels, field labels, desktop nav items.
- **Muted** (muted): Meta lines, table headers, timestamps, inactive phone tabs.
- **Hairline** (hairline): Every card border and every divider between rows, list items and sections.
- **Hairline Strong** (hairline-strong): Input, chip and ghost-button borders; the outer ring of the jersey patch.
- **Disabled Ink** (disabled-ink): Taken numbers and empty availability cells only; never for readable content.

### State
- **In** (state-in, on state-in-soft): Available, done, saved, the toast check.
- **Maybe** (state-maybe, on state-maybe-soft): Maybe, and gaps the coach should chase (missing counts, "To order").
- **Out** (state-out, on state-out-soft): Out, errors, destructive actions, the unread badge.

### Named Rules
**The One Accent Rule.** Navy is the only hue that invites action. If something is navy, it is a primary action, a selection, the focus ring, or a player's numeral.

**The State Is Not Decoration Rule.** Green, amber and red appear only to report a state, and always next to the word that names it (In, Maybe, Out, Has one, To order). Never use them for emphasis, categories or ornament.

## Typography

**Display Font:** Inter (with system-ui, -apple-system, Segoe UI, Roboto)
**Body Font:** Inter
**Label/Mono Font:** Inter, with tabular numerals instead of a mono face

**Character:** One sans family doing every job, separated by weight and tracking rather than by typeface. Headings tighten (-0.01 to -0.025em) and sit at 600; body stays at 400 with Inter's alternate digits and single-storey a (cv11, ss01).

### Hierarchy
- **Headline** (600, 24px, 1.2, -0.025em; 22px under 420px): The next-game day line on the hero card. The largest type in the app.
- **Stat** (600, 22px, 1.2, -0.025em, tabular): Numbers in the coach stat strip. Login title uses the same size.
- **Title Large** (600, 20px, 1.2, -0.02em): The page title in the white header. Sheet titles step to 18px.
- **Title** (600, 15px, 1.3, -0.01em): Card headings.
- **Body** (400, 15px, 1.5): Running text, inputs, list item titles (at 500).
- **Body Small** (400, 13px): Meta lines, list subtitles, to-do detail, field labels (at 500).
- **Label** (500, 12px, 1.6): Pills, table headers, stat captions, countdown.
- **Numeral** (700, 17px, 1, -0.02em, tabular): The jersey-number patch. Scales to 15, 14 and 11px with the patch.

### Named Rules
**The Tabular Figures Rule.** Every number a reader compares (stats, dates, counts, table cells, jersey numbers, the countdown) is set with tabular numerals so columns line up and counts do not jitter as they change.

**The Weight Not Face Rule.** Hierarchy comes from size, weight (400 / 500 / 600 / 700) and tracking within Inter. Do not introduce a second family.

## Layout

Phone first. The phone layout is a single column, max 720px, 16px side padding, cards stacked with a 12px gap, a white header pinned to the top of the flow with a hairline under it, and a fixed bottom tab bar (64px plus safe area). The save bar and chat composer float above the tab bar. Sheets rise from the bottom on phones and center as dialogs from 640px.

At 1100px the tab bar becomes a 228px light sidebar (subtle background, hairline right edge) with the team name set in text at the top, and the page becomes a dashboard up to 1480px wide with 28px gutters: three columns (`1.1fr / 1fr / minmax(330px, .95fr)`, 16px gap). Column one holds the next game and the to-do list, column two the player card and schedule, column three a sticky full-height chat card.

Spacing runs on a 4px base: 4, 8, 12, 16, 28, with 18px inside cards and 20px inside sheets. Rows inside a card are separated by hairlines with 10 to 14px of vertical padding, first and last rows flush to the card padding. Touch targets are at least 44px tall for inputs and buttons (40px chips, 52px tab buttons).

## Elevation & Depth

Flat by default, separated by hairlines. Cards carry a 1px hairline border and a near-invisible 4% ground shadow; depth beyond that is reserved for things that float over the page.

### Shadow Vocabulary
- **Rest** (`box-shadow: 0 1px 2px rgba(24,24,27,.04)`): Cards and the hero. Barely there; the hairline does the work.
- **Lift** (`box-shadow: 0 8px 24px rgba(24,24,27,.10), 0 1px 2px rgba(24,24,27,.06)`): The floating chat composer and centered sheets on desktop.
- **Overlay** (`box-shadow: 0 12px 32px rgba(24,24,27,.25)`): The inverted save bar. The toast uses a slightly lighter `0 10px 30px rgba(24,24,27,.2)`.
- **Selected Segment** (`box-shadow: 0 1px 2px rgba(24,24,27,.12)`): The active In / Maybe / Out segment.

### Named Rules
**The Hairline First Rule.** Separate with a 1px hairline before reaching for a shadow. A shadow means the element floats above the page (composer, sheet, save bar, toast), not that it is important.

## Shapes

Small, consistent radii: 8px for controls (buttons, inputs, chips, icon buttons, date chips), 10px for cards, stat strips and the save bar, 6px for segments and desktop nav items, 12px chat bubbles with one 4px tail corner, 14px top corners on phone sheets. Fully round is reserved for meaning: jersey patches, the number picker, pills, ticks, status dots and the progress bar. Borders are always 1px solid hairlines; the only dashed line is the stitch inside a jersey patch and the outline of an empty (unclaimed) patch.

## Components

### Buttons
Quiet and solid: flat fills, no gradients, a slight press.
- **Shape:** Gently rounded (8px), min height 44px, 10px by 16px padding, 500 weight at 14px, 16px icons with an 8px gap.
- **Primary:** Navy fill, white text. Hover to Navy Pressed. Press scales to 0.98.
- **Soft:** Navy Wash fill, navy text, for secondary actions that still belong to the accent.
- **Ghost:** White with a Hairline Strong border and ink text; hover to Subtle.
- **Danger:** White with a pale red border and red text; hover to the red wash.
- **Small:** 34px high (28px inside tables), 13px text.
- **Focus:** 2px navy outline at 2px offset, shared by every focusable element.

### Chips
- **Style:** White, Hairline Strong border, 8px radius, 40px high, ink-soft 14px/500 text. Used for uniform sizes and single choices.
- **State:** Selected fills navy with white text; disabled drops to 40% opacity.

### Pills
- **Style:** Fully round, 12px/500, 1px border, wash background with matching ink: neutral, navy, In, Maybe, Out. An optional 6px leading dot in the text color.

### Cards / Containers
- **Corner Style:** 10px.
- **Background:** Surface on the Ground.
- **Shadow Strategy:** Rest shadow only (see Elevation & Depth).
- **Border:** 1px Hairline.
- **Internal Padding:** 18px; card heading row has a 12px gap below it.
- **Stat strip:** Three or more cells joined by 1px hairline gutters inside one 10px-radius frame.

### Inputs / Fields
- **Style:** White, 1px Hairline Strong border, 8px radius, 10px by 12px padding, 44px min height, 15px text, navy caret. Labels sit 6px above at 13px/500 ink-soft, with an optional muted hint on the right.
- **Focus:** Border turns navy with a 3px navy halo at 14% opacity; no outline.

### Availability Segmented Control (signature)
A three-way In / Maybe / Out switch on a Hover-grey 8px track with 2px padding. Unselected segments are transparent ink-soft text; the selected segment fills with its state color (green, amber, red) and white text with a small 1px shadow. This is the main family action in the app, on the hero card and on every upcoming game.

### Jersey-Number Patch (signature)
A navy disc with a white bold tabular numeral, a dashed white stitch ring inset 3px, and a 2px white plus 1px Hairline Strong outer ring so it reads as sewn on. 44px by default, 36px in headers, 32px in lists, 24px in dense tables (no outer ring). An unclaimed patch is a transparent disc with a dashed grey outline. The same stitched disc forms the app mark in the header. The number picker uses round 52px buttons: claimed is navy with a navy ring, taken is grey, struck through and disabled.

### Navigation
- **Phone:** Fixed white bottom bar with a hairline top edge; five equal tabs, 22px icon over an 11px/500 label, muted at rest, navy when active (icon stroke thickens), red dot badge for unread.
- **Desktop:** 228px Subtle sidebar with a hairline right edge; rows of 17px icon plus 14px label, 6px radius, ink-soft at rest, Hover background on hover, #ececef background with ink text when active.
- **Coach sub-navigation:** Horizontal text tabs on a hairline; active tab gets ink text and a 2px ink underline.

### Lists, Dates and Tables
List rows are divided by hairlines. Games lead with a 46 by 50px date chip (Subtle fill, hairline border, small navy uppercase month over a 19px day). Coach tables are 13px, sticky header and first column, row hover in Subtle, availability cells as small tinted state codes, sortable headers that darken to ink when active.

### Save Bar and Toast
Inverted ink surfaces that float: the save bar (10px radius, white primary button, translucent ghost) rises 12px in 220ms when a draft is unsaved; the toast drops from the top with a green check (red on error).

## Do's and Don'ts

### Do:
- **Do** keep Rockhurst navy as the only accent and use it for primary actions, selection, focus and numerals.
- **Do** separate surfaces with 1px hairlines (hairline) and keep cards on the Rest shadow only.
- **Do** put a stitched jersey-number patch beside every player, wherever a player appears.
- **Do** set every compared number in tabular figures.
- **Do** pair every state color with its word (In, Maybe, Out, Has one, To order).
- **Do** keep touch targets at 44px or taller for buttons and inputs on phones.
- **Do** keep transitions at 150ms for color and 220ms with `cubic-bezier(.2,.8,.2,1)` for rising surfaces, and drop them all under reduced motion.

### Don't:
- **Don't** add a second accent hue or use green, amber or red for emphasis or decoration.
- **Don't** lift resting cards with larger shadows; shadow is only for floating elements.
- **Don't** introduce a second typeface; hierarchy comes from Inter's weights and tracking.
- **Don't** set small uppercase labels above headings; card headings stand on their own.
- **Don't** use Disabled Ink (disabled-ink) for any text a reader needs to read.
- **Don't** round controls past 10px; fully round shapes are reserved for patches, pills, ticks and dots.
