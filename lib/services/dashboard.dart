import 'package:flutter/material.dart';
import 'package:mobilyft/services/cardetails.dart';

import 'package:mobilyft/services/feedback.dart';
import 'package:mobilyft/services/full_ride.dart';
import 'package:mobilyft/services/ride_details.dart';
import 'package:mobilyft/services/ride_details.dart';

//import 'package:mobilyft/services/ride_details.dart';

class Dashboard extends StatefulWidget {
  final String email;
  Dashboard({Key key, this.email}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 45, left: 15, right: 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 100.0,
                      width: 310.0,
                      child: RaisedButton(
                          color: Colors.lightBlue[100],
                          child: Icon(
                            Icons.view_list,
                            size: 100.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => fullride(
                                          email: widget.email,
                                        )));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0)))),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Ride Details",
                    style: TextStyle(color: Colors.black54, fontSize: 30.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        height: 100.0,
                        width: 310.0,
                        child: RaisedButton(
                            color: Colors.lightBlue[100],
                            child: Icon(Icons.directions_car, size: 100.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          car_details(
                                            email: widget.email,
                                          )));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(50.0)))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Vehicle Details",
                    style: TextStyle(color: Colors.black54, fontSize: 30.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        height: 100.0,
                        width: 310.0,
                        child: RaisedButton(
                            color: Colors.lightBlue[100],
                            child: Icon(Icons.feedback, size: 100.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          feedback(
                                            email: widget.email,
                                          )));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(50.0)))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Feedback Box",
                    style: TextStyle(color: Colors.black54, fontSize: 30.0),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
