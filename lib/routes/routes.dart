import 'package:flutter/material.dart';
import 'package:my_likndin_website/routes/App_routes_name.dart';
import 'package:my_likndin_website/view/Screens/HomeScreen/home_screen.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('route not defined'))),
        );
    }
  }
}
