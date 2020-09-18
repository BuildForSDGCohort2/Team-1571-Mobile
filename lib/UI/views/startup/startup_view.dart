import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class Startupview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Text("Welcome"),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => model.navigateToHome(),
                child: Icon(Icons.navigate_next),
              ),
            ),
        viewModelBuilder: () => StartupViewModel());
  }
}

 