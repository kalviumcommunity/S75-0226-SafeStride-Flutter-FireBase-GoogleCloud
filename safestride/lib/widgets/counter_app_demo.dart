import 'package:flutter/material.dart';

/// A simple counter app to demonstrate the reactive UI model
class CounterAppDemo extends StatefulWidget {
  const CounterAppDemo({super.key});

  @override
  State<CounterAppDemo> createState() => _CounterAppDemoState();
}

class _CounterAppDemoState extends State<CounterAppDemo> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  void reset() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App Demo'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              count % 2 == 0 ? Colors.blue.shade50 : Colors.green.shade50,
              count % 3 == 0 ? Colors.purple.shade50 : Colors.orange.shade50,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Counter App Demo',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              
              // Display the count with dynamic styling
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: count > 99 ? 36 : 64,
                    fontWeight: FontWeight.bold,
                    color: count > 10 
                        ? Colors.red 
                        : count > 5 
                            ? Colors.orange 
                            : Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              
              // Counter controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Decrement button
                  FloatingActionButton(
                    onPressed: decrement,
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 30),
                  
                  // Reset button
                  FloatingActionButton(
                    onPressed: reset,
                    backgroundColor: Colors.grey,
                    child: const Icon(Icons.refresh),
                  ),
                  const SizedBox(width: 30),
                  
                  // Increment button
                  FloatingActionButton(
                    onPressed: increment,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              
              // Instructions
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.blue.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'This counter app demonstrates Flutter\'s reactive UI model:\n\n'
                  '• When you press the buttons, setState() is called\n'
                  '• This triggers a rebuild of the widget\n'
                  '• Only the parts of the UI that need updating are refreshed\n'
                  '• The count variable updates and the UI reflects the change',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}