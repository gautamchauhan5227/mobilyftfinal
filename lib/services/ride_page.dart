import 'package:flutter/material.dart';
import 'package:mobilyft/home_page.dart';
import 'package:mobilyft/services/search.dart';
import 'create.dart';

class Ride_Page extends StatefulWidget {
  final String email;
  Ride_Page({Key key, this.email}) : super(key: key);

  @override
  _Ride_PageState createState() => _Ride_PageState();
}

class _Ride_PageState extends State<Ride_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 145, left: 15, right: 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 100.0,
                      width: 310.0,
                      child: RaisedButton(
                          color: Colors.white,
                          child: Image.asset('asets/car.png'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Create(email: widget.email)));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0)))),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Add Ride",
                    style: TextStyle(color: Colors.black54, fontSize: 30.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        height: 100.0,
                        width: 310.0,
                        child: RaisedButton(
                            color: Colors.white,
                            child: Image.asset('asets/people.png'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Create()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(50.0)))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Search Ride",
                    style: TextStyle(color: Colors.black54, fontSize: 30.0),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
