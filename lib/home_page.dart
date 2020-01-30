import 'package:flutter/material.dart';
import 'package:mobilyft/services/Notify.dart';

import 'package:mobilyft/services/dashboard.dart';
import 'package:mobilyft/services/profilepage.dart';
import 'package:mobilyft/services/ride_page.dart';

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
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Ride_Page(emaill: widget.email);
      case 1:
        return Dashboard();
      case 2:
        return notify();
        
      case 3:
        return ProfilePage();

      //     break;
      // default:return Ride_Page();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],

      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   title:Text('Mobilyft'),
      //   centerTitle: true,

      // ),

      body: callPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        backgroundColor: Colors.green[100],
        unselectedItemColor: Colors.lightGreen,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: Text('Notification')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile')),
        ],
      ),
    );
  }
}
