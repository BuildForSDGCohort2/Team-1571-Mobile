import 'package:flutter/material.dart';

import 'sliderLayout/sliderLayout_view.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: onBordingBody(),
    );
  }
  Widget onBordingBody() => Container(
      child: SliderLayoutView(),
     );
}