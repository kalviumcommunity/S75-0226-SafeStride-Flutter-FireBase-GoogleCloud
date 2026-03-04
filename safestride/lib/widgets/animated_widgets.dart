import 'package:flutter/material.dart';

// 1. Animated Button Widget (implicit animation)
class AnimatedActionButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const AnimatedActionButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  _AnimatedActionButtonState createState() => _AnimatedActionButtonState();
}

class _AnimatedActionButtonState extends State<AnimatedActionButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPressed();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: _pressed ? 180 : 200,
        height: _pressed ? 48 : 54,
        decoration: BoxDecoration(
          color: _pressed ? Colors.teal.shade700 : Colors.teal,
          borderRadius: BorderRadius.circular(_pressed ? 30 : 12),
          boxShadow: _pressed
              ? []
              : [BoxShadow(color: Colors.teal.withOpacity(0.4), blurRadius: 10, offset: Offset(0, 4))],
        ),
        child: Center(
          child: Text(
            widget.label,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// 2. Fade-in Widget (implicit animation)
class FadeInWidget extends StatefulWidget {
  final Widget child;
  final int delayMs;

  const FadeInWidget({Key? key, required this.child, this.delayMs = 0}) : super(key: key);

  @override
  _FadeInWidgetState createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.delayMs), () {
      if (mounted) setState(() => _opacity = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
      child: widget.child,
    );
  }
}

// 3. Rotating Logo Widget (explicit animation)
class RotatingLogo extends StatefulWidget {
  final String imagePath;
  final double size;

  const RotatingLogo({Key? key, required this.imagePath, this.size = 100}) : super(key: key);

  @override
  _RotatingLogoState createState() => _RotatingLogoState();
}

class _RotatingLogoState extends State<RotatingLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(widget.imagePath, width: widget.size),
    );
  }
}