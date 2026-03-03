# 🎯 Project Overview

Urban runners and cyclists often struggle to find routes that are not only efficient but also safe and reliable. **SafeStride** addresses this gap by offering a centralized, community-verified platform for route discovery and safety feedback.

**Sprint Duration:** Feb 10 – Mar 9, 2026 (4 weeks)
**Current Status:** MVP Development
**Team Members:** Shankar, Lithish, Dhanya

---

## 🚨 Problem Statement

Urban athletes face several challenges:

Lack of reliable safety information for running and cycling routes
No centralized platform for community-verified route data
Uncertainty around lighting, traffic levels, and surface quality
Time wasted exploring unfamiliar or unsafe areas

**SafeStride** solves this by enabling users to discover, review, and contribute routes enriched with real-world safety insights.

---

## ✨ Features

### ✅ MVP (Must-Have)

#### 🔐 Authentication & User Profile

Email & password authentication
Basic profile management
Activity preference selection (Running / Cycling)

#### 🗺 Route Discovery

Interactive map with nearby routes
Filters by activity type, distance, and difficulty
Route details:

  * Distance
  * Elevation
  * Safety rating
Real-time GPS location tracking

#### ⭐ Community Reviews

5-star safety rating system
Text-based reviews
Safety indicators:

  * Surface condition
  * Traffic levels
  * Lighting quality
Time-of-day safety insights

#### ➕ Route Submission

GPS-based route recording
Route metadata:

  * Name
  * Description
  * Difficulty
Initial safety review at submission
Real-time route visualization on map

---

### 🔮 Nice-to-Have (Future Enhancements)

Route photos and media uploads
Favorites & bookmarks
Search by route name or location
Personal activity history
Offline access to saved routes

---

## 🛠 Tech Stack

### Frontend

**Flutter 3.x** – Cross-platform mobile development
**Provider / Riverpod** – State management
**Google Maps Flutter** – Map rendering and interaction
**Geolocator** – GPS tracking and location services

### Backend

**Firebase Authentication** – User authentication
**Cloud Firestore** – NoSQL database
**Firebase Storage** – Media storage (future use)
**Firebase Security Rules** – Secure data access

### Development Tools

**GitHub** – Version control and collaboration
**VS Code / Android Studio** – Development IDEs
**Figma** – UI/UX design
**Flutter Test** – Unit and widget testing

---

## 🚀 Getting Started

### 📋 Prerequisites

Ensure you have the following installed:

Flutter SDK 3.x or higher
Dart SDK 3.x or higher
Android Studio or Xcode (for emulators)
Firebase account
Google Cloud Platform account (for Maps API)

---

### 📦 Installation

#### 1️⃣ Clone the Repository

bash
git clone https://github.com/your-org/safestride.git
cd safestride

#### 2️⃣ Install Dependencies

bash
flutter pub get

---

## 🔥 Firebase Setup

1. Create a Firebase project at:

   * [https://console.firebase.google.com](https://console.firebase.google.com)
2. Add Android and iOS apps to the project
3. Download configuration files:

   * google-services.json (Android)
   * GoogleService-Info.plist (iOS)
4. Place the files in:

   * android/app/
   * ios/Runner/
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

   * android/app/src/main/AndroidManifest.xml
   * ios/Runner/AppDelegate.swift

---

## 🧪 Testing

Run unit and widget tests using:

bash
flutter test
# Introduction to Flutter and Dart

## Project Structure

lib/
├── main.dart
├── screens/
├── widgets/
├── models/
├── services/

### Directory Purpose

**main.dart**  
  Entry point of the application. Initializes the app and loads the first screen.

**screens/**  
  Contains full UI screens such as WelcomeScreen, LoginScreen, etc.

**widgets/**  
  Reusable UI components shared across screens (buttons, cards, custom inputs).

**models/**  
  Data models used for handling structured data.

**services/**  
  Business logic, API calls, and Firebase integration (future use).

### Modular Design Benefits
This structure separates concerns, improves readability, and allows the app to scale without becoming cluttered.

### Naming Conventions
Files: snake_case.dart
Classes & Widgets: PascalCase
Variables & functions: camelCase

## Widget Tree Concept

In Flutter, everything is a widget — text, buttons, containers, and even layouts.

Widgets are arranged in a tree structure, known as the widget tree, where each node represents a part of the UI.

The root of the tree is usually the MaterialApp or CupertinoApp widget, followed by nested child widgets.

### Example Widget Tree Structure

MaterialApp
 ┣ initialRoute: '/'
 ┣ routes: {...}
 ┗ home: WelcomeScreen
      ┣ Scaffold
      ┃  ┣ AppBar
      ┃  ┃  ┗ Text('SafeStride')
      ┃  ┗ Body
      ┃     ┗ Center
      ┃        ┗ Column
      ┃           ┣ Text('Welcome to SafeStride!')
      ┃           ┣ Icon(Icons.directions_walk)
      ┃           ┣ ElevatedButton('Toggle State')
      ┃           ┗ Column (Demos)
      ┃              ┣ Text('Flutter Learning Demos:')
      ┃              ┣ ElevatedButton('Widget Tree Demo')
      ┃              ┣ ElevatedButton('Profile Card Demo')
      ┃              ┗ ElevatedButton('Counter App Demo')

### Widget Tree for Counter App Demo

Scaffold
 ┣ AppBar
 ┃  ┗ Text('Counter App Demo')
 ┗ Body
    ┗ Container (with gradient)
       ┗ Center
          ┗ Column
             ┣ Text('Counter App Demo')
             ┣ Container (display box)
             ┃  ┗ Text(displaying count)
             ┣ Row (controls)
             ┃  ┣ FloatingActionButton(decrement)
             ┃  ┣ FloatingActionButton(reset)
             ┃  ┗ FloatingActionButton(increment)
             ┗ Container (instructions)
                ┗ Text(explanation of reactive UI)

## Reactive UI Model

Flutter's UI is reactive, meaning that when data (state) changes, the framework automatically rebuilds the affected widgets.

The UI is not manually redrawn; instead, Flutter efficiently re-renders only what needs updating.

### Example using setState():

dart
class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reactive UI Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: $count'),
            ElevatedButton(onPressed: increment, child: Text('Increment')),
          ],
        ),
      ),
    );
  }
}

Every time the button is pressed, the state changes (count++), and Flutter rebuilds the relevant parts of the widget tree.

## Interactive Elements Demonstrating State Updates

The SafeStride app includes several examples that demonstrate state updates:

1. **Welcome Screen**: Toggles between welcome message and updated message when button is pressed
2. **Counter App Demo**: Updates count value when increment/decrement buttons are pressed
3. **Profile Card Demo**: Toggles favorite status and online/offline status
4. **Widget Tree Demo**: Shows various reactive UI elements that update when interacted with

These examples showcase how Flutter's reactive model rebuilds the widget tree when state changes occur.



# Stateless vs Stateful Widget Demo

## Overview
This Flutter demo showcases the fundamental difference between **StatelessWidget** and **StatefulWidget** by clearly separating static UI from interactive, state-driven UI. The app displays a static header and an interactive counter to demonstrate how Flutter rebuilds widgets based on state changes.

---

## StatelessWidget
A StatelessWidget does not store or manage any mutable state. Its UI depends only on the data provided to it and remains unchanged unless its parent rebuilds it.

**Use cases:** headers, labels, icons, static text.

dart
class DemoHeader extends StatelessWidget {
  final String title;

  const DemoHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
```
Demo Behavior

The header remains unchanged (StatelessWidget).

Pressing the button increments the counter (StatefulWidget).

Only the stateful portion of the UI rebuilds on interaction.

Reflection

Stateful widgets enable dynamic and interactive Flutter apps by allowing controlled UI updates through state changes. Separating static and reactive UI improves clarity, performance, and maintainability by enforcing clear responsibility boundaries.
```

# Flutter Navigation Demo



## Hot Reload, Debug Console, and DevTools Demonstration

## Features
- Home screen with a button to navigate forward
- Details screen with a button to go back
- Navigation handled using Flutter’s `Navigator` stack
- Optional data passing between screens

## Route Setup (main.dart)
```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/details': (context) => DetailsScreen(),
  },
);

I used Flutter DevTools to inspect the widget tree and analyze performance. These tools improve productivity, debugging, and app performance.


# Flutter Multi-Screen Navigation

This project demonstrates basic multi-screen navigation in Flutter using the Navigator class and named routes. The app contains two screens: HomeScreen and SecondScreen. Navigation is handled using Navigator.pushNamed() to move forward and Navigator.pop() to return.

Routes are defined inside MaterialApp using the routes map and initialRoute is set to "/". This keeps navigation organized and easy to scale.

Example routes setup in main.dart:

```dart
routes: {
  '/': (context) => HomeScreen(),
  '/second': (context) => SecondScreen(),
}
```

Navigator manages a stack of screens, where each new screen is pushed on top and removed when popped. Named routes improve readability, maintainability, and scalability in larger apps.



# Responsive Layout Design

## Overview

This project demonstrates a responsive layout using Flutter’s core layout widgets:

- Container
- Row
- Column
- Expanded
- MediaQuery

The layout adapts to different screen sizes.

Phone → Vertical layout  
Tablet → Horizontal layout  

---

<!-- ## Code Example

```dart
Row(
 children: [
  Expanded(child: ProfileCard()),
  Expanded(child: Dashboard()),
 ]
) -->



# User Input Form with Validation

##  Project Overview
This Flutter project demonstrates handling user input using TextFields,
Buttons, and Form widgets. The app collects user name and email, validates
the input, and displays feedback.

---

##  Features
- Text input using TextFormField
- Form validation for name and email
- Submit button with feedback using SnackBar

---

##  Code Examples

### TextFormField with Validation
<!-- ```dart
TextFormField(
  decoration: InputDecoration(labelText: 'Email'),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains('@')) {
      return 'Enter a valid email';
    }
    return null;
  },
); -->


# User Input Form – Flutter

## Description
This project demonstrates how to handle user input in Flutter using TextFormField, Form, and validation.  
The form collects a user's name and email, validates the input, and displays feedback using SnackBar.

## Features
- Name and Email input fields
- Input validation
- Submit button
- Success feedback using SnackBar

## Key Code Snippet
```dart
TextFormField(
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  },
);


# State Management Demo – Flutter

Demonstrates local UI state management using `setState()` in Flutter.

## How setState() Works
```dart
void _incrementCounter() {
  setState(() {
    _counter++;  // Flutter rebuilds only the affected widget
  });
}
```

## Features
- Increment / Decrement counter
- Background color changes at count ≥ 5 (green) and ≥ 10 (red)
- Reset button
- Status message changes based on count

## Reflection

**Stateless vs Stateful:**
- `StatelessWidget` renders once and never changes — good for static UI.
- `StatefulWidget` holds mutable state and rebuilds when `setState()` is called.

**Why setState() matters:**
It signals Flutter's rendering engine to re-run `build()` for that widget only, keeping the UI in sync with your data.

**Performance considerations:**
Calling `setState()` too broadly (e.g., at the top-level widget) causes unnecessary rebuilds. Keep stateful widgets small and low in the widget tree to minimize rebuild scope.


# Reusable Custom Widgets

## Overview
This task demonstrates the creation and reuse of custom Stateless and Stateful widgets to improve modular UI design in the SafeStride app.

## Stateless Widget

### CustomDashboardButton
A reusable button component with customizable:
- Label
- Icon
- Color
- Navigation action

**Used in:**
- HomeScreen
- SecondScreen

This ensures consistent styling and avoids code duplication.

---

## Stateful Widget

### FavoriteToggleButton
A reusable toggle button that manages its own internal state.

**Used in:**
- HomeScreen
- SecondScreen

Each instance maintains independent state.

---

## Benefits of Reusable Widgets
- Reduces repeated UI code
- Improves readability and maintainability
- Ensures consistent design across screens
- Makes future updates easier

---

## Reflection
By extracting common UI components into reusable widgets, the application becomes cleaner, more scalable, and easier to maintain as the project grows.



# Responsive Design Implementation

## Overview
This task demonstrates responsive UI design using **MediaQuery** and **LayoutBuilder** to ensure the SafeStride dashboard adapts seamlessly across mobile and tablet devices.

---

## MediaQuery Usage
MediaQuery was used to:
- Dynamically scale font sizes
- Adjust padding and spacing proportionally
- Adapt UI elements based on screen width and height

Example:
```dart
final screenWidth = MediaQuery.of(context).size.width;