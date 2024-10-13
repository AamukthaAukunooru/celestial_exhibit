import 'package:flutter/material.dart';

class SkeletonGlow extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final Color glowColor;
  final double glowHeight;
  final EdgeInsets? glowMargin;

  const SkeletonGlow({
    super.key,
    required this.child,
    required this.backgroundColor,
    required this.glowColor,
    required this.glowHeight,
    this.glowMargin,
  });

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
        widget.child, // The actual widget
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              height: widget.glowHeight,
              margin: widget.glowMargin ?? EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment(_animation.value, 0),
                  end: Alignment(_animation.value + 1, 0),
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
