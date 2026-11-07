# GossipVault

Private, offline-first diary and AI companion. Current build: Stitch
"Obsidian Sanctuary" UI, five-tab navigation, and the device-memory spike
in the Vault tab. No AI, voice, or diary storage yet.

## Layout (repo root)

```
.github/workflows/build-apk.yml
android_overlay/…/MainActivity.kt
assets/images/        logo and launcher icon PNGs
assets/fonts/         Plus Jakarta Sans and Inter (see README.txt there)
docs/design/          DESIGN.md and the Home reference screen
lib/                  app code
test/                 unit tests
pubspec.yaml
```

Extract the zip's CONTENTS into your repo folder. Do not nest it in a subfolder.

## Fonts (optional, recommended)

Download Plus Jakarta Sans and Inter from Google Fonts into `assets/fonts/` as
described in that folder's README.txt, then uncomment the `fonts:` block in
`pubspec.yaml`. Without them the app uses the platform font.

## Build

Push to `main`. The workflow verifies the layout, generates launcher icons,
runs analysis and tests, and builds split APKs. Download the
`gossipvault-apks-<sha>` artifact.

## Measure (Scenario A baseline)

```bash
adb install -r app-arm64-v8a-release.apk
adb shell dumpsys meminfo com.gossipvault.gossipvault | grep -E "TOTAL PSS|TOTAL"
```

Record total RAM, available RAM, low-RAM flag, resolved tier, and TOTAL PSS,
in the foreground and with two or three apps open behind it. Read the numbers
on the Vault tab.

## Design notes

- Colors and radii come from `docs/design/DESIGN.md`, prose values (canvas
  `#08080B`, lavender `#B9A3F2`, ivory `#F5F0E8`). The YAML header in that file
  lists different neutrals; the prose was used where they conflict.
- Stitch's exported HTML was not used as app code. Its icon names rendered as
  text in the reference screenshot, and its logo link was broken, so icons come
  from Flutter's Material set and the logo comes from the uploaded asset.
