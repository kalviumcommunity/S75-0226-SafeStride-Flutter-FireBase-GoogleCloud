import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;
  bool isWelcome = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 multi_screen
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

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: isWelcome ? Colors.white : Colors.grey.shade200,
      appBar: AppBar(title: const Text('SafeStride')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isWelcome ? 'Welcome to SafeStride!' : 'You clicked the button!',
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
              child: const Text('Toggle State'),
            ),
            const SizedBox(height: 20),

            // Demo navigation buttons
            const Text(
              'Flutter Learning Demos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
 main
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
multi_screen
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

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/widget-tree-demo');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Widget Tree Demo',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile-card-demo');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Profile Card Demo',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
 main
                  ),
                  SizedBox(height: isMobile ? 24 : 36),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isWelcome = !isWelcome;
                      });
                    },
 multi_screen
                    child: const Text('Toggle State'),
                  ),
                  SizedBox(height: isMobile ? 20 : 30),
                  
                  // Navigation section
                  Text(
                    'Multi-Screen Navigation:',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.bold,

                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      backgroundColor: Colors.orange,
 main
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
 multi_screen
}

}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
 main
