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
    // Get screen size for responsive design
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isTablet = screenSize.width >= 600 && screenSize.width < 1024;
    final isDesktop = screenSize.width >= 1024;

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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 16.0 : 32.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 500 : isTablet ? 400 : double.infinity,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Counter App Demo',
                      style: TextStyle(
                        fontSize: isMobile ? 24 : 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: isMobile ? 16 : 20),
                    
                    // Display the count with dynamic styling
                    Container(
                      padding: EdgeInsets.all(isMobile ? 16 : 20),
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
                          fontSize: count > 99 ? (isMobile ? 30 : 36) : (isMobile ? 48 : 64),
                          fontWeight: FontWeight.bold,
                          color: count > 10 
                              ? Colors.red 
                              : count > 5 
                                  ? Colors.orange 
                                  : Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(height: isMobile ? 20 : 30),
                    
                    // Counter controls
                    isMobile
                        ? Column(
                            children: [
                              // Increment button
                              FloatingActionButton(
                                onPressed: increment,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.add,
                                  size: isMobile ? 24 : 28,
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Reset button
                              FloatingActionButton(
                                onPressed: reset,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.refresh,
                                  size: isMobile ? 24 : 28,
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Decrement button
                              FloatingActionButton(
                                onPressed: decrement,
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.remove,
                                  size: isMobile ? 24 : 28,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Decrement button
                              FloatingActionButton(
                                onPressed: decrement,
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.remove,
                                  size: isMobile ? 24 : 28,
                                ),
                              ),
                              SizedBox(width: isMobile ? 20 : 30),
                              
                              // Reset button
                              FloatingActionButton(
                                onPressed: reset,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.refresh,
                                  size: isMobile ? 24 : 28,
                                ),
                              ),
                              SizedBox(width: isMobile ? 20 : 30),
                              
                              // Increment button
                              FloatingActionButton(
                                onPressed: increment,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.add,
                                  size: isMobile ? 24 : 28,
                                ),
                              ),
                            ],
                          ),
                    SizedBox(height: isMobile ? 20 : 30),
                    
                    // Instructions
                    Container(
                      padding: EdgeInsets.all(isMobile ? 12 : 16),
                      margin: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 20),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        border: Border.all(color: Colors.blue.shade200),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'This counter app demonstrates Flutter\'s reactive UI model:\n\n'
                        '• When you press the buttons, setState() is called\n'
                        '• This triggers a rebuild of the widget\n'
                        '• Only the parts of the UI that need updating are refreshed\n'
                        '• The count variable updates and the UI reflects the change',
                        style: TextStyle(fontSize: isMobile ? 12 : 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}