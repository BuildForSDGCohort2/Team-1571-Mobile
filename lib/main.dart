import 'dart:io';

import 'package:PayMeBack/UI/views/home/home_view.dart';
import 'package:PayMeBack/app/locator.dart';
import 'package:PayMeBack/app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: '',
      theme: ThemeData(
         primarySwatch: Colors.blue,
         platform: TargetPlatform.iOS,
      ),
      initialRoute: Routes.onboardingRoute,
      onGenerateRoute: Router.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
