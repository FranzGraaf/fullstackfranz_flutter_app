import 'package:flutter/material.dart';

class NeumorphismClockHand extends StatelessWidget {
  final double angle;
  final double width;
  final double height;
  final Color color;
  const NeumorphismClockHand({
    super.key,
    required this.angle,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Transform.translate(
        offset: Offset(0, -((height / 2) + 30)),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(width),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
