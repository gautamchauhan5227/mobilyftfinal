import 'package:flutter/material.dart';
class search_service extends StatefulWidget {
   search_service({Key key, this.email}) : super(key: key);

  final String email;
  @override
  _search_serviceState createState() => _search_serviceState();
}

class _search_serviceState extends State<search_service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
        ),
        backgroundColor: Colors.white,
         iconTheme: IconThemeData(
    color: Colors.black
  ),
        title: TextField(
          // onChanged: (val) => initiateSearch(val),
          style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w300),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search...",
            hintStyle: TextStyle(fontSize:25.0,fontWeight:FontWeight.w300)
            // prefixIcon: Icon(Icons.search),
            // suffix: IconButton(
            //   icon: Icon(Icons.cancel),
            //   onPressed: _onClear(),
            // ),
          ),
        ),
      ),
    );
  }
}