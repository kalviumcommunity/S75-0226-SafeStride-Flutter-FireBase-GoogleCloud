import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(

        child: Center(

          child: Container(

            constraints: const BoxConstraints(maxWidth: 900),

            padding: EdgeInsets.all(isMobile ? 20 : 40),

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                /// LOGO / ICON
                Container(

                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    Icons.shield,
                    size: isMobile ? 60 : 80,
                    color: Colors.blue,
                  ),

                ),

                const SizedBox(height: 30),

                /// APP NAME
                Text(
                  "SafeStride",
                  style: TextStyle(
                    fontSize: isMobile ? 32 : 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                /// TAGLINE
                Text(
                  "Navigate safely. Reach confidently.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 20,
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 40),

                /// FEATURE LIST
                _feature(Icons.map, "Real-time safe navigation"),
                _feature(Icons.security, "Safety-optimized routes"),
                _feature(Icons.location_on, "Live location tracking"),
                _feature(Icons.warning, "Danger zone alerts"),

                const SizedBox(height: 50),

                /// PRIMARY BUTTON
                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },

                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue,
                    ),

                    child: const Text(
                      "Start Safe Journey",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),

                  ),

                ),

                const SizedBox(height: 15),

                /// LOGIN BUTTON
                SizedBox(
                  width: double.infinity,

                  child: OutlinedButton(

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },

                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),

                    child: const Text(
                      "Login / Signup",
                      style: TextStyle(fontSize: 16),
                    ),

                  ),

                ),

              ],

            ),

          ),

        ),

      ),

    );

  }

  Widget _feature(IconData icon, String text) {

    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Icon(icon, color: Colors.green),

          const SizedBox(width: 10),

          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),

        ],

      ),

    );

  }

}