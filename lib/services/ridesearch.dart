import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/crud1.dart';
import 'package:mobilyft/services/ride_details.dart';

class ridesearch extends StatefulWidget {
  final String email;
  ridesearch({Key key, this.email}) : super(key: key);
  @override
  ridesearchState createState() => ridesearchState();
}

class ridesearchState extends State<ridesearch> {
  CRUD1 crudobj = new CRUD1();
  QuerySnapshot ride, user;
  String _src, _dest, _seat;
  @override
  void initState() {
    crudobj.getData('detail').then((result) {
      setState(() {
        ride = result;
      });
    });
  }

  int l = 0;
  String city = "baroda";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          if (ride != null)
            for (int i = 0; i < ride.documents.length; i++)
              // if (city == ride.documents[i].data["source"])
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
      if (widget.email != ride.documents[i].data["email"]) {
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
                  trailing: IconButton(
                      icon: Icon(Icons.help, color: Colors.blue),
                      onPressed: () {
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
                                        child: new Column(
                                          children: <Widget>[
                                            new Row(
                                              children: <Widget>[
                                                Icon(Icons.location_searching),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 0.0)),
                                                new Text(
                                                  'Pick-Up',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30.0)),
                                                Icon(
                                                    Icons.keyboard_arrow_right),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 0.0),
                                                ),
                                                Text(
                                                  "${ride.documents[i].data["source"]}",
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontFamily:
                                                          'sans-serif-light'),
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: new Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.location_on),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 0.0)),
                                                new Text(
                                                  'Destination',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Icon(
                                                    Icons.keyboard_arrow_right),
                                                Text(
                                                  "${ride.documents[i].data["dest"]}",
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontFamily:
                                                          'sans-serif-light'),
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: new Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.access_time),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 0.0)),
                                                new Text(
                                                  'Time',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 52.0)),
                                                Icon(
                                                    Icons.keyboard_arrow_right),
                                                Text(
                                                  "${ride.documents[i].data["time"]}",
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontFamily:
                                                          'sans-serif-light'),
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: new Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons
                                                    .airline_seat_recline_normal),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 0.0)),
                                                new Text(
                                                  'Seat',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 55.0)),
                                                Icon(
                                                    Icons.keyboard_arrow_right),
                                                Text(
                                                  "${ride.documents[i].data["Seat"]}",
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontFamily:
                                                          'sans-serif-light'),
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('    Delete    ',
                                      style: TextStyle(fontSize: 20.0)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    crudobj.deleteData(
                                        ride.documents[i].documentID);
                                  },
                                ),
                                FlatButton(
                                  child: Text('Ok',
                                      style: TextStyle(fontSize: 20.0)),
                                  onPressed: () {
                                    Navigator.pop(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Ride_Details(
                                                  email: widget.email,
                                                )));
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }),
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
