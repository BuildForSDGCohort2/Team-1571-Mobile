import 'package:PayMeBack/UI/views/add_customer/addcustomer_view.dart';
import 'package:PayMeBack/app/locator.dart';
import 'package:PayMeBack/app/router.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddCustomerViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ContactsService _contactsService = locator<ContactsService>();

  Future navigateToContacts() async {
    await _navigationService.navigateTo(Routes.contactsPageRoute);
  }
}
