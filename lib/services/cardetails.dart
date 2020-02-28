import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:mobilyft/crud1.dart';

import 'package:nice_button/NiceButton.dart';

class car_details extends StatefulWidget {
  final String email;
  car_details({Key key, this.email}) : super(key: key);
  @override
  _car_detailsState createState() => _car_detailsState();
}

class _car_detailsState extends State<car_details> {
  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  CRUD1 crudobj = new CRUD1();
  String _email;
  String _model;
  String _rc;
  String _lic;

  QuerySnapshot pro;
  @override
  void initState() {
    crudobj.getData('car_detail').then((result) {
      setState(() {
        pro = result;
      });
    });
  }

  int l = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          if (pro != null)
            for (int i = 0; i < pro.documents.length; i++)
              Container(
                child: cardetails(i),
              ),
          Padding(padding: EdgeInsets.only(top: 250.0)),
          if (pro == null)
            Column(
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
              ],
            )
        ],
      ),
    );
  }

  Widget cardetails(int i) {
    if (pro != null) {
      if (widget.email == pro.documents[i].data["email"]) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(),
            ),
            Center(
              child:
                  Icon(Icons.directions_car, size: 150.0, color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Vehicle',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    '  Details',
                    style: TextStyle(fontSize: 40.0, color: Colors.blueAccent),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          'Car Model',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                        child: Text(
                      "${pro.documents[i].data["car"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontFamily: 'sans-serif-light'),
                    )),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          'RC book number',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                        child: Text(
                      "${pro.documents[i].data["RC book"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontFamily: 'sans-serif-light'),
                    )),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          'License Number',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                        child: Text(
                      "${pro.documents[i].data["Lic"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontFamily: 'sans-serif-light'),
                    )),
                  ],
                )),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            NiceButton(
              radius: 40,
              padding: const EdgeInsets.all(15),
              text: "Edit In Vehicle Details",
              gradientColors: [secondColor, firstColor],
              onPressed: () {
                updateDialog(context, pro.documents[i].documentID);
              },
              background: null,
            )
          ],
        );
      } else
        return Container();
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Future<bool> updateDialog(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Vehicle Details",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Container(
              height: 180.0,
              width: 270.0,
              child: ListView(children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Car Model',
                    labelStyle:
                        TextStyle(color: Colors.grey[900], fontSize: 20.0),
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 40.0,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value) =>
                      value.isEmpty ? "Car Model can't be empty" : null,
                  onChanged: (value) {
                    this._model = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'RC book number',
                    labelStyle:
                        TextStyle(color: Colors.grey[900], fontSize: 20.0),
                    prefixIcon: const Icon(
                      Icons.phone_iphone,
                      size: 40.0,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value) =>
                      value.isEmpty ? "Phone Number can't be empty" : null,
                  onChanged: (value) {
                    this._rc = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'License Number',
                    labelStyle:
                        TextStyle(color: Colors.grey[900], fontSize: 20.0),
                    prefixIcon: const Icon(
                      Icons.person_pin_circle,
                      size: 40.0,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value) =>
                      value.isEmpty ? "License Number can't be empty" : null,
                  onChanged: (value) {
                    this._lic = value;
                  },
                ),
              ]),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Update      ",
                  style: TextStyle(fontSize: 25.0),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                  crudobj
                      .updateVehicleData(selectedDoc, {
                        'car': this._model,
                        'RC book': this._rc,
                        'Lic': this._lic
                      })
                      .then((result) {})
                      .catchError((e) {
                        print(e);
                      });
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
        });
  }
}
