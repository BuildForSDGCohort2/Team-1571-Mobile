//import 'package:auto_route/auto_route_annotations.dart';
import 'package:PayMeBack/UI/views/home/home_view.dart';
import 'package:PayMeBack/UI/views/login/login_view.dart';
import 'package:PayMeBack/UI/views/onboarding/onboarding_view.dart';
import 'package:PayMeBack/UI/views/startup/startup_view.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const startupViewRoute = '/startup';
  static const onboardingRoute = '/onboading';
  static const loginviewRoute = '/login';
  static const homeViewRoute = '/';
}

class Router {
  //static funtion that generates the routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startupViewRoute:
        return MaterialPageRoute(builder: (_) => Startupview());

      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => Onboarding());

      case Routes.homeViewRoute:
        return MaterialPageRoute(builder: (_) => HomeView());

      case Routes.loginviewRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
