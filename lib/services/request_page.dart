import 'package:flutter/material.dart';
import 'package:mobilyft/services/ride_request.dart';

class request_page extends StatefulWidget {
  final String email;
  request_page({Key key, this.email}) : super(key: key);

  @override
  _request_pageState createState() => _request_pageState();
}

class _request_pageState extends State<request_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
