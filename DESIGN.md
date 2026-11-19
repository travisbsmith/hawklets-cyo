---
name: Hawklets
description: The Rockhurst freshman CYO team app, worn like the team's letter jacket.
colors:
  wool: "#0d1a35"
  navy: "#14284f"
  navy-light: "#1f3a6e"
  navy-mist: "#e6ebf4"
  varsity-gold: "#c6a24a"
  cool-ground: "#edf0f5"
  leather-white: "#ffffff"
  ink: "#0c1730"
  ink-soft: "#2c3852"
  muted: "#58637a"
  hairline: "#e3e7ee"
  stitch-line: "#cdd3de"
  state-in: "#137344"
  state-in-soft: "#e3f3ea"
  state-maybe: "#8f5600"
  state-maybe-soft: "#fcf0d9"
  state-out: "#b3261e"
  state-out-soft: "#fbe9e7"
typography:
  display:
    fontFamily: "Barlow, system-ui, sans-serif"
    fontSize: "32px"
    fontWeight: 700
    lineHeight: 1.1
    letterSpacing: "-0.02em"
  headline:
    fontFamily: "Barlow, system-ui, sans-serif"
    fontSize: "24px"
    fontWeight: 700
    lineHeight: 1.15
    letterSpacing: "-0.015em"
  title:
    fontFamily: "Barlow, system-ui, sans-serif"
    fontSize: "18px"
    fontWeight: 700
    lineHeight: 1.25
    letterSpacing: "-0.01em"
  numeral:
    fontFamily: "Barlow Condensed, Barlow, system-ui, sans-serif"
    fontSize: "28px"
    fontWeight: 700
    lineHeight: 1.1
  body:
    fontFamily: "Barlow, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "16px"
    fontWeight: 400
    lineHeight: 1.5
    fontFeature: "tnum"
  body-sm:
    fontFamily: "Barlow, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "14px"
    fontWeight: 400
    lineHeight: 1.5
  button:
    fontFamily: "Barlow, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "15px"
    fontWeight: 700
    letterSpacing: "0.01em"
  label:
    fontFamily: "Barlow, system-ui, -apple-system, Segoe UI, Roboto, sans-serif"
    fontSize: "11px"
    fontWeight: 700
    letterSpacing: "0.07em"
rounded:
  tag: "6px"
  sm: "10px"
  md: "14px"
  sheet: "18px"
  full: "50%"
spacing:
  xs: "4px"
  sm: "8px"
  md: "12px"
  stack: "14px"
  gutter: "16px"
  card: "20px"
  desk: "32px"
components:
  button-primary:
    backgroundColor: "{colors.navy}"
    textColor: "{colors.leather-white}"
    typography: "{typography.button}"
    rounded: "{rounded.sm}"
    padding: "13px 18px"
    height: "50px"
  button-primary-hover:
    backgroundColor: "{colors.navy-light}"
  button-soft:
    backgroundColor: "{colors.navy-mist}"
    textColor: "{colors.navy}"
    rounded: "{rounded.sm}"
    padding: "13px 18px"
  button-ghost:
    backgroundColor: "#e9edf3"
    textColor: "{colors.ink-soft}"
    rounded: "{rounded.sm}"
    padding: "13px 18px"
  button-danger:
    backgroundColor: "{colors.state-out-soft}"
    textColor: "{colors.state-out}"
    rounded: "{rounded.sm}"
    padding: "13px 18px"
  card:
    backgroundColor: "{colors.leather-white}"
    textColor: "{colors.ink}"
    rounded: "{rounded.md}"
    padding: "{spacing.card}"
  hero:
    backgroundColor: "{colors.wool}"
    textColor: "{colors.leather-white}"
    rounded: "{rounded.md}"
    padding: "22px"
  input:
    backgroundColor: "{colors.leather-white}"
    textColor: "{colors.ink}"
    typography: "{typography.body}"
    rounded: "{rounded.sm}"
    padding: "12px 14px"
    height: "48px"
  chip:
    backgroundColor: "{colors.leather-white}"
    textColor: "{colors.ink-soft}"
    rounded: "{rounded.sm}"
    padding: "10px 14px"
    height: "44px"
  chip-selected:
    backgroundColor: "{colors.navy}"
    textColor: "{colors.leather-white}"
  numeral-patch:
    backgroundColor: "{colors.navy}"
    textColor: "{colors.leather-white}"
    rounded: "{rounded.full}"
    size: "46px"
  pill-in:
    backgroundColor: "{colors.state-in-soft}"
    textColor: "{colors.state-in}"
    rounded: "{rounded.tag}"
    padding: "3px 9px"
  pill-maybe:
    backgroundColor: "{colors.state-maybe-soft}"
    textColor: "{colors.state-maybe}"
    rounded: "{rounded.tag}"
    padding: "3px 9px"
  pill-out:
    backgroundColor: "{colors.state-out-soft}"
    textColor: "{colors.state-out}"
    rounded: "{rounded.tag}"
    padding: "3px 9px"
  nav:
    backgroundColor: "{colors.wool}"
    textColor: "#97a3bd"
---

# Design System: Hawklets

## Overview

**Creative North Star: "The Letter Jacket"**

The app wears the team's letter jacket. A deep navy wool shell (the rail, the phone header band, the next-game hero, the login field) holds crisp white leather panels set on a cool, navy-tinted ground. One thin line of varsity gold trims the jacket's edges, and every player is identified the way a jacket identifies him: by his varsity numeral, stitched into a felt patch.

The system is calm, sturdy and plainly athletic. It runs dense for coaches (a three-column desktop dashboard, sortable tables, availability grids) and roomy for parents on phones (48-50px touch targets, one task per card, a single save bar). Chest-lettering type, condensed and uppercase, names pages, cards and numbers; everything else reads in an even, friendly sans of the same family. It is explicitly not a grey SaaS dashboard with a blue accent: navy is the material, not the highlight.

Color carries meaning sparingly. Green, amber and red appear only where they say In, Maybe or Out (or done, pending, missing). Gold is trim, never fill.

**Key Characteristics:**
- Navy wool fields for identity and the "what's next" moment; white leather cards for everything you read and edit.
- One gold trim line per field: rail edge, phone header rule, hero top rule, active tab underline, patch ring.
- The stitched numeral patch wherever a player is named.
- One superfamily: Barlow for UI text, Barlow 700 sentence case for titles; Barlow Condensed 700 for numerals and big counts only.
- State colors only where they mean state; tabular numerals everywhere.

## Colors

A two-material palette (navy wool and white leather) on a cool ground, trimmed in one gold, with a strict three-color state vocabulary.

### Primary
- **Varsity Wool** (wool): The jacket shell. Mobile header band, desktop rail, next-game hero, save bar, toast, login field, and the bottom nav. Also the browser theme color.
- **Letterman Navy** (navy): The patch felt and the action color. Primary buttons, selected chips, the numeral patch disc, card and sheet titles, the "me" chat bubble.
- **Light Navy** (navy-light): Hover for primary buttons, input focus border, links.
- **Navy Mist** (navy-mist): Tinted fills for soft buttons, tile icon discs, date blocks, the "yours" pill, and highlighted table rows.

### Secondary
- **Varsity Gold** (varsity-gold): Trim only. The 2px rail edge and phone header rule, the 3px hero top rule, the active coach sub-tab underline, the active nav icon, the patch outer ring, focus outlines and text selection. Never a fill behind text.

### Neutral
- **Cool Ground** (cool-ground): Page background; the navy-tinted surface the leather cards sit on.
- **Leather White** (leather-white): Cards, sheets, inputs, chips, table cells.
- **Ink** (ink): Primary text. **Ink Soft** (ink-soft): secondary text in controls and field labels. **Muted** (muted): meta lines, table headers, empty states.
- **Hairline** (hairline): Dividers between list rows and table rows. **Stitch Line** (stitch-line): input and chip borders, the dashed empty-patch and to-do rings.

### State
- **In** (state-in / state-in-soft), **Maybe** (state-maybe / state-maybe-soft), **Out** (state-out / state-out-soft): Availability segments, count pills, grid cells, saved confirmations, to-do ticks and error text. Soft fills with strong text for passive readouts; solid fills with white text for the selected availability segment.

### Named Rules
**The Gold Trim Rule.** Gold is a line, never a field. It appears as a 1.5-3px rule or ring at the edge of a navy or white material, at most one trim per surface.

**The State Means State Rule.** Green, amber and red are reserved for In / Maybe / Out and done / pending / missing. Nothing decorative may borrow them.

**The Wool Is Material Rule.** Navy wool fills whole regions (rail, header band, hero, save bar); it is not used as a small accent on a grey page.

## Typography

**Display Font:** Barlow Condensed 700 (with Barlow, system-ui)
**Body Font:** Barlow 400-700 (with system-ui, -apple-system, Segoe UI, Roboto)

**Character:** One superfamily in two cuts. The condensed cut is the jacket's numerals: tall, compact, used only for numbers. The regular cut is the coach talking to parents: plain, even and readable on a phone.

### Hierarchy
- **Display** (Barlow 700, 32px, 1.1, -0.02em, sentence case; 28px under 420px): The next game's date in the hero. One per screen.
- **Headline** (Barlow 700, 24px, 1.15, -0.015em, sentence case; 28px on login, 22px under 420px): Page header titles and the desktop rail wordmark.
- **Title** (Barlow 700, 18px, 1.25, -0.01em, sentence case, navy; 21px in sheets): Card and sheet headings.
- **Numeral** (Barlow Condensed 700, 28px stat counts; 25px in the patch; 24px in date blocks; 21px in the number picker): Jersey numbers and big counts.
- **Body** (Barlow 400, 16px, 1.5, tabular figures): All reading text and inputs (16px keeps iOS from zooming).
- **Body small** (Barlow 400-600, 14px): Meta lines, list secondary text, tables.
- **Button** (Barlow 700, 15px, 0.01em; 14px small): Buttons and segmented controls (600, 14px).
- **Label** (Barlow 700, 11-12px, 0.07-0.08em, uppercase, muted): Table column headers and the month line in date blocks only.

### Named Rules
**The Chest Lettering Rule.** The condensed cut is reserved for numerals: jersey patches, the number picker, stat counts and date numbers. Titles and headlines are Barlow 700 in sentence case; all-caps headlines are prohibited.

**The Tabular Rule.** Body text runs `font-variant-numeric: tabular-nums` so counts, dates and fees align in lists and grids.

## Layout

Phone first. The page is a single 720px-max column with 16px gutters, cards stacked at a 14px gap, and bottom padding that clears the fixed 68px nav plus the safe-area inset. Phone gets a full-bleed wool header band with a gold bottom rule, a 3-up tile row, and a fixed bottom nav; save bars and the chat composer float just above the nav.

At 1100px and up, the nav becomes a 232px wool rail on the left with a 2px gold right edge and the "Hawklets" wordmark; the page widens to 1480px with 32px gutters; the header turns into a white leather bar with a hairline bottom. Home becomes a three-column dashboard (`1.1fr / 1fr / minmax(330px, .95fr)`, 18px gap): hero and to-do, player card and schedule, then a sticky full-height chat card. Sheets are bottom sheets on phones and centered dialogs from 640px.

Spacing rhythm is tight and even: 4 / 8 / 12 / 14 / 16 / 20 / 32px, with 20px card padding and 22px hero padding. Touch targets stay at 44px minimum (chips, composer) and 48-50px for inputs and primary buttons.

## Elevation & Depth

Mostly flat leather on a tinted ground, with soft navy-tinted shadows that read as a card resting on cloth. Depth is tonal first (white on cool ground, wool against both); shadows only separate layers.

### Shadow Vocabulary
- **Rest** (`box-shadow: 0 1px 1px rgba(13,26,53,.04), 0 2px 6px rgba(13,26,53,.06)`): Every card, tile, stat strip and chat bubble.
- **Lift** (`box-shadow: 0 6px 18px rgba(13,26,53,.14)`): The hero, hovered tiles, the chat composer.
- **Float** (`box-shadow: 0 12px 30px rgba(13,26,53,.35)`): Save bar and toast, which sit above content.
- **Patch ring** (`box-shadow: 0 0 0 2px #fff, 0 0 0 3.5px var(--gold), 0 2px 5px rgba(13,26,53,.25)`): The numeral patch's white piping and gold ring.

### Named Rules
**The Navy Shadow Rule.** Every shadow is tinted with wool (rgba(13,26,53,…)), never neutral black, except the login card on the wool field.

## Shapes

Gently rounded, sporty rather than soft. Cards, hero, save bar and stat strips use a 14px radius; buttons, inputs, chips and date blocks 10px; pills, countdown tags and grid cells 6px; sheets 18px on their top corners. Circles are reserved for the numeral patch, the number picker, tile icon discs and to-do ticks. Stitching is the recurring texture: a 1.5px dashed ring inside every patch, a dashed divider in the hero, a dashed circle for an empty patch or open to-do.

## Components

### Buttons
Sturdy, full-weight, easy to hit.
- **Shape:** 10px radius, 50px min height (38px small).
- **Primary:** Letterman navy fill, white 15px/700 text, 13px 18px padding.
- **Hover / Active:** Hover to light navy; press scales to 0.98. Focus shows a 2px gold outline at 2px offset.
- **Soft / Ghost / Danger:** Navy mist with navy text for secondary actions ("Go", "Edit"); grey (#e9edf3) with ink-soft text for dismiss; out-soft with out text for destructive actions.
- **On wool (save bar):** White fill with wool text, ghost at 10% white.

### Availability segment
The core family control. A three-part In / Maybe / Out segmented group (10px outer radius, 3px inset, 7px segments). Unselected segments are text only; the selected one fills solid green, amber or red with white text. On the wool hero the track becomes 10% white.

### Chips
- **Style:** White, 1px stitch-line border, 10px radius, 44px min height, 600/14px.
- **State:** Selected fills letterman navy with white text; hover darkens the border to light navy; disabled drops to 35% opacity.

### Pills
- 6px radius, 12px/600, 3px 9px. Grey default; in / maybe / out soft variants for counts and status; navy-mist for "yours" and fee amounts; an optional currentColor dot.

### Cards / Containers
- **Corner Style:** 14px.
- **Background:** Leather white on cool ground.
- **Shadow Strategy:** Rest shadow (see Elevation).
- **Border:** None; list rows inside divide with hairlines.
- **Internal Padding:** 20px, header row with a condensed navy title and an optional trailing pill or soft button.

### Next-game hero
A wool card with a 3px gold top rule and the lift shadow: display date, a bordered countdown tag, a meta line, an 8px white progress bar of players in, then a dashed divider and one row per family player with his patch and the availability segment.

### Inputs / Fields
- **Style:** White, 1px stitch-line border, 10px radius, 12px 14px padding, 48px min height, 16px text. Labels sit above in 600/14px ink-soft with optional muted hint.
- **Focus:** Border to light navy plus a 3px navy halo (rgba(31,58,110,.18)).
- **Error:** Red 600/14px text below.

### Navigation
- **Phone:** Fixed wool bottom bar, icon over 11px label in #97a3bd; active turns white with a gold, heavier-stroke icon. Unread shows a small red dot ringed in wool.
- **Desktop:** 232px wool rail with gold right edge, condensed wordmark, horizontal rows at 15px; active row gets an 8% white fill.
- **Coach sub-tabs:** Horizontal scroll row with a hairline base; active tab navy text over a 3px gold underline.

### Numeral patch (signature)
A navy felt disc with a white condensed numeral, white piping, a gold outer ring and a dashed white stitch ring inside. 46px default, 42px in the header, 34px in rows, 26px in tables. A player with no number shows an empty dashed ring. The number picker reuses the same language: white circles with navy numerals, the chosen one becomes a full patch, taken numbers are struck through on grey.

### Tables and grids (coach)
13-14px, uppercase muted 11px headers, a 2px navy rule under the head, zebra rows at #f8f9fb, navy-mist on hover and for the family's own row, sticky first column. Availability cells are 28x24 soft-state blocks.

## Do's and Don'ts

### Do:
- **Do** put a numeral patch beside every player name, sized to context (46 / 42 / 34 / 26px).
- **Do** use wool for whole regions: rail, phone header band, hero, save bar, toast, login.
- **Do** keep gold to one thin trim per surface (rail edge, header rule, hero top rule, active underline, patch ring, focus outline).
- **Do** set every title in Barlow 700 sentence case. Barlow Condensed is for numerals and counts only.
- **Don't** set headlines in all caps.
- **Do** keep inputs at 16px text and 48px height, primary buttons at 50px, chips at 44px.
- **Do** tint every shadow with wool.

### Don't:
- **Don't** use green, amber or red for anything other than In / Maybe / Out or done / pending / missing.
- **Don't** fill a region or a button with gold, or set text in gold.
- **Don't** introduce a second typeface; the condensed cut is already the display voice.
- **Don't** fall back to a grey page with a blue accent; navy is the material, white leather the surface.
- **Don't** add uppercase eyebrow or kicker lines above titles; uppercase small labels are for table headers and date blocks only.
