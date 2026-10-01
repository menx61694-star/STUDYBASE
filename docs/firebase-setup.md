# StudyBase Firebase backend — Phase 14

## Repository status

- Firebase project: the project exists, according to the project owner.
- Android app registration: pending.
- Authentication planned: Email/Password and Google Sign-In.
- Data services planned: Cloud Firestore and Cloud Storage.
- Push notifications: Firebase Cloud Messaging package is included for later integration.
- Firebase client configuration: not present or verified in this repository.
- Firebase initialization and live sign-in/data operations: **not enabled yet**.

The CI workflow creates a temporary Android scaffold with `flutter create --platforms=android --no-pub .`. It is not committed to the repository. The generated scaffold currently uses Flutter's default example application identifier, so confirm the intended permanent Android application ID before registering the app in Firebase. Do not register an assumed ID.

## Setup using the real Firebase project

1. Decide and confirm the permanent Android application ID.
2. In Firebase Console, register the Android app with that exact ID and download its `google-services.json`.
3. In an environment with FlutterFire CLI and Firebase CLI installed, run `flutterfire configure` for the project and required platforms. This must generate the real `lib/firebase_options.dart`; never hand-write fake project IDs, app IDs, API keys, or sender IDs.
4. Place the generated client configuration in the expected locations. Verify whether `google-services.json` should be committed based on repository visibility and project policy; never commit service-account private keys.
5. Enable Email/Password and Google providers in Firebase Authentication. Configure the Android SHA fingerprints and Google OAuth settings required by Google Sign-In.
6. Create the Firestore database and Storage bucket in the intended region.
7. Review and test `firestore.rules` and `storage.rules` against the final collection/path schema before deployment. The current rules intentionally deny all client access; do not loosen them to public read/write.
8. Only after valid configuration exists, initialize Firebase before `runApp` and implement Auth, Firestore, Storage, and FCM flows.
9. Test sign-up, sign-in, Google Sign-In, sign-out, password reset, unauthorized access denial, authorized user data access, file upload/download, and notification permission/token handling.

## Important safety notes

- Do not use client-side role flags as authorization. Any admin privileges must be enforced by trusted Firebase Security Rules using verified claims or another server-controlled mechanism.
- Do not store passwords or private credentials in SharedPreferences.
- Do not describe local profile/preferences or sample notes as cloud-synced data.
- Keep rules default-deny until the actual schema and ownership checks are in place.

## Current implementation boundary

This phase adds the Firebase SDK dependencies and fail-closed rules/configuration scaffolding. It does not claim a live Firebase connection: Android registration and project-specific client configuration are still prerequisites. The app must remain buildable before those project-specific files are supplied.
