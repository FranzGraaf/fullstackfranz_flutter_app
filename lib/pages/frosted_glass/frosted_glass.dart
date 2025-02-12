import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  static const route = "/frostedglass";
  const FrostedGlass({super.key});

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 50;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blueAccent,
            Colors.greenAccent,
          ],
        ),
      ),
      child: Stack(
        children: [
          const RotatingCircles(),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Frosted Glass",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RotatingCircles extends StatefulWidget {
  const RotatingCircles({super.key});

  @override
  State<RotatingCircles> createState() => _RotatingCirclesState();
}

class _RotatingCirclesState extends State<RotatingCircles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double size = 120;
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double angle = _controller.value * 2 * pi;
          double radius = 110;

          Offset circle1Offset =
              Offset(radius * cos(angle), radius * sin(angle));
          Offset circle2Offset =
              Offset(radius * cos(angle + pi), radius * sin(angle + pi));

          return Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: circle1Offset,
                child: Container(
                  width: size,
                  height: size,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              Transform.translate(
                offset: circle2Offset,
                child: Container(
                  width: size,
                  height: size,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
