import 'package:PayMeBack/app/locator.dart';
import 'package:PayMeBack/app/router.dart';
import 'package:PayMeBack/core/sevices/login_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final LoginService _loginService = locator<LoginService>();
   Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeViewRoute);
  }
  
}
