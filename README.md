# Fit Track Pro

**Fit Track Pro** is a modern, offline-capable health and fitness tracker built using Flutter. It helps users monitor and log their daily fitness journey securely with features like onboarding walkthroughs, secure authentication, local data storage, and more.

<<<<<<< HEAD
## 📹 Video Demo

![Fit Track Pro Demo](./releases/fit-track-pro-demo.mp4)

**📱 [Download Demo Video](./releases/fit-track-pro-demo.mp4)** | **🎬 [View Full Demo](https://github.com/princeteck/fit-track-pro/raw/main/releases/fit-track-pro-demo.mp4)**

=======
>>>>>>> cd47df9ce77a4f695ae9a453c98c06b363a6a8a6
## Latest Build
[📱 Download Release APK](./releases/app-release.apk)

---

## 🚀 Features

- 🧭 Custom Splash & Onboarding Walkthrough
- 🔐 Login / Registration (Email, Social, OTP)
- 📊 Daily Health & Fitness Tracking
- 📥 Offline Access via **SQLite** or **Hive**
- 🧑‍💼 Profile & Settings Screen
- 🔔 Notification Center (Reminders / Alerts)
- 🎯 Gamified Progress Tracking (Streaks, Points)

---

## 🧱 Screens Overview

| Screen              | Description                                      |
|---------------------|--------------------------------------------------|
| Walkthrough         | Initial app tour with feature highlights         |
| Login / Register    | Auth flow with multiple options                  |
| Home Dashboard      | Central hub showing progress, goals, and logs    |
| History / Records   | View past logs stored locally (offline access)   |
| Settings / Profile  | Manage account details, preferences, security    |
| Notifications       | View reminders, alerts, and health nudges        |

---

## 📦 Local Data Storage

The app uses either:
- **Hive** (for fast key-value access)
- or **SQLite** (for structured health records)

Encrypted storage is used for user-sensitive data to ensure privacy.

---

## 🛠️ Setup Instructions

### 1. Clone the repo
```bash
git clone https://github.com/princeteck/fit-track-pro.git
cd fit-track-pro
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Run the app
```bash
flutter run
```

> Make sure your Flutter version is managed via `puro` or a compatible SDK (e.g., 3.32.7).

---

## 📱 Releases & APK Downloads

### Latest Release APK
You can download the latest release APK from the [`releases/`](releases/) directory:
- **Latest**: [`app-release.apk`](releases/app-release.apk)

### Building Release APK
To build and generate a release APK:

```bash
# Automated build script
./scripts/build-release.sh

# Manual build
flutter build apk --release
cp build/app/outputs/flutter-apk/app-release.apk releases/app-release.apk
```

### Installation Instructions
1. Download the APK file
2. Enable "Unknown Sources" in Android settings
3. Install the APK by tapping on it

> **Note**: APK files are for testing and internal distribution only.

---

## 🧪 Coming Soon

- Data export/import
- Third-party fitness device sync
- Rewards and achievements system
- Cloud backup for premium users

---

## Note:
- Data, readings and auth functionalities are mocked. please take a note of the same. 

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙌 Credits

Made with ❤️ by [Prince Sonawane](https://github.com/princeteck)