# StudyBase Firebase backend — Phase 14

## Repository status

- Firebase project: the project exists, according to the project owner.
- Permanent Android application ID: `com.studybase.pixelforge` (confirmed by the project owner).
- Android app registration in Firebase: pending.
- Authentication planned: Email/Password and Google Sign-In.
- Data services planned: Cloud Firestore and Cloud Storage.
- Push notifications: Firebase Cloud Messaging package is included for later integration.
- Firebase client configuration: not present or verified in this repository.
- Firebase initialization and live sign-in/data operations: **not enabled yet**.

The repository does not commit an Android platform directory. CI generates a temporary Android scaffold, then sets its `applicationId` to the confirmed permanent ID and verifies the value. The same exact ID must be used when registering the Android app in Firebase Console.

## Setup using the real Firebase project

1. In Firebase Console, register the Android app with package/application ID `com.studybase.pixelforge` and download its actual `google-services.json`.
2. In an environment with FlutterFire CLI and Firebase CLI installed, run `flutterfire configure` for the existing Firebase project and required platforms. This must generate the real `lib/firebase_options.dart`; never hand-write fake project IDs, app IDs, API keys, or sender IDs.
3. Supply the generated configuration in the expected locations. Verify whether `google-services.json` should be committed based on repository visibility and project policy; never commit service-account private keys.
4. Enable Email/Password and Google providers in Firebase Authentication. Configure the Android SHA fingerprints and Google OAuth settings required by Google Sign-In.
5. Create the Firestore database and Storage bucket in the intended region.
6. Review and test `firestore.rules` and `storage.rules` against the final collection/path schema before deployment. The current rules intentionally deny all client access; do not loosen them to public read/write.
7. Only after valid configuration exists, initialize Firebase before `runApp` and implement Auth, Firestore, Storage, and FCM flows.
8. Test sign-up, sign-in, Google Sign-In, sign-out, password reset, unauthorized access denial, authorized user data access, file upload/download, and notification permission/token handling.

## Important safety notes

- Do not use client-side role flags as authorization. Any admin privileges must be enforced by trusted Firebase Security Rules using verified claims or another server-controlled mechanism.
- Do not store passwords or private credentials in SharedPreferences.
- Do not describe local profile/preferences or sample notes as cloud-synced data.
- Keep rules default-deny until the actual schema and ownership checks are in place.

## Current implementation boundary

This phase currently includes Firebase SDK dependencies, fail-closed rules/configuration scaffolding, and the confirmed Android application ID in the CI-generated Android scaffold. It does not claim a live Firebase connection: Firebase Console registration and real project-specific client configuration are still prerequisites. The app must remain buildable before those project-specific files are supplied.
