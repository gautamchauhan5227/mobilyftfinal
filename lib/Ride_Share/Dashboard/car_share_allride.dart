import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Crud_File/crud1.dart';

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
            child: AnimatedCard(
              direction: AnimatedCardDirection.right, 
              initDelay: Duration(milliseconds: 0), 
              duration: Duration(seconds: 2), 
            child: Card(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 60.0,
                  ),
                  title: Text(
                      "${ride.documents[i].data["source"]}\tto\t${ride.documents[i].data["dest"]}",style: TextStyle(fontSize:28.0),),
                  subtitle: Text("Time : "
                      "${ride.documents[i].data["time"]}\nSeat : ${ride.documents[i].data["Seat"]}",style: TextStyle(fontSize:17.0),),
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
                                            Icons.location_searching,
                                            size: 40.0,
                                          ),
                                          // Expanded(
                                          //   child: Text(
                                          //     'Pick-Up',
                                          //     textAlign: TextAlign.start,
                                          //     style: TextStyle(
                                          //         fontSize: 20.0,
                                          //         fontWeight: FontWeight.bold),
                                          //   ),
                                          // ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${ride.documents[i].data["source"]}",
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
                                          // Expanded(
                                          //   child: Text(
                                          //     'Destination',
                                          //     textAlign: TextAlign.start,
                                          //     style: TextStyle(
                                          //         fontSize: 20.0,
                                          //         fontWeight: FontWeight.bold),
                                          //   ),
                                          //   flex: 0,
                                          // ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${ride.documents[i].data["dest"]}",
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
                                          // Expanded(
                                          //   child: Text(
                                          //     'Time',
                                          //     textAlign: TextAlign.start,
                                          //     style: TextStyle(
                                          //         fontSize: 20.0,
                                          //         fontWeight: FontWeight.bold),
                                          //   ),
                                          // ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${ride.documents[i].data["time"]}",
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
                                          // Expanded(
                                          //   child: Text(
                                          //     'Seat',
                                          //     textAlign: TextAlign.start,
                                          //     style: TextStyle(
                                          //         fontSize: 20.0,
                                          //         fontWeight: FontWeight.bold),
                                          //   ),
                                          // ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${ride.documents[i].data["Seat"]}",
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
                          actions: <Widget>[],
                        );
                      },
                    );
                  },
                ))));
      } else
        return Container();
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
