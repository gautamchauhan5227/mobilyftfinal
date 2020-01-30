import 'package:flutter/material.dart';
import 'package:mobilyft/services/create.dart';
import 'package:mobilyft/services/ride_details.dart';
import 'package:mobilyft/services/ride_request.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color: Colors.white,
                      child: Image.asset('asets/car.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ride_details()));
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
                        color: Colors.white,
                        child: Image.asset('asets/people.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ride_request()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0)))),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Ride Request",
                style: TextStyle(color: Colors.black54, fontSize: 30.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: SizedBox(
                    height: 100.0,
                    width: 310.0,
                    child: RaisedButton(
                        color: Colors.white,
                        child: Image.asset('asets/details.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Create()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0)))),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Vehical Details",
                style: TextStyle(color: Colors.black54, fontSize: 30.0),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
