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
    // Get screen size for responsive design
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isTablet = screenSize.width >= 600 && screenSize.width < 1024;
    final isDesktop = screenSize.width >= 1024;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Tree & Reactive UI Demo'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 800 : isTablet ? 600 : double.infinity,
                ),
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
                            style: TextStyle(
                              fontSize: isMobile ? 18 : 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isMobile ? 16 : 20),
                          
                          // Icon widget that changes color reactively
                          Icon(
                            isWelcome ? Icons.widgets : Icons.tag_faces,
                            size: isMobile ? 60 : 80,
                            color: isWelcome ? Colors.blue : Colors.green,
                          ),
                          SizedBox(height: isMobile ? 20 : 30),
                          
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
                              padding: EdgeInsets.symmetric(
                                vertical: isMobile ? 10 : 12,
                                horizontal: isMobile ? 16 : 24,
                              ),
                            ),
                            child: Text(
                              'Increment Count',
                              style: TextStyle(fontSize: isMobile ? 14 : 16),
                            ),
                          ),
                          SizedBox(height: isMobile ? 12 : 15),
                          
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
                              padding: EdgeInsets.symmetric(
                                vertical: isMobile ? 10 : 12,
                                horizontal: isMobile ? 16 : 24,
                              ),
                            ),
                            child: Text(
                              'Reset Demo',
                              style: TextStyle(fontSize: isMobile ? 14 : 16),
                            ),
                          ),
                          SizedBox(height: isMobile ? 16 : 20),
                          
                          // Container widget showing dynamic properties
                          Container(
                            padding: EdgeInsets.all(isMobile ? 12 : 16),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              border: Border.all(color: Colors.blue.shade200),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
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
                              style: TextStyle(fontSize: isMobile ? 12 : 14),
                            ),
                          ),
                        ],
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