
# 🎯 Project Overview

Urban runners and cyclists often struggle to find routes that are not only efficient but also safe and reliable. **SafeStride** addresses this gap by offering a centralized, community-verified platform for route discovery and safety feedback.

* **Sprint Duration:** Feb 10 – Mar 9, 2026 (4 weeks)
* **Current Status:** MVP Development
* **Team Members:** Shankar, Lithish, Dhanya

---

## 🚨 Problem Statement

Urban athletes face several challenges:

* Lack of reliable safety information for running and cycling routes
* No centralized platform for community-verified route data
* Uncertainty around lighting, traffic levels, and surface quality
* Time wasted exploring unfamiliar or unsafe areas

**SafeStride** solves this by enabling users to discover, review, and contribute routes enriched with real-world safety insights.

---

## ✨ Features

### ✅ MVP (Must-Have)

#### 🔐 Authentication & User Profile

* Email & password authentication
* Basic profile management
* Activity preference selection (Running / Cycling)

#### 🗺 Route Discovery

* Interactive map with nearby routes
* Filters by activity type, distance, and difficulty
* Route details:

  * Distance
  * Elevation
  * Safety rating
* Real-time GPS location tracking

#### ⭐ Community Reviews

* 5-star safety rating system
* Text-based reviews
* Safety indicators:

  * Surface condition
  * Traffic levels
  * Lighting quality
* Time-of-day safety insights

#### ➕ Route Submission

* GPS-based route recording
* Route metadata:

  * Name
  * Description
  * Difficulty
* Initial safety review at submission
* Real-time route visualization on map

---

### 🔮 Nice-to-Have (Future Enhancements)

* Route photos and media uploads
* Favorites & bookmarks
* Search by route name or location
* Personal activity history
* Offline access to saved routes

---

## 🛠 Tech Stack

### Frontend

* **Flutter 3.x** – Cross-platform mobile development
* **Provider / Riverpod** – State management
* **Google Maps Flutter** – Map rendering and interaction
* **Geolocator** – GPS tracking and location services

### Backend

* **Firebase Authentication** – User authentication
* **Cloud Firestore** – NoSQL database
* **Firebase Storage** – Media storage (future use)
* **Firebase Security Rules** – Secure data access

### Development Tools

* **GitHub** – Version control and collaboration
* **VS Code / Android Studio** – Development IDEs
* **Figma** – UI/UX design
* **Flutter Test** – Unit and widget testing

---

## 🚀 Getting Started

### 📋 Prerequisites

Ensure you have the following installed:

* Flutter SDK 3.x or higher
* Dart SDK 3.x or higher
* Android Studio or Xcode (for emulators)
* Firebase account
* Google Cloud Platform account (for Maps API)

---

### 📦 Installation

#### 1️⃣ Clone the Repository

```bash
git clone https://github.com/your-org/safestride.git
cd safestride
```

#### 2️⃣ Install Dependencies

```bash
flutter pub get
```

---

## 🔥 Firebase Setup

1. Create a Firebase project at:

   * [https://console.firebase.google.com](https://console.firebase.google.com)
2. Add Android and iOS apps to the project
3. Download configuration files:

   * `google-services.json` (Android)
   * `GoogleService-Info.plist` (iOS)
4. Place the files in:

   * `android/app/`
   * `ios/Runner/`
5. Enable **Email/Password Authentication** in Firebase Console
6. Create a **Cloud Firestore** database in production mode

---

## 🗺 Google Maps Setup

1. Go to **Google Cloud Console**
2. Enable:

   * Maps SDK for Android
   * Maps SDK for iOS
3. Generate API keys
4. Add API keys to:

   * `android/app/src/main/AndroidManifest.xml`
   * `ios/Runner/AppDelegate.swift`

---

## 🧪 Testing

Run unit and widget tests using:

```bash
flutter test
```
# Introduction to Flutter and Dart

## Project Structure

lib/
├── main.dart
├── screens/
├── widgets/
├── models/
├── services/

### Directory Purpose

- **main.dart**  
  Entry point of the application. Initializes the app and loads the first screen.

- **screens/**  
  Contains full UI screens such as WelcomeScreen, LoginScreen, etc.

- **widgets/**  
  Reusable UI components shared across screens (buttons, cards, custom inputs).

- **models/**  
  Data models used for handling structured data.

- **services/**  
  Business logic, API calls, and Firebase integration (future use).

### Modular Design Benefits
This structure separates concerns, improves readability, and allows the app to scale without becoming cluttered.

### Naming Conventions
- Files: `snake_case.dart`
- Classes & Widgets: `PascalCase`
- Variables & functions: `camelCase`


## 📱 Responsive Home Screen Implementation – SafeStride

In this sprint, I implemented a responsive home screen for the SafeStride app using Flutter. I created a new screen called `responsive_home.dart` inside the screens directory. The layout includes a header, main content section, and a footer button. I used `MediaQuery` to detect the screen width and determine whether the device is a phone or tablet. Based on the screen size, the app displays a ListView layout for phones and a GridView layout for tablets.

I used flexible widgets like `Expanded`, `Container`, and `GridView` to ensure the UI adjusts properly without overflow. Padding and text sizes were also adjusted dynamically to maintain consistency across devices. The screen was tested in both portrait and landscape orientations using emulators. This implementation ensures that SafeStride provides a consistent and user-friendly experience across different screen sizes and device types.


# Flutter Environment Setup and First App Run

## Overview

This document verifies the successful installation and configuration of the Flutter development environment and the execution of the first Flutter application on an emulator.

---

## 1. Flutter SDK Installation

**Steps Followed:**

* Downloaded Flutter SDK from the official website.
* Extracted it to: `C:\src\flutter` (Windows) / preferred development directory.
* Added `flutter\bin` to system PATH.
* Verified installation using:

```
flutter doctor
```

* Resolved any missing dependencies reported by Flutter Doctor.

---

## 2. IDE Setup

**Android Studio Installation**

* Installed Android Studio.
* Installed required components:

  * Android SDK
  * SDK Platform Tools
  * AVD Manager
* Installed Flutter and Dart plugins via Plugin Marketplace.

---

## 3. Emulator Configuration

* Opened AVD Manager.
* Created a virtual device (e.g., Pixel 6).
* Installed Android 13 system image.
* Launched emulator.
* Verified device detection:

```
flutter devices
```

---

## 4. First Flutter App Execution

Created a new Flutter project:

```
flutter create first_flutter_app
cd first_flutter_app
flutter run
```

The default Flutter counter app successfully ran on the emulator.

---

## Setup Verification

### 1. Flutter Doctor Output

(Add screenshot here showing all green checkmarks)

### 2. Running App on Emulator

(Add screenshot here showing default counter app running)

---

## Reflection

During setup, common challenges included environment variable configuration and SDK dependency resolution. Running `flutter doctor` helped identify and fix issues quickly.

This setup establishes a complete local mobile development environment, enabling real-time app development, debugging, and future Firebase integration.



Documentation file:
PROJECT_STRUCTURE.md

The structure includes:

- lib/ → Main app logic
- android/ → Android build files
- ios/ → iOS build files
- test/ → Testing files
- pubspec.yaml → Dependency management
- assets/ → Images and static resources

Understanding this structure helps build scalable and maintainable Flutter apps.