# Firebase backend setup

Firebase integration must use project-specific configuration generated for the actual Firebase project. Do not commit service-account keys, private credentials, or a fabricated `firebase_options.dart`.

## Required setup before enabling the backend

1. Create a Firebase project and register the Android application using the exact Android application ID from `android/app/build.gradle` or `android/app/build.gradle.kts`.
2. Install FlutterFire CLI in a development environment with Flutter and Firebase CLI available.
3. Run `flutterfire configure` for the selected project and platforms. This generates the project-specific `lib/firebase_options.dart`.
4. Add and configure the required packages: `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, and `firebase_messaging`.
5. Initialize Firebase before `runApp` using `DefaultFirebaseOptions.currentPlatform`.
6. Configure Firebase Authentication providers, Firestore security rules, Storage rules, and Android notification permissions.
7. Test sign-up, sign-in, password reset, authorized data access, file access, and notification delivery against the configured project.

## Current status

The app currently has local profile/preferences and UI-level authentication only. Firebase is **not connected** because this repository does not yet contain verified project configuration. Do not present local profile data or sample practice content as cloud-synced user data. Backend work can be enabled after the project configuration and rules are supplied and verified.
