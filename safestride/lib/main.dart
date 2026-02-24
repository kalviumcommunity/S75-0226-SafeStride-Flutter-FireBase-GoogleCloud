import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'widgets/widget_tree_demo.dart';
import 'widgets/profile_card_demo.dart';
import 'widgets/counter_app_demo.dart';
multi_screen
import 'screens/home_screen.dart';
import 'screens/second_screen.dart';  

import 'screens/stateless_stateful.dart';
 main

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
        visualDensity: VisualDensity.adaptivePlatformDensity, // Makes UI adapt to screen density
      ),
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
        '/widget-tree-demo': (context) => const WidgetTreeDemo(),
        '/profile-card-demo': (context) => const ProfileCardDemo(),
        '/counter-app-demo': (context) => const CounterAppDemo(),
        '/stateless-stateful-demo': (context) => const WelcomeScreen(),
      },
      // Adding onGenerateRoute to handle argument passing
      onGenerateRoute: (settings) {
        if (settings.name == '/second') {
          // Handle the case where arguments are passed to the second screen
          return MaterialPageRoute(
            builder: (context) => SecondScreen(),
            settings: settings,
          );
        }
        // Default to WelcomeScreen if route not found
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      },
    );
  }
}