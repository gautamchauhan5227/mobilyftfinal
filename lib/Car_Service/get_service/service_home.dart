import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Car_Service/get_service/service_search.dart';
class get_services extends StatefulWidget {
   get_services({Key key, this.email}) : super(key: key);

  final String email;
  @override
  _get_servicesState createState() => _get_servicesState();
}

class _get_servicesState extends State<get_services> {
   int _currentIndex = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget callPage(int currentIndex) {
    switch (_currentIndex) {
      case 0:
        return null;
      case 1:
        return search_service(email:widget.email);
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
      // TabItem(icon: Icons.person_add, title: 'Request'),
      TabItem(icon: Icons.search, title: 'Search'),
      TabItem(icon: Icons.message, title: 'Message'),
      // TabItem(icon: Icons.person, title: 'Profile'),
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