
import 'package:PayMeBack/UI/views/splash_screen/splash_screen.dart';
import 'package:PayMeBack/app/locator.dart';
import 'package:PayMeBack/app/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  String _title = "Home View";
  String get title => _title;

  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }
  Future addCustomer() async {
    await _navigationService.navigateTo(Routes.addCustomerRoute);
  }
  
}
