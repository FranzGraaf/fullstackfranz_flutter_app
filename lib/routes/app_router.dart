import 'package:flutter/material.dart';
import 'package:fullstackfranz_flutter_app/pages/page1.dart';
import 'package:fullstackfranz_flutter_app/pages/page2.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Page1.route:
        return CustomPageRoute1(
          child: const Page1(),
        );
      case Page2.route:
        return CustomPageRoute1(
          child: const Page2(),
        );

      default:
        return CustomPageRoute1(
          child: const Page1(),
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
