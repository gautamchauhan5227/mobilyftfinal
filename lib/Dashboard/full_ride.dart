import 'package:flutter/material.dart';
import 'package:mobilyft/Dashboard/allride.dart';
import 'package:mobilyft/Dashboard/ride_details.dart';

class fullride extends StatefulWidget {
  final String email;
  fullride({Key key, this.email}) : super(key: key);

  @override
  _fullrideState createState() => _fullrideState();
}

class _fullrideState extends State<fullride> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 55, left: 15, right: 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 150.0,
                      width: 310.0,
                      child: RaisedButton(
                          color: Colors.lightBlue[100],
                          child: Icon(
                            Icons.view_list,
                            size: 150.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Ride_Details(
                                          email: widget.email,
                                        )));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)))),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Current Ride",
                    style: TextStyle(color: Colors.black54, fontSize: 30.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: SizedBox(
                        height: 150.0,
                        width: 310.0,
                        child: RaisedButton(
                            color: Colors.lightBlue[100],
                            child: Icon(Icons.history, size: 150.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          allride(
                                            email: widget.email,
                                          )));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Add Ride Histroy ",
                    style: TextStyle(color: Colors.black54, fontSize: 30.0),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
