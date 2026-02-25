import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Screens
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/second_screen.dart';
import 'screens/scrollable_views.dart';

// Widget demos
import 'widgets/widget_tree_demo.dart';
import 'widgets/profile_card_demo.dart';
import 'widgets/counter_app_demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

        '/widget-tree-demo': (context) => const WidgetTreeDemo(),

        '/profile-card-demo': (context) => const ProfileCardDemo(),

        '/counter-app-demo': (context) => const CounterAppDemo(),

        '/stateless-stateful-demo': (context) => const WelcomeScreen(),

        '/responsive-layout': (context) => const ResponsiveLayout(),

      },

      onGenerateRoute: (settings) {

        if (settings.name == '/second') {

          return MaterialPageRoute(
            builder: (context) => SecondScreen(),
            settings: settings,
          );

        }

        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );

      },
    );
  }
}