import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Car_Rent/Car_Rent_Add_Search/car_rent_add_search.dart';


import 'package:mobilyft/Profile/profile.dart';
class rent_homepage extends StatefulWidget {
   final String email;
  rent_homepage({Key key, this.email}) : super(key: key);
  @override
  _rent_homepageState createState() => _rent_homepageState();
}

class _rent_homepageState extends State<rent_homepage> {
  int _currentIndex = 2;
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget callPage(int currentIndex) {
    switch (_currentIndex) {
      case 0:
        // return Dashboard(email: widget.email);
      case 1:
        return null;
      case 2:
        return  rent_dashboard(email: widget.email);
      case 3:
        return null;

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