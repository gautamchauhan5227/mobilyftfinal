
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:flutter/material.dart';


import 'package:mobilyft/Profile/profile.dart';
import 'package:mobilyft/Ride_Share/Dashboard/car_share_dashboard.dart';
import 'package:mobilyft/Ride_Share/Notification/car_share_Notify.dart';
import 'package:mobilyft/Ride_Share/Ride_create_search/car_share_ride_page.dart';

import 'package:mobilyft/Ride_Share/maps/map.dart';



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

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: callPage(_currentIndex),
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        // ),

        appBar:  PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child:AppBar(backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black,size: 30.0),
          ),
      ),  
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
        );
      
    
  }
}
