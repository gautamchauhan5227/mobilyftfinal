import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../crud1.dart';

class allride extends StatefulWidget {
  final String email;
  allride({Key key, this.email}) : super(key: key);
  @override
  _allrideState createState() => _allrideState();
}

class _allrideState extends State<allride> {
  CRUD1 crudobj = new CRUD1();
  QuerySnapshot ride;
  @override
  void initState() {
    crudobj.getData('all ride').then((result) {
      setState(() {
        ride = result;
      });
    });
  }

  int l = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          if (ride != null)
            for (int i = 0; i < ride.documents.length; i++)
              Column(
                children: <Widget>[
                  returnride(i),
                ],
              ),
          Padding(padding: EdgeInsets.only(top: 250.0)),
          if (ride == null)
            Column(
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
              ],
            )
        ],
      ),
    );
  }

  Widget returnride(int i) {
    if (ride != null) {
      if (widget.email == ride.documents[i].data["email"]) {
        return Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Card(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 40.0,
                  ),
                  title: Text(
                      "${ride.documents[i].data["source"]}\tto\t${ride.documents[i].data["dest"]}"),
                  subtitle: Text("Time : "
                      "${ride.documents[i].data["time"]}\nSeat : ${ride.documents[i].data["Seat"]}"),
                )));
      } else
        return Container();
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
