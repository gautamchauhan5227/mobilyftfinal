import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

class searchrentcar extends StatefulWidget {
  final String email;
  searchrentcar({Key key, this.email}) : super(key: key);
  @override
  _searchrentcarState createState() => _searchrentcarState();
}

class _searchrentcarState extends State<searchrentcar> {
  bool size = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search Place...',
            focusColor: Color.fromRGBO(100, 50, 100, 0.8),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 30.0),
          ),
          style: TextStyle(
              fontSize: (size) ? 16 : 16, fontWeight: FontWeight.w600),
          controller: TextEditingController(),
        ),
      ),
      body: ListView(),
    ));
  }
}
