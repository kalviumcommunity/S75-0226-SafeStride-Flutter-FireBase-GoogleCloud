import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';

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

  theme: ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),

  home: StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),

    builder: (context, snapshot) {

      // Loading while Firebase checks login state
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      // If user already logged in
      if (snapshot.hasData) {
        return HomeScreen();
      }

      // If user NOT logged in
      return const AuthScreen();
    },
  ),
);
  }
}