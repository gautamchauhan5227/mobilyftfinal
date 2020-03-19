import 'package:flutter/material.dart';

import 'package:mobilyft/Ride_Share/Dashboard/car_share_allride.dart';
import 'package:mobilyft/Ride_Share/Dashboard/car_share_ride_details.dart';



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
        appBar: AppBar(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15),
      ),
        ),
        backgroundColor: Colors.white,
         iconTheme: IconThemeData(
          color: Colors.black
        ),
         
        title:Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
              "Ride Details",
              style: TextStyle(
                color:Colors.black,
                fontWeight:FontWeight.w400,
                fontSize: 30.0
                ),
             ),
        ),
          leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), 
          onPressed:(){
            Navigator.pop(context, true);
          }
          ),
          
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50, left: 15, right: 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 170.0,
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
                    height: 20.0,
                  ),
                  Text(
                    "Current Ride",
                    style: TextStyle(color: Colors.black, fontSize: 30.0,fontWeight: FontWeight.w300,fontFamily: 'Merriweather'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                        height: 170.0,
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
                    height: 20.0,
                  ),
                  Text(
                    "Add Ride Histroy ",
                    style: TextStyle(color: Colors.black, fontSize: 30.0,fontWeight: FontWeight.w300,fontFamily: 'Merriweather'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
