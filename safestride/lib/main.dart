import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

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
      home: const WelcomeScreen(),
    );
  }
}
