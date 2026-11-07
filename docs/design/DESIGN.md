---
name: Obsidian Sanctuary
colors:
  surface: '#131316'
  surface-dim: '#131316'
  surface-bright: '#39393c'
  surface-container-lowest: '#0e0e11'
  surface-container-low: '#1b1b1f'
  surface-container: '#201f23'
  surface-container-high: '#2a292d'
  surface-container-highest: '#353438'
  on-surface: '#e5e1e6'
  on-surface-variant: '#cac4d1'
  inverse-surface: '#e5e1e6'
  inverse-on-surface: '#303034'
  outline: '#948e9b'
  outline-variant: '#494550'
  surface-tint: '#cfbcff'
  primary: '#d3c1ff'
  on-primary: '#372269'
  primary-container: '#b9a3f2'
  on-primary-container: '#4a367c'
  inverse-primary: '#66529a'
  secondary: '#d1bcff'
  on-secondary: '#391f6f'
  secondary-container: '#513787'
  on-secondary-container: '#c2a7ff'
  tertiary: '#cfcac3'
  on-tertiary: '#32302b'
  tertiary-container: '#b3afa8'
  on-tertiary-container: '#44423d'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#e9ddff'
  primary-fixed-dim: '#cfbcff'
  on-primary-fixed: '#220853'
  on-primary-fixed-variant: '#4e3a81'
  secondary-fixed: '#eaddff'
  secondary-fixed-dim: '#d1bcff'
  on-secondary-fixed: '#24015a'
  on-secondary-fixed-variant: '#513787'
  tertiary-fixed: '#e7e2da'
  tertiary-fixed-dim: '#cac6be'
  on-tertiary-fixed: '#1d1c17'
  on-tertiary-fixed-variant: '#494741'
  background: '#131316'
  on-background: '#e5e1e6'
  surface-variant: '#353438'
typography:
  display-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 40px
    fontWeight: '600'
    lineHeight: 48px
    letterSpacing: -0.02em
  display-lg-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 38px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 28px
    fontWeight: '600'
    lineHeight: 34px
    letterSpacing: -0.015em
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 22px
    fontWeight: '500'
    lineHeight: 28px
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '500'
    lineHeight: 24px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
  label-lg:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 18px
    letterSpacing: 0.01em
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.02em
  label-sm:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 14px
    letterSpacing: 0.04em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-tablet: 1.5rem
  margin: 1rem
  margin-tablet: 2rem
  margin-desktop: 3rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

This design system establishes an intimate, whisper-quiet luxury sanctuary for personal confessions, social chronicles, and private observations. Balancing the gravity of an encrypted digital safe with the delicate softness of an exclusive journal, the aesthetic rejects sensory overload in favor of tranquil, high-assurance tactility.

The style converges **Minimalism** with **Tonal Layering** and **Subtle Structural Framing**:
- **Confidential & Restrained:** Surfaces feel heavy, matte, and shielded. No excessive glowing neons or generic gradient fills.
- **Warm Tactility:** Offset from cold tech palettes by warm ivory lettering and gentle lavender accents, creating an approachable, journal-like intimacy.
- **Android First-Class Native:** Tailored for Android edge-to-edge layouts, respectful of dynamic gestures, high-density OLED black conservation, and precision physical tap states.

## Colors

The palette directly honors the emblem's nocturnal aesthetic: deep void tones layered beneath parchment white and soft purple highlights.

### Palette Architecture
- **Primary Accent (`#B9A3F2` - Soft Lavender):** Used for focal interactive touchpoints, active states, key security badges, and critical calls-to-action.
- **Secondary Accent (`#9278CC` - Muted Lavender):** Applied to supporting iconography, focused borders, subtle selection fills, and category signifiers.
- **Tertiary Tone (`#F5F0E8` - Warm Ivory):** The primary reading ink. Delivers exceptional readability without the optical harshness of pure white on pitch-black backdrops.
- **Neutral Base Stack:**
  - `Canvas Midnight`: `#08080B` (Root screen background, pure OLED power-efficiency)
  - `Secondary Surface`: `#121216` (Sheet backgrounds, recessed containers, search bars)
  - `Primary Surface`: `#19191F` (Standard card and list row surfaces)
  - `Elevated Surface`: `#222229` (Floating dialogs, bottom sheets, context menus)
  - `Subtle Stroke`: `#333139` (1px non-distracting containment lines)
  - `Muted Secondary Ink`: `#B8B4BD` (Metadata, timestamps, passive hints)

## Typography

The typographic pairing balances the sculptural modernity of Plus Jakarta Sans for titles and headlines with the clinical, neutral legibility of Inter for continuous reading and sensitive diary entries.

- **Headlines & Titles:** Set with tighter tracking to mirror the geometric precision of the vault lockup.
- **Editorial Body:** Calibrated line heights (1.5x) ensure effortless reading during extended journal entries or message reviews.
- **Numbers & Vault Metrics:** When presenting PINs, countdown locks, or encrypted token counts, utilize tabular figures (`tnum`) in Inter.

## Layout & Spacing

A strictly rational 4dp/8dp spatial grid governs spacing, engineered specifically around Android handheld usability:

- **Mobile First Focus:** Fluid single-column layouts on phones with an outer margin of `16px` (`margin`), guaranteeing thumb comfort. Bottom navigational controls and floating vault triggers respect Android system navigation bars and gesture insets.
- **Tablet Expansion:** Adapts to a split dual-pane layout at `600dp+` (e.g., left navigation/vault index, right active story/decrypted note), with outer margins expanding to `2rem` (`32px`) and gutters expanding to `1.5rem` (`24px`).
- **Internal Component Rhythm:** Structural elements prioritize breathing room. Sensitive text cards leverage `16px` or `20px` internal padding to prevent visual clutter and maintain private readability.

## Elevation & Depth

Rather than conventional harsh dropshadows, this design system achieves spatial separation through **tonal elevation combined with micro-borders**:

- **Level 0 (Canvas):** `#08080B`. Base background layer. Zero borders.
- **Level 1 (Structural Inset):** `#121216`. Subdued background for input fields, search filters, and segregated tab strips.
- **Level 2 (Standard Surface Cards):** `#19191F`. Bounded by a 1px border of `#333139`. Shadows are strictly restrained: an ambient drop of `0px 2px 8px rgba(0, 0, 0, 0.45)`.
- **Level 3 (Interactive Lift / Overlays):** `#222229`. Modal bottom sheets, contextual popovers, and floating action pods. Bounded by a 1px border of `#333139` with an ambient glow of `0px 8px 24px rgba(0, 0, 0, 0.6)`.
- **Security Lock Effect:** For active biometric or PIN prompts, backdrop dimming uses `#08080B` at 80% opacity with an 8px hardware blur.

## Shapes

The geometric silhouette reflects the branded vault shield: sturdy, defensive, but subtly curved at vertices to convey warmth and privacy.

- **Standard Containers (`0.5rem` / `8px`):** Used for inputs, compact chips, and auxiliary action buttons.
- **Content Cards & Panels (`1rem` / `16px`):** Standard for cards, story entries, and note vaults.
- **Bottom Sheets & Modal Pods (`1.5rem` / `24px`):** Top corners of pull-up drawers and dialogue surfaces.
- **Pill Geometry:** Reserved strictly for lock status pills, private category badges, and quick-filter switches.

## Components

### Buttons
- **Primary Action (Vault Unlock / Save):** Filled `#B9A3F2` background with `#08080B` bold text. Minimum tap height of `48px` to guarantee Android touch compliance. `rounded-lg` (16px) corners. Active touch states exhibit a gentle micro-scale of `0.98` and a transition to `#9278CC`.
- **Secondary Action (Cancel / Hide):** `#19191F` surface with 1px `#333139` stroke and `#F5F0E8` Warm Ivory text.
- **Ghost Action:** Pure transparent background with `#B9A3F2` text, used for non-essential links.

### Input Fields & PIN Entry
- **Base Style:** `#121216` background, 1px `#333139` border, `8px` radius. Internal text is `#F5F0E8` with placeholder in `#B8B4BD`.
- **Focused State:** 1.5px border of `#B9A3F2` accompanied by a soft, diffused lavender ambient glow (`0px 0px 8px rgba(185, 163, 242, 0.15)`).
- **Secure PIN Dots:** 12px circular indicators transitioning from `#333139` (empty) to `#B9A3F2` (filled).

### Cards & Vault Stories
- Built on `#19191F` with 1px `#333139` borders.
- Header area integrates a discreet lock status icon (`#9278CC`) aligned with Warm Ivory headlines.
- Encrypted/Blurred content previews utilize CSS/RenderNode backdrop-filter blur (`12px`) over `#121216` panels.

### Chips & Tags
- **Selection Chips:** Pill-shaped with `#121216` surface and `#333139` stroke. When active, fills with `#9278CC` at 20% opacity and `#B9A3F2` border/text.
- **Classification Badges:** Tiny uppercase label (`label-sm`) with soft lavender tint for vault classification ("Confidential", "Rumor", "Archived").

### Checkboxes & Switches
- **Checkboxes:** 20px rounded squares (`4px` radius) with `#333139` borders. On checked: filled with `#B9A3F2`, containing a checkmark in `#08080B`.
- **Android Switches:** Track in `#19191F` (active: `#9278CC`), thumb in `#B8B4BD` (active: `#F5F0E8`).

### Android-Specific Elements
- **Bottom Navigation Bar:** Grounded in `#08080B` with top border 1px `#19191F`. Active icons rendered in `#B9A3F2` with subtle dot indicator underneath; inactive icons in `#B8B4BD`.
- **Biometric Unlock Sheet:** Pulls up from the bottom with `24px` top corners, elevated at `#222229` with fingerprint sensor indicator in glowing Soft Lavender.