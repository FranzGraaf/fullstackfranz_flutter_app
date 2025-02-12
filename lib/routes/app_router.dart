import 'package:flutter/material.dart';
import 'package:fullstackfranz_flutter_app/pages/frosted_glass/frosted_glass.dart';
import 'package:fullstackfranz_flutter_app/pages/landing_page.dart';
import 'package:fullstackfranz_flutter_app/pages/parallax_effect_page/parallax_effect_page.dart';
import 'package:fullstackfranz_flutter_app/pages/sliver_list_page/sliver_list_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LandingPage.route:
        return CustomPageRoute1(
          child: const LandingPage(),
        );
      case SliverListPage.route:
        return CustomPageRoute1(
          child: const SliverListPage(),
        );
      case ParallaxEffectPage.route:
        return CustomPageRoute1(
          child: const ParallaxEffectPage(),
        );
      case FrostedGlass.route:
        return CustomPageRoute1(
          child: const FrostedGlass(),
        );
      default:
        return CustomPageRoute1(
          child: const LandingPage(),
        );
    }
  }
}

class CustomPageRoute1 extends MaterialPageRoute {
  final Widget child;

  CustomPageRoute1({
    required this.child,
  }) : super(
          builder: (context) {
            return child;
          },
        );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: Material(child: child),
    );
  }
}
