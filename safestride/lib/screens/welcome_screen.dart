import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isWelcome = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafeStride'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isWelcome ? 'Welcome to SafeStride!' : 'Let’s Get Started 🚀',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),

            Icon(
              Icons.directions_walk,
              size: 80,
              color: isWelcome ? Colors.blue : Colors.green,
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  isWelcome = !isWelcome;
                });
              },
              child: const Text('Toggle Message'),
            ),
          ],
        ),
      ),
    );
  }
}
