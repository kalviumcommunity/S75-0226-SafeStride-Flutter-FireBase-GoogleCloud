import 'package:flutter/material.dart';

/// A demo widget that shows the concept of widget trees and reactive UI
class WidgetTreeDemo extends StatefulWidget {
  const WidgetTreeDemo({super.key});

  @override
  State<WidgetTreeDemo> createState() => _WidgetTreeDemoState();
}

class _WidgetTreeDemoState extends State<WidgetTreeDemo> {
  // State variable that will trigger UI updates
  int count = 0;
  Color backgroundColor = Colors.white;
  bool isWelcome = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Tree & Reactive UI Demo'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Center widget containing Column
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text widget showing reactive count
                  Text(
                    isWelcome ? 'Welcome to Widget Tree Demo!' : 'Count: $count',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  
                  // Icon widget that changes color reactively
                  Icon(
                    isWelcome ? Icons.widgets : Icons.tag_faces,
                    size: 80,
                    color: isWelcome ? Colors.blue : Colors.green,
                  ),
                  const SizedBox(height: 30),
                  
                  // Button to increment counter (demonstrates setState)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count++;
                        isWelcome = false;
                        backgroundColor = Colors.grey.shade200;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                    child: const Text(
                      'Increment Count',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 15),
                  
                  // Button to reset state
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        count = 0;
                        isWelcome = true;
                        backgroundColor = Colors.white;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                    child: const Text(
                      'Reset Demo',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Container widget showing dynamic properties
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      border: Border.all(color: Colors.blue.shade200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'This demo shows how Flutter builds UI using a tree of widgets.\n\n'
                      'Each widget is a node in the hierarchy:\n'
                      '- MaterialApp (root)\n'
                      '  - Scaffold\n'
                      '    - AppBar\n'
                      '    - Body (Container)\n'
                      '      - Column\n'
                      '        - Center\n'
                      '          - Column\n'
                      '            - Text\n'
                      '            - Icon\n'
                      '            - ElevatedButton\n',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}