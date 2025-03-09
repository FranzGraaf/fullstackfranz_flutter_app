import 'package:flutter/material.dart';
import 'package:fullstackfranz_flutter_app/core/widgets/back_header_1.dart';

class GlowEffect extends StatefulWidget {
  static const route = "/gloweffect";
  const GlowEffect({super.key});

  @override
  State<GlowEffect> createState() => _GlowEffectState();
}

class _GlowEffectState extends State<GlowEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _colorAnimationController;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();
    _colorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _colorTween = ColorTween(
      begin: Colors.transparent,
      end: Colors.blue,
    ).animate(
      CurvedAnimation(
        parent: _colorAnimationController,
        curve: Curves.easeInOutBack,
      ),
    );
  }

  @override
  void dispose() {
    _colorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BackHeader1(),
          Expanded(
            child: Container(
              // just the background
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black,
                    Colors.black87,
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _colorAnimationController,
                builder: (context, child) {
                  return Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: _colorTween.value!,
                          blurRadius: 20,
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Glow Effect",
                      style: TextStyle(
                        fontSize: 24,
                        color: _colorTween.value,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
