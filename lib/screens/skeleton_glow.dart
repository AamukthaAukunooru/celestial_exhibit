import 'package:flutter/material.dart';

class SkeletonGlow extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final Color glowColor;

  const SkeletonGlow({super.key, required this.child, required this.backgroundColor, required this.glowColor});

  @override
  SkeletonGlowState createState() => SkeletonGlowState();
}

class SkeletonGlowState extends State<SkeletonGlow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment(-1.5 + _animation.value, -1.5),
                  end: Alignment(1.5 + _animation.value, 1.5),
                  colors: [
                    widget.backgroundColor,
                    widget.glowColor,
                    widget.backgroundColor,
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}