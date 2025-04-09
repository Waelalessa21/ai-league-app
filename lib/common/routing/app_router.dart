import 'package:ai_league/common/routing/routes.dart';
import 'package:ai_league/features/home/ui/home_screen.dart';
import 'package:ai_league/features/login/ui/login_screen.dart';
import 'package:ai_league/features/model/ui/model_screen.dart';
import 'package:ai_league/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.modelScreen:
        return MaterialPageRoute(
          builder: (_) => const ModelScreen(),
        );

      default:
        return null;
    }
  }
}
