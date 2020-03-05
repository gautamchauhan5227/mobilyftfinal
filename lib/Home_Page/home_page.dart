import 'dart:io';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:mobilyft/Dashboard/dashboard.dart';
import 'package:mobilyft/Notification/Notify.dart';
import 'package:mobilyft/Profile/profile.dart';
import 'package:mobilyft/Ride_create_search/ride_page.dart';
import 'package:mobilyft/maps/map.dart';



class Home_page extends StatefulWidget {
  final String email;
  Home_page({Key key, this.email}) : super(key: key);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int _currentIndex = 2;
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget callPage(int currentIndex) {
    switch (_currentIndex) {
      case 0:
        return Dashboard(email: widget.email);
      case 1:
        return maps();
      case 2:
        return Ride_Page(email: widget.email);
      case 3:
        return notify(email: widget.email);

      case 4:
        return profile(email: widget.email);
    }
  }

  Future<bool> manage_back_button() {
    showDialog(
        context: context,
        builder: (_) => FlareGiffyDialog(
              flarePath: 'asets/space_demo.flr',
              flareAnimation: 'loading',
              title: Text(
                'Thank you',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              description: Text(
                'Do you really want to exit.',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              onOkButtonPressed: () {
                exit(0);
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: manage_back_button,
      
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: callPage(_currentIndex),
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        // ),
        

        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.white,
          activeColor: Colors.blue,
          color: Colors.lightBlue,
    items: [
      TabItem(icon: Icons.dashboard, title: 'Dashboard'),
      TabItem(icon: Icons.person_add, title: 'Request'),
      TabItem(icon: Icons.add, title: 'Add'),
      TabItem(icon: Icons.notifications, title: 'Notification'),
      TabItem(icon: Icons.person, title: 'Profile'),
    ],
    
    initialActiveIndex: 2,
     onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
  ),
        // bottomNavigationBar: CurvedNavigationBar(
        //   color: Colors.lightBlue[100],
        //   backgroundColor: Colors.white,
        //   buttonBackgroundColor: Colors.white,

        //   height: 48,
        //   key: _bottomNavigationKey,
        //   items: <Widget>[
        //     Icon(
        //       Icons.dashboard,
        //       size: 25,
        //       color: Colors.blue,
        //     ),
        //     Icon(Icons.person_add, size: 25, color: Colors.blue),
        //     Icon(
        //       Icons.notifications,
        //       size: 25,
        //       color: Colors.blue,
        //     ),
        //     Icon(Icons.person, size: 25, color: Colors.blue),
        //   ],
        //   animationDuration: Duration(milliseconds: 300),
        //   animationCurve: Curves.easeOutCubic,
        //   //currentIndex: _currentIndex,
        //   onTap: (value) {
        //     _currentIndex = value;
        //     setState(() {});
        //   },
        // ),
        // floatingActionButton: SpeedDial(
        //   backgroundColor: Colors.lightBlue[100],
        //   foregroundColor: Colors.blue,
        //   animatedIcon: AnimatedIcons.menu_close,
        //   children: [
        //     SpeedDialChild(
        //         backgroundColor: Colors.lightBlue[100],
        //         foregroundColor: Colors.blue,
        //         child: Icon(
        //           Icons.add,
        //           size: 35.0,
        //         ),
        //         label: "Add Ride",
        //         labelStyle: TextStyle(fontSize: 15.0),
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (BuildContext context) =>
        //                       Create(email: widget.email)));
        //         }),
        //     SpeedDialChild(
        //         backgroundColor: Colors.lightBlue[100],
        //         foregroundColor: Colors.blue,
        //         child: Icon(
        //           Icons.search,
        //           size: 30.0,
        //         ),
        //         label: "Search Ride",
        //         labelStyle: TextStyle(fontSize: 15.0),
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (BuildContext context) =>
        //                       ridesearch(email: widget.email)));
        //         })
        //   ],


        )
      );
    
  }
}
