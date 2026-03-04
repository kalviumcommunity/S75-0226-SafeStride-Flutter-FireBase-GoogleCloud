import 'package:flutter/material.dart';
import '../widgets/animated_widgets.dart';

class AnimationsDemoScreen extends StatefulWidget {
  const AnimationsDemoScreen({Key? key}) : super(key: key);

  @override
  _AnimationsDemoScreenState createState() => _AnimationsDemoScreenState();
}

class _AnimationsDemoScreenState extends State<AnimationsDemoScreen> {
  bool _boxToggled = false;
  bool _showText = true;

  void _navigateWithSlide(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _SecondPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations Demo'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- Fade In Widgets ---
            FadeInWidget(
              delayMs: 0,
              child: Text('Flutter Animations', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            FadeInWidget(
              delayMs: 300,
              child: Text('Smooth, polished, interactive UI', style: TextStyle(color: Colors.grey[600])),
            ),
            const SizedBox(height: 32),

            // --- AnimatedContainer Demo ---
            const Text('1. AnimatedContainer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => setState(() => _boxToggled = !_boxToggled),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: _boxToggled ? 220 : 120,
                height: _boxToggled ? 80 : 120,
                decoration: BoxDecoration(
                  color: _boxToggled ? Colors.teal : Colors.orange,
                  borderRadius: BorderRadius.circular(_boxToggled ? 40 : 12),
                ),
                child: const Center(
                  child: Text('Tap me!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // --- AnimatedOpacity Demo ---
            const Text('2. AnimatedOpacity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            AnimatedOpacity(
              opacity: _showText ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 600),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.teal.shade50, borderRadius: BorderRadius.circular(12)),
                child: const Text('SafeStride is here! 👟', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => setState(() => _showText = !_showText),
              child: Text(_showText ? 'Hide' : 'Show'),
            ),
            const SizedBox(height: 32),

            // --- Animated Button Demo ---
            const Text('3. Animated Button', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            AnimatedActionButton(
              label: 'Press Me!',
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Button pressed with animation! 🎉')),
              ),
            ),
            const SizedBox(height: 32),

            // --- Page Transition Demo ---
            const Text('4. Page Transition', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => _navigateWithSlide(context),
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Slide to Next Page'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  const _SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.teal, size: 80),
            const SizedBox(height: 16),
            const Text('Page Transition Works! 🎉', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}