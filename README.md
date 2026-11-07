# GossipVault Spike: Build Instructions

This is the first buildable step: a memory-measurement app with the
memory guard and tier logic, but no AI, voice, or avatar. Its job is to
produce the Scenario A baseline on your real 4 GB and 6 GB phones.

Status: the Dart tier logic and its tests are straightforward. The Kotlin
file uses standard Android APIs. I have not compiled this project, so
expect to fix small issues on your first build.

## 1. Prerequisites

- Flutter stable (3.22+), with `flutter doctor` passing for Android
- Android SDK with platform 34 and build-tools
- A physical Android phone with USB debugging enabled

## 2. Create the project and apply the files

```bash
flutter create --org com.gossipvault --project-name gossipvault gossipvault
cd gossipvault
# Copy this folder's lib/, test/, and pubspec.yaml over the generated ones.
cp -r /path/to/gossipvault_spike/lib /path/to/gossipvault_spike/test .
cp /path/to/gossipvault_spike/pubspec.yaml .
# Replace the generated MainActivity with the overlay file.
cp /path/to/gossipvault_spike/android_overlay/app/src/main/kotlin/com/gossipvault/gossipvault/MainActivity.kt \
   android/app/src/main/kotlin/com/gossipvault/gossipvault/MainActivity.kt
flutter pub get
```

If `flutter create` produces a different package name, update the
`package` line in MainActivity.kt and the `dumpsys` command below to match.

## 3. Test and build

```bash
flutter test
flutter build apk --release --split-per-abi
```

Outputs are in `build/app/outputs/flutter-apk/`. Use the `arm64-v8a`
APK for modern phones.

## 4. Install and measure Scenario A

```bash
adb install -r build/app/outputs/flutter-apk/app-arm64-v8a-release.apk
adb shell am start -n com.gossipvault.gossipvault/.MainActivity
adb shell dumpsys meminfo com.gossipvault.gossipvault | grep -E "TOTAL PSS|TOTAL"
```

Record for each phone: total RAM, available RAM, low-RAM flag, resolved
tier, and the PSS total. Repeat with two or three apps open in the
background to see how available memory changes.

## 5. What comes next

1. Add the llama.cpp native bridge (`loadLlm`, `unloadLlm`, streaming generate).
2. Add a Scenario B test: load Qwen3 0.6B Q4_K_M from device storage and
   measure peak PSS over 30 turns.
3. Add ASR and TTS one at a time, then the avatar, following the validation
   gate in the architecture plan.

Do not add voice or avatar features before the Scenario B numbers are in.

## 6. Build in the cloud with GitHub Actions (no local SDK needed)

1. Create a new GitHub repository, for example `gossipvault-spike`.
2. Unzip `gossipvault_spike.zip` and push the contents of the
   `gossipvault_spike/` folder to the repo's `main` branch. The
   `.github/workflows/build-apk.yml` file must sit at the repo root.
3. Open the repo's **Actions** tab. The "Build APK" workflow runs on push.
   You can also start it manually with **Run workflow**.
4. When it finishes, download the `gossipvault-spike-apks` artifact.
   Pick `app-arm64-v8a-release.apk` for modern phones.
5. Copy the APK to the phone, or install it with `adb install -r`.

The workflow generates `android/` on the runner, so the repo does not need
it committed. If the build fails, open the failing step's log first; the
most likely causes are a Flutter version change or a Gradle mismatch.

## 7. Suggested tool roles

- **GitHub Actions:** builds, tests, and produces the APK. This is the
  source of truth for the build.
- **Google Stitch:** explore screen layouts for the diary and avatar
  studio. Treat its exported code as a reference, not production code.
  Any generated UI must still respect the avatar and image-cache budgets
  in the architecture plan.
- **Hugging Face:** the source of the model files. Download Qwen3 0.6B
  GGUF only when starting Scenario B. Confirm each file's license on its
  model page before shipping it, and store model files outside the repo.
- **ChatGPT or other assistants:** useful for reviewing a diff or a
  specific error log. Give them the actual log, not a summary.
