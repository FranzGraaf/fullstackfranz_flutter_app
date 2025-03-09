import 'dart:math';

import 'package:flutter/material.dart';

class NeumorphismDial extends StatelessWidget {
  final double size;
  const NeumorphismDial({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.white.withOpacity(0.5);
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: List.generate(
          60,
          (index) {
            final isHour = index % 5 == 0;
            final angle = index * 6;
            return Transform.rotate(
              angle: angle * pi / 180,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: isHour
                      ? Column(
                          children: [
                            Container(
                              width: 2,
                              height: size * 0.05,
                              color: color,
                            ),
                            SizedBox(height: size * 0.02),
                            Text(
                              '${index ~/ 5 == 0 ? 12 : index ~/ 5}',
                              style: TextStyle(
                                fontSize: size * 0.05,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                          ],
                        )
                      : Container(
                          width: 1,
                          height: size * 0.03,
                          color: color,
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
