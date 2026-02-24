import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'widgets/widget_tree_demo.dart';
import 'widgets/profile_card_demo.dart';
import 'widgets/counter_app_demo.dart';
import 'screens/home_screen.dart';
import 'screens/second_screen.dart';  

void main() {
  runApp(const SafeStrideApp());
}

class SafeStrideApp extends StatelessWidget {
  const SafeStrideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeStride',
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