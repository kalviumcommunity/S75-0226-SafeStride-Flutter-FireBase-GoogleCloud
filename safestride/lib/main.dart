import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/responsive_home.dart';

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

      // change this for Sprint-2 testing
      home: const ResponsiveHome(),

      // later switch back to WelcomeScreen
      // home: const WelcomeScreen(),
    );
  }
}
