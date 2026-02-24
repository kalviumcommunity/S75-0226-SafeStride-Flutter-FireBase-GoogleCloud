import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isTablet = screenSize.width >= 600 && screenSize.width < 1024;
    final isDesktop = screenSize.width >= 1024;

    // Get arguments passed from the previous screen
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
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
                    'Second Screen',
                    style: TextStyle(
                      fontSize: isMobile ? 24 : isTablet ? 28 : 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 20),
                  Text(
                    arguments?['message'] ?? 'Welcome to the second screen!',
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isMobile ? 30 : 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 10 : 12,
                        horizontal: isMobile ? 20 : 24,
                      ),
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      'Back to Home',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 10 : 12,
                        horizontal: isMobile ? 20 : 24,
                      ),
                      backgroundColor: Colors.purple,
                    ),
                    child: Text(
                      'Go to Home (Replace)',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/counter-app-demo');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 10 : 12,
                        horizontal: isMobile ? 20 : 24,
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
            ),
          ),
        ),
      ),
    );
  }
}