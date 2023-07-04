import 'package:flutter/material.dart';
import 'package:local_event_app/ui/auth_screen/login_screen.dart';
import 'package:local_event_app/ui/auth_screen/signup_screen.dart';
import 'package:local_event_app/ui/event_details/add_event.dart';
import 'package:local_event_app/ui/homepage/home_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case SignupScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignupScreen(),
      );
    case HomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomePage(),
      );
    case AddEvent.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddEvent(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}