import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:mobilyft/crud1.dart';

class Ride_Details extends StatefulWidget {
  final String email;
  Ride_Details({Key key, this.email}) : super(key: key);
  @override
  _Ride_DetailsState createState() => _Ride_DetailsState();
}

class _Ride_DetailsState extends State<Ride_Details> {
  CRUD1 crudobj = new CRUD1();
  QuerySnapshot ride;
  @override
  void initState() {
    crudobj.getData('detail').then((result) {
      setState(() {
        ride = result;
      });
    });
  }

  int l = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          if (ride != null)
            for (int i = 0; i < ride.documents.length; i++)
              Column(
                children: <Widget>[
                  returnride(i),
                ],
              ),
        ],
      ),
    );
  }

  Widget returnride(int i) {
    if (ride != null) {
      if (widget.email == ride.documents[i].data["email"]) {
        return Padding(
            padding: EdgeInsets.only(),
            child: Card(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(150.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 40.0,
                  ),
                  title: Text(
                      "${ride.documents[i].data["source"]}\tto\t${ride.documents[i].data["dest"]}"),
                  subtitle: Text("${ride.documents[i].data["time"]}"),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      onPressed: () {}),
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
