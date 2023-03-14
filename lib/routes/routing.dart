import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waka_app/controllers/auth/auth_bloc.dart';
import 'package:waka_app/routes/names.dart';
import 'package:waka_app/screens/auth/login_screen.dart';
import 'package:waka_app/screens/errors/not_found.dart';
import 'package:waka_app/screens/start/splash_screen.dart';
import 'package:waka_app/screens/start/start_screen.dart';

class RouteGenerator {
  Route<dynamic> generatedRoutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case (AppRoutes.splash):
        return fadeNavTransition(
          BlocProvider(
            create: (context) => AuthBloc(),
            child: SplashScreen(),
          ),
        );
      case (AppRoutes.start):
        return fadeNavTransition(
          BlocProvider(
            create: (context) => AuthBloc(),
            child: OnboardingScreen(),
          ),
        );

      // * Auth routes
      case (AppRoutes.login):
        return fadeNavTransition(
          BlocProvider(
            create: (context) => AuthBloc(),
            child: LoginScreen(),
          ),
        );

      default:
        return fadeNavTransition(NotFoundScreen());
    }
  }
}

fadeNavTransition(Widget screen) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) => screen,
    transitionsBuilder: (_, Animation<double> animation, __, Widget child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

slideNavTransition(Widget screen) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) => screen,
    transitionsBuilder: (_, Animation<double> animation, __, Widget child) => SlideTransition(
      position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero).animate(animation),
      child: child,
    ),
  );
}

slideFadeNavTransition(Widget screen) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) => screen,
    transitionsBuilder: (_, Animation<double> animation, __, Widget child) => Stack(
      children: [
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
        FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
          child: child,
        ),
      ],
    ),
  );
}
