import 'dart:async';
import 'dart:math';
import 'package:fullstackfranz_flutter_app/pages/neumorphism/widgets/neumorphism_clock_hand.dart';
import 'package:fullstackfranz_flutter_app/pages/neumorphism/widgets/neumorphism_dial.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Neumorphism extends StatefulWidget {
  static const route = "/neumorphism";
  const Neumorphism({super.key});

  @override
  State<Neumorphism> createState() => _NeumorphismState();
}

class _NeumorphismState extends State<Neumorphism> {
  DateTime currentTime = DateTime.now();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), updateTime);
  }

  void updateTime(Timer timer) {
    setState(() {
      currentTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color neumorphismColor = Color.fromARGB(255, 49, 49, 49);
    const double clockSize = 250;
    const double centerSize = 50;

    return Container(
      color: neumorphismColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // clock background
          Container(
            width: clockSize,
            height: clockSize,
            decoration: BoxDecoration(
              color: neumorphismColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(-6, -6),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(6, 6),
                ),
              ],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 41, 41, 40),
                  neumorphismColor,
                ],
              ),
            ),
          ),
          // clock center
          Container(
            width: centerSize,
            height: centerSize,
            decoration: BoxDecoration(
              color: neumorphismColor.withOpacity(0.5),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: const Offset(-3, -3),
                  blurStyle: BlurStyle.inner,
                  inset: true,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: const Offset(3, 3),
                  blurStyle: BlurStyle.inner,
                  inset: true,
                ),
              ],
            ),
          ),
          // Clock dial
          const NeumorphismDial(size: clockSize),
          // Second hand
          NeumorphismClockHand(
            angle: currentTime.second * 6 * pi / 180,
            width: 4,
            height: 80,
            color: Colors.red.withOpacity(0.7),
          ),
          // Minute hand
          NeumorphismClockHand(
            angle:
                (currentTime.minute * 6 + currentTime.second / 10) * pi / 180,
            width: 6,
            height: 60,
            color: Colors.white.withOpacity(0.7),
          ),
          // Hour hand
          NeumorphismClockHand(
            angle: (currentTime.hour % 12 * 30 + currentTime.minute / 2) *
                pi /
                180,
            width: 8,
            height: 50,
            color: Colors.blue.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
