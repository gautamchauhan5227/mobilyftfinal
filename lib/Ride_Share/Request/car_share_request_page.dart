import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Crud_File/crud1.dart';


class request_page extends StatefulWidget {
  final String email;
  request_page({Key key, this.email}) : super(key: key);

  @override
  _request_pageState createState() => _request_pageState();
}

class _request_pageState extends State<request_page> {
  CRUD1 crudobj = new CRUD1();
  QuerySnapshot req, user;

  @override
  void initState() {
    crudobj.getData('ride request ').then((result) {
      setState(() {
        req = result;
      });
    });
    crudobj.getData('user').then((result) {
      setState(() {
        user = result;
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
          if (req != null)
            for (int i = 0; i < req.documents.length; i++)
              // if (city == ride.documents[i].data["source"])
              Column(
                children: <Widget>[
                  returnride(i),
                ],
              ),
          Padding(padding: EdgeInsets.only(top: 250.0)),
          if (req == null)
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
    if (req != null) {
      if (widget.email == req.documents[i].data["email"]) {
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
                      "${req.documents[i].data["source"]}\tto\t${req.documents[i].data["dest"]}"),
                  subtitle: Text("Time : "
                      "${req.documents[i].data["time"]}\nSeat : ${req.documents[i].data["Seat"]}"),
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              'Ride Details',
                              style: TextStyle(
                                fontFamily: 'helvetica_neue_light',
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.person,
                                            // location_on
                                            size: 40.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Name",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${user.documents[i].data["name"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 18.0),
                                            ),
                                            flex: 1,
                                          )
                                        ],
                                      )
                                    ])),
                                Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_searching,
                                            size: 40.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Email',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${req.documents[i].data["e"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 18.0),
                                            ),
                                            flex: 1,
                                          )
                                        ],
                                      )
                                    ])),
                                Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_searching,
                                            size: 40.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Pick-Up',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${req.documents[i].data["source"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 18.0),
                                            ),
                                            flex: 1,
                                          )
                                        ],
                                      )
                                    ])),
                                Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_on,
                                            size: 40.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Destination',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            flex: 0,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${req.documents[i].data["dest"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 18.0),
                                            ),
                                            flex: 1,
                                          )
                                        ],
                                      )
                                    ])),
                                Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.access_time,
                                            size: 40.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Time',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${req.documents[i].data["time"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 18.0),
                                            ),
                                            flex: 1,
                                          )
                                        ],
                                      )
                                    ])),
                                Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.airline_seat_recline_normal,
                                            size: 40.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Seat',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${req.documents[i].data["Seat"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 18.0),
                                            ),
                                            flex: 1,
                                          )
                                        ],
                                      )
                                    ])),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                "Cancel      ",
                                style: TextStyle(fontSize: 25.0),
                              ),
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
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
