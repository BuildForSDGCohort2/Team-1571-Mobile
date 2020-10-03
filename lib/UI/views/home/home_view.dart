import 'package:PayMeBack/UI/views/splash_screen/splash_screen.dart';
import 'package:PayMeBack/app/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

//import 'package:flutter_screenutil/size_extension.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  Future<void> _logoutUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs?.clear();
    Navigator.pushAndRemoveUntil(
      context,
    MaterialPageRoute(builder: (BuildContext context) => SplashScreen()),
    ModalRoute.withName('/'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _HeaderBar(),
                    )),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    Expanded(
                      child: DefaultTabController(
                        length: 3,
                        child: Column(
                          children: <Widget>[
                            TabBar(
                              labelPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              unselectedLabelColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange,
                              ),
                              tabs: [
                                Tab(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("All Customers"),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Owing Customer"),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("People You Owe"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('4 Customers'),
                                  Icon(Icons.tune)
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: RaisedButton.icon(
                                onPressed: () => model.addCustomer(),
                                color: Theme.of(context).primaryColor,
                                icon: Icon(
                                  Icons.playlist_add,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Add New Customer",
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: RaisedButton.icon(
                                onPressed: () => _logoutUser(context),
                                color: Theme.of(context).primaryColor,
                                icon: Icon(
                                  Icons.playlist_add,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "logout",
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class _HeaderBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        //SizedBox(width: 210.w),
        Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(Icons.alarm),
                CircleAvatar(
                  backgroundColor: Colors.red.shade800,
                  radius: 5.0,
                ),
              ],
              overflow: Overflow.clip,
            )),
      ],
    );
  }
}
