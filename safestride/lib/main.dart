import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'widgets/widget_tree_demo.dart';
import 'widgets/profile_card_demo.dart';
import 'widgets/counter_app_demo.dart';

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
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/widget-tree-demo': (context) => const WidgetTreeDemo(),
        '/profile-card-demo': (context) => const ProfileCardDemo(),
        '/counter-app-demo': (context) => const CounterAppDemo(),
      },
    );
  }
}
