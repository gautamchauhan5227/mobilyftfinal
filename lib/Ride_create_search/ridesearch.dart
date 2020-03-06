import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:mobilyft/Home_Page/home_page.dart';


class ridesearch extends StatefulWidget {
  final String email;
  ridesearch({Key key, this.email}) : super(key: key);
  @override
  ridesearchState createState() => ridesearchState();
}

class ridesearchState extends State<ridesearch> {
  CRUD1 crudobj = new CRUD1();
  QuerySnapshot ride, user, car;
  String _src, _dest, _seat, emailcr,namecr;
  @override
  void initState() {
    crudobj.getData('detail').then((result) {
      setState(() {
        ride = result;
      });
    });
    crudobj.getData('user').then((result) {
      setState(() {
        user = result;
      });
    });

    crudobj.getData('car_detail').then((result) {
      setState(() {
        car = result;
      });
    });
  }

  void insert(BuildContext context) {
    Map<String, dynamic> data = {
      'e': widget.email,
    };

    crudobj.request(data, context).then((result) {}).catchError((e) {
      print(e);
    });
  }

  void submit() async {
    insert(context);
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Home_page(email: widget.email)));
  }

  void initiateSearch(String val) {
    setState(() {
      city = val.trim();
    });
  }

  TextEditingController _textFieldController = TextEditingController();

  _onClear() {
    setState(() {
      _textFieldController.text = "";
    });
  }

  int l = 0;
  String city = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (val) => initiateSearch(val),
          style: TextStyle(),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search...",
            prefixIcon: Icon(Icons.search),
            suffix: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: _onClear(),
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          if (ride != null)
            for (int i = 0; i < ride.documents.length; i++)
              if (city == ride.documents[i].data["source"])
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
                  onTap: () {
                     emailcr = ride.documents[i].data["email"];
                    print(emailcr);
                     for (int i = 0; i < user.documents.length; i++)
                      if(emailcr == user.documents[i].data["email"])
                      {
                       namecr= user.documents[i].data["name"];
                      }
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
                                              namecr,
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
                                            Icons.directions_car,
                                            size: 40.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Car Number',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${car.documents[i].data["Lic"]}",
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
                                              "${ride.documents[i].data["email"]}",
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
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                "Request     ",
                                style: TextStyle(fontSize: 25.0),
                              ),
                              onPressed: () {
                                submit();
                              },
                            ),
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
  show(i){
                      
  }
}