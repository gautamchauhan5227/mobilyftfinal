import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mobilyft/services/Notify.dart';

import 'package:mobilyft/services/create.dart';

import 'package:mobilyft/services/dashboard.dart';
import 'package:mobilyft/services/profilepage.dart';
import 'package:mobilyft/services/request_page.dart';
import 'package:mobilyft/services/search.dart';
//import 'package:mobilyft/services/ride_page.dart';
//import 'package:mobilyft/services/search.dart';

// import 'package:mobilyft/profile_page.dart';
// import 'package:mobilyft/ride_page.dart';
// import 'package:mobilyft/update_ride_page.dart';

// import 'notify_page.dart';
class Home_page extends StatefulWidget {
  final String email;
  Home_page({Key key, this.email}) : super(key: key);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int _currentIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget callPage(int currentIndex) {
    switch (_currentIndex) {
      case 0:
        return Dashboard(email: widget.email);
      case 1:
        return request_page(email: widget.email);
      case 2:
        return notify(email: widget.email);

      case 3:
        return ProfilePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: callPage(_currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.lightGreen[100],
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,

        height: 48,
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(
            Icons.dashboard,
            size: 25,
            color: Colors.orange,
          ),
          Icon(
            Icons.person_add,
            size: 25,
            color: Colors.orange,
          ),
          Icon(
            Icons.notifications,
            size: 25,
            color: Colors.orange,
          ),
          Icon(Icons.person, size: 25, color: Colors.orange),
        ],
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeOutCubic,
        //currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.lightGreen[100],
        foregroundColor: Colors.green,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              backgroundColor: Colors.lightGreen[100],
              foregroundColor: Colors.green,
              child: Icon(
                Icons.add,
                size: 20.0,
              ),
              label: "Add Ride",
              labelStyle: TextStyle(fontSize: 20.0),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Create(email: widget.email)));
              }),
          SpeedDialChild(
              backgroundColor: Colors.lightGreen[100],
              foregroundColor: Colors.green,
              child: Icon(
                Icons.search,
                size: 20.0,
              ),
              label: "Search Ride",
              labelStyle: TextStyle(fontSize: 20.0),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            search(email: widget.email)));
              })
        ],
      ),
    );
  }
}
