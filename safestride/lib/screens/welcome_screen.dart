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
    // Get screen size for responsive design
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isTablet = screenSize.width >= 600 && screenSize.width < 1024;
    final isDesktop = screenSize.width >= 1024;

    return Scaffold(
      backgroundColor: isWelcome ? Colors.white : Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('SafeStride'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16.0 : 32.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 800 : isTablet ? 600 : double.infinity,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isWelcome ? 'Welcome to SafeStride!' : 'You clicked the button!',
                    style: TextStyle(
                      fontSize: isMobile ? 20 : isTablet ? 28 : 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 24),
                  Icon(
                    Icons.directions_walk,
                    size: isMobile ? 60 : isTablet ? 70 : 80,
                    color: isWelcome ? Colors.blue : Colors.green,
                  ),
                  SizedBox(height: isMobile ? 24 : 36),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isWelcome = !isWelcome;
                      });
                    },
                    child: const Text('Toggle State'),
                  ),
                  SizedBox(height: isMobile ? 20 : 30),
                  
                  // Navigation section
                  Text(
                    'Multi-Screen Navigation:',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 12 : 15),
                  Wrap(
                    spacing: isMobile ? 8 : 12,
                    runSpacing: isMobile ? 8 : 12,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: isMobile ? 10 : 12,
                            horizontal: isMobile ? 16 : 24,
                          ),
                          backgroundColor: Colors.purple,
                        ),
                        child: Text(
                          'Go to Home Screen',
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: isMobile ? 8 : 12),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context, 
                            '/second',
                            arguments: {'message': 'Hello from Welcome Screen!'},
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: isMobile ? 10 : 12,
                            horizontal: isMobile ? 16 : 24,
                          ),
                          backgroundColor: Colors.red,
                        ),
                        child: Text(
                          'Go to Second Screen (with data)',
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isMobile ? 20 : 30),
                  
                  // Demo navigation buttons
                  Text(
                    'Flutter Learning Demos:',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 12 : 15),
                  Wrap(
                    spacing: isMobile ? 8 : 12,
                    runSpacing: isMobile ? 8 : 12,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/widget-tree-demo');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: isMobile ? 10 : 12,
                            horizontal: isMobile ? 16 : 24,
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(
                          'Widget Tree Demo',
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: isMobile ? 8 : 12),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile-card-demo');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: isMobile ? 10 : 12,
                            horizontal: isMobile ? 16 : 24,
                          ),
                          backgroundColor: Colors.green,
                        ),
                        child: Text(
                          'Profile Card Demo',
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: isMobile ? 8 : 12),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/counter-app-demo');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: isMobile ? 10 : 12,
                            horizontal: isMobile ? 16 : 24,
                          ),
                          backgroundColor: Colors.orange,
                        ),
                        child: Text(
                          'Counter App Demo',
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}