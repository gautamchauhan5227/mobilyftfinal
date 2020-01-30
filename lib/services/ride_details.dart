import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/crud1.dart';
import 'package:mobilyft/services/request_page.dart';
import 'package:mobilyft/services/ride_request.dart';

class ride_details extends StatefulWidget {
  final String email;
  ride_details({Key key, this.email}) : super(key: key);

  @override
  _ride_detailsState createState() => _ride_detailsState();
}

class _ride_detailsState extends State<ride_details> {
  QuerySnapshot data;
  CRUD1 crudobj = new CRUD1();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    crudobj.getData('ride').then((result) {
      setState(() {
        data = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: ListView(
              children: <Widget>[
                get_ride_info(widget.email),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get_ride_info(String email) {
    int t = 0;
    String date, des, source;
    print(email);
    for (int i = 00; i < data.documents.length; i++) {
      if (email == data.documents[i].data["email"]) {
        // date = data.documents[i].data["date"];
        des = data.documents[i].data["destination"];
        source = data.documents[i].data["source"];
        t = 1;
        print(des);
      }
      if (t == 1) break;
    }
    return Container(
      child: Column(
        children: <Widget>[
          // Text(date),
          //Text(des),
          //Text(source),
        ],
      ),
    );
  }
}
