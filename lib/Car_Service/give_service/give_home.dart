import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Car_Service/give_service/Dashboard/dashboard_home.dart';
class give_home extends StatefulWidget {
  give_home({Key key, this.email}) : super(key: key);

  final String email;
  @override
  _give_homeState createState() => _give_homeState();
}

class _give_homeState extends State<give_home> {
   int _currentIndex = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget callPage(int currentIndex) {
    switch (_currentIndex) {
      case 0:
        return give_dashboard(email: widget.email);
      case 1:
        return null;
      case 2:
        return null;
        // return rent_message(email: widget.email);
      
         
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        body: callPage(_currentIndex),
          bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.white,
          activeColor: Colors.blue,
          color: Colors.lightBlue,
    items: [
      TabItem(icon: Icons.dashboard, title: 'Dashboard'),
      TabItem(icon: Icons.room_service, title: 'List'),
      TabItem(icon: Icons.message, title: 'Message'),
    ],
    
    initialActiveIndex: 1,
     onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
  ),
    );
  }
}