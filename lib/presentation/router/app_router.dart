import 'package:flutter/material.dart';
import 'package:free_fall_distance/presentation/pages/home_page.dart';
import 'package:free_fall_distance/presentation/pages/results_page.dart';
import 'package:free_fall_distance/presentation/pages/timer_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => HomePage(title: 'Home Page'),
        );
      case "/timer":
        return MaterialPageRoute(
          builder: (_) => TimerPage(title: 'Calculate the Distance'),
        );
      case "/results":
        return MaterialPageRoute(
          builder: (_) => ResultsPage(title: 'Results Page'),
        );
      default:
        return null;
    }
  }
}
