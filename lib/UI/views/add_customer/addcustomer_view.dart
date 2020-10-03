import 'package:PayMeBack/UI/views/add_customer/addcustomer_viewmodel.dart';
import 'package:PayMeBack/UI/views/contacts_page/contacts_view.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AddCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCustomerViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: RaisedButton(
                  onPressed: () async {
                    final PermissionStatus permissionStatus =
                        await _getPermission();
                    if (permissionStatus == PermissionStatus.granted) {
                      model.navigateToContacts();
                    } else {
                      //If permissions have been denied show standard cupertino alert dialog
                       showDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                    title: Text('Permissions error'),
                    content: Text('Please enable contacts access '
                        'permission in system settings'),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ));
                    }
                  },
                  child: Container(child: Text('Add from Contacts')),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.navigate_next),
              ),
            ),
        viewModelBuilder: () => AddCustomerViewModel());
  }
  //Check contacts permission
  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }
}


