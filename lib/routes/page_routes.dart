import 'package:flutter/material.dart';
import 'package:transition_animation/routes/app_routes.dart';
import 'package:transition_animation/routes/page_transition.dart';
import 'package:transition_animation/screens/screen1.dart';
import 'package:transition_animation/screens/screen2.dart';

class ProPageRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.screen1:
        return PageTransition.build(
          page: Screen1(),
          settings: settings,
          transition: PageTransitionType.fadeThrough,
        );

      case AppRoutes.screen2:
        return PageTransition.build(
          page: Screen2(),
          settings: settings,
          transition: PageTransitionType.iosPushParallax,
          duration: Duration(milliseconds: 500),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
