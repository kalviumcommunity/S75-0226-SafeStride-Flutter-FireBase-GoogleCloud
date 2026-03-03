import 'package:flutter/material.dart';

class AssetDemoScreen extends StatelessWidget {
  const AssetDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assets Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              'assets/images/cycling1.jpg',
              width: 150,
            ),

            const SizedBox(height: 20),

            Image.asset(
              'assets/images/walking1.jpg',
              width: 150,
            ),

            const SizedBox(height: 20),

            const Text(
              "Stay Active with SafeStride",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.directions_bike, size: 30, color: Colors.blue),
                SizedBox(width: 15),
                Icon(Icons.directions_walk, size: 30, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}