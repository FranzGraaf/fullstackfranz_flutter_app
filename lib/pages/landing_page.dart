import 'package:flutter/material.dart';
import 'package:fullstackfranz_flutter_app/pages/frosted_glass/frosted_glass.dart';
import 'package:fullstackfranz_flutter_app/pages/glow_effect/glow_effect.dart';
import 'package:fullstackfranz_flutter_app/pages/neumorphism/neumorphism.dart';
import 'package:fullstackfranz_flutter_app/pages/parallax_effect_page/parallax_effect_page.dart';
import 'package:fullstackfranz_flutter_app/pages/sliver_list_page/sliver_list_page.dart';

class LandingPage extends StatelessWidget {
  static const route = "/landingpage";
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Page 1",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Neumorphism.route);
                    },
                    child: const Text("Neumorphism"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(GlowEffect.route);
                    },
                    child: const Text("Glow Effect"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(FrostedGlass.route);
                    },
                    child: const Text("Frosted Glass"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ParallaxEffectPage.route);
                    },
                    child: const Text("Parallax Effect"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SliverListPage.route);
                    },
                    child: const Text("Sliver List"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
