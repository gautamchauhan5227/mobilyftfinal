import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/crud1.dart';
import 'package:mobilyft/loginpage.dart';

class profile extends StatefulWidget {
  final String email;
  profile({Key key, this.email}) : super(key: key);
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  CRUD1 crudobj = new CRUD1();
  String _email;
  String _password;
  String _phone;
  String _name;
  String _pin;

  QuerySnapshot pro;
  @override
  void initState() {
    crudobj.getData('user').then((result) {
      setState(() {
        pro = result;
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
          if (pro != null)
            for (int i = 0; i < pro.documents.length; i++)
              Container(
                child: profilepage(i),
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

  Widget profilepage(int i) {
    if (pro != null) {
      if (widget.email == pro.documents[i].data["email"]) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40.0, top: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text(
                        "Welcome," "${pro.documents[i].data["name"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    child: Container(
                        child: InkWell(
                            onTap: () {
                              FirebaseAuth.instance.signOut().then((value) {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginPage()));
                              }).catchError((e) {
                                print(e);
                              });
                            },
                            child: Icon(
                              Icons.power_settings_new,
                              size: 30.0,
                              color: Colors.red,
                            ))),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: new Stack(fit: StackFit.loose, children: <Widget>[
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child: Icon(Icons.account_circle, size: 125),
                    ),
                  ],
                ),
              ]),
            ),
            Padding(
                padding: EdgeInsets.only(left: 55.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 1.0),
                        child: new Row(
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Personal Information',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                )),
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
                          'Name',
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
                      "${pro.documents[i].data["name"]}",
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
                          'Email ID',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
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
                      "${pro.documents[i].data["email"]}",
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
                          'Mobile',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
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
                      "${pro.documents[i].data["phone"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontFamily: 'sans-serif-light'),
                    )),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: new Text(
                        'Pin Code',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            "${pro.documents[i].data["pincode"]}",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: 'sans-serif-light'),
                          )),
                    ),
                  ],
                )),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              height: 50.0,
              width: 250.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: InkWell(
                  onTap: () {
                    updateDialog(context, pro.documents[i].documentID);
                  },
                  child: Center(
                    child: Text('Edit In Profile Information',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
            ),
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
              child: Text("Update Personal Details"),
            ),
            content: ListView(children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: ' Name',
                  labelStyle:
                      TextStyle(color: Colors.grey[900], fontSize: 20.0),
                  prefixIcon: const Icon(
                    Icons.person,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                ),
                validator: (value) =>
                    value.isEmpty ? "Name can't be empty" : null,
                onChanged: (value) {
                  this._name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: ' Phone',
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
                  this._phone = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: ' Pin',
                  labelStyle:
                      TextStyle(color: Colors.grey[900], fontSize: 20.0),
                  prefixIcon: const Icon(
                    Icons.person_pin_circle,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                ),
                validator: (value) =>
                    value.isEmpty ? "Pincode can't be empty" : null,
                onChanged: (value) {
                  this._pin = value;
                },
              ),
            ]),
            actions: <Widget>[
              FlatButton(
                child: Text("Update"),
                onPressed: () {
                  Navigator.of(context).pop();
                  crudobj
                      .updateProfileData(selectedDoc, {
                        'name': this._name,
                        'phone': this._phone,
                        'pincode': this._pin
                      })
                      .then((result) {})
                      .catchError((e) {
                        print(e);
                      });
                },
              )
            ],
          );
        });
  }
}
