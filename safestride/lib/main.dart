import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Screens
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/second_screen.dart';
import 'screens/scrollable_views.dart';
import 'screens/state_management_demo.dart'; // ← ADD THIS

// Widget demos
import 'widgets/widget_tree_demo.dart';
import 'widgets/profile_card_demo.dart';
import 'widgets/counter_app_demo.dart';
import 'screens/user_input_form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),

        // Widget demos
        '/widget-tree-demo': (context) => const WidgetTreeDemo(),
        '/profile-card-demo': (context) => const ProfileCardDemo(),
        '/counter-app-demo': (context) => const CounterAppDemo(),
        '/stateless-stateful-demo': (context) => const WelcomeScreen(),
        '/scrollable-views': (context) => ScrollableViews(),
        '/user-input-form': (context) => const UserInputForm(),

        // ✅ NEW — State Management Demo (Sprint 2)
        '/state-management-demo': (context) => const StateManagementDemo(),
      },
    );
  }
}