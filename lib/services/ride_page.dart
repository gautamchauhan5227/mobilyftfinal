import 'package:flutter/material.dart';
import 'package:mobilyft/home_page.dart';
import 'package:mobilyft/services/search.dart';
import 'create.dart';

class Ride_Page extends StatefulWidget {
  Ride_Page({Key key, this.emaill, String email}) : super(key: key);

  final String emaill;

  @override
  _Ride_PageState createState() => _Ride_PageState();
}

class _Ride_PageState extends State<Ride_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        resizeToAvoidBottomPadding: false,
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Image.asset(
            'asets/r5.jpg',
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Stack(
              children: <Widget>[
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                      width: 100.0,
                    ),
                    Center(
                      child: GestureDetector(
                        child: Container(
                            width: 300.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.black,
                              image: DecorationImage(
                                  image: AssetImage("asets/r3.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Center(
                              child: Text(
                                'Add Ride',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40.0),
                              ),
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Create(e: widget.emaill)));
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                      width: 100.0,
                    ),
                    Center(
                      child: GestureDetector(
                        child: Container(
                            width: 300.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.black,
                              image: DecorationImage(
                                  image: AssetImage("asets/r3.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Center(
                              child: Text(
                                'Add Ride',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40.0),
                              ),
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Create(e: widget.emaill)));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]));
  }
}
