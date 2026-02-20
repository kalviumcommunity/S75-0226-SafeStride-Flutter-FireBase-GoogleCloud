import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'widgets/widget_tree_demo.dart';
import 'widgets/profile_card_demo.dart';
import 'widgets/counter_app_demo.dart';
import 'screens/stateless_stateful.dart';

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
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/widget-tree-demo': (context) => const WidgetTreeDemo(),
        '/profile-card-demo': (context) => const ProfileCardDemo(),
        '/counter-app-demo': (context) => const CounterAppDemo(),
        '/stateless-stateful-demo': (context) => const WelcomeScreen(),
      },
    );
  }
}
