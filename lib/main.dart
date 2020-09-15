import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:github/homepage.dart';
import 'package:github/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        splash: SplashScreen(), 
        nextScreen: MyHomePage(title: 'Flutter Demo Home Page'),
        duration: 2500,
        splashTransition: SplashTransition.fadeTransition,
      )
    );
  }
}

