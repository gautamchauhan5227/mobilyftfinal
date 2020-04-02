import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:mobilyft/Ride_Share/Dashboard/car_share_cardetails.dart';
import 'car_share_ride_create.dart';
import 'car_share_ridesearch.dart';

class Ride_Page extends StatefulWidget {
  Ride_Page({Key key, this.email}) : super(key: key);

  final String email;

  @override
  _Ride_PageState createState() => _Ride_PageState();
}

class _Ride_PageState extends State<Ride_Page> {
  final formKey = GlobalKey<FormState>();
  QuerySnapshot car;
  CRUD1 crudobj = new CRUD1();
  String email, lic, model, chas,eng;

  @override
  void initState() {
    email = widget.email;
    print(email);
    crudobj.getData('car_detail').then((result) {
      setState(() {
        car = result;
      });
    });
  }

  void insert(BuildContext context) {
    // print(_src);

    Map<String, dynamic> data = {
      'email': widget.email,
      'car Number': model,
      'License': lic,
      'Chassis No': chas,
      'Engine No':eng
    };

    crudobj.addcar(data, context).then((result) {}).catchError((e) {
      print(e);
    });
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }

  void submit() async {
    if (validateAndSave()) {
      insert(context);
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  car_details(email: widget.email)));
      print("submitted");
    }
  }

  Future<bool> updateDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              
              child: Text(
                "Add Car Details First!!",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
              key: formKey,
              child: Container(
                height: 250.0,
                width: 150.0,
                child: ListView(children: <Widget>[
                  TextFormField(
                    controller: TextEditingController(),
                    textCapitalization: TextCapitalization.characters, 
                    inputFormatters: [MaskTextInputFormatter(mask: "## ** ## ****", filter: { "#": RegExp(r'[A-Z]') , "*":RegExp(r'[0-9]')})],
                    decoration: InputDecoration(
                      labelText: 'Car Number',
                      labelStyle:
                          TextStyle(color: Colors.grey[900], fontSize: 20.0,fontWeight: FontWeight.w500),
                      hintText: 'GJ 05 AA 1111'
                    ),
                     validator: (value) =>
                        value.isEmpty ? "Car Number can't be empty" : null,
                    onChanged: (value) {
                      this.model = value;
                    },
                  ),
                  TextFormField(
                     controller: TextEditingController(),
                    textCapitalization: TextCapitalization.characters, 
                    inputFormatters: [MaskTextInputFormatter(mask: "##** ***********", filter: { "#": RegExp(r'[A-Z]') , "*":RegExp(r'[0-9]')})],
                    decoration: InputDecoration(
                      labelText: ' License No.',
                      labelStyle:
                          TextStyle(color: Colors.grey[900], fontSize: 20.0,fontWeight: FontWeight.w500),
                      hintText: 'GJ05 12345678901'
                      // prefixIcon: const Icon(
                      //   Icons.location_on,
                      //   size: 40.0,
                      //   color: Colors.blue,
                      // ),
                    ),
                     validator: (value) =>
                        value.isEmpty ? "License Number can't be empty" : null,
                    onChanged: (value) {
                      this.lic = value;
                    },
                  ),
                  TextFormField(
                     controller: TextEditingController(),
                    textCapitalization: TextCapitalization.characters, 
                    inputFormatters: [MaskTextInputFormatter(mask: "#################", filter: { "#": RegExp(r'[A-Z,0-9]') })],
                    decoration: InputDecoration(
                      labelText: 'Chassis Number',
                      labelStyle:
                          TextStyle(color: Colors.grey[900], fontSize: 20.0,fontWeight: FontWeight.w500),
                      hintText: 'MA7878JK76GG88OOO'
                     
                    ),
                    validator: (value) =>
                        value.isEmpty ? "Chassis No can't be empty" : null,
                    onChanged: (value) {
                      this.chas = value;
                    },
                  ),
                  TextFormField(
                     controller: TextEditingController(),
                    textCapitalization: TextCapitalization.characters, 
                    inputFormatters: [MaskTextInputFormatter(mask: "############", filter: { "#": RegExp(r'[A-Z,0-9]') })],
                    decoration: InputDecoration(
                      labelText: 'Engine Number',
                      labelStyle:
                          TextStyle(color: Colors.grey[900], fontSize: 20.0,fontWeight: FontWeight.w500),
                      hintText: 'GJ3934KK2345'
                      // prefixIcon: const Icon(
                      //   Icons.airline_seat_recline_normal,
                      //   size: 40.0,
                      //   color: Colors.blue,
                      // ),
                    ),
                    validator: (value) =>
                        value.isEmpty ? "Engine No can't be empty" : null,
                    onChanged: (value) {
                      this.eng = value;
                    },
                  ),
                ]),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                 color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  submit();
                },
              ),
              Padding(padding: EdgeInsets.only(left:40.0)),
              FlatButton(
                 color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "Cancel",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              Padding(padding: EdgeInsets.only(left:20.0)),
            ],
          );
        });
  }

  int flag = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40, left: 15, right: 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 172.0,
                      width: 310.0,
                      child: RaisedButton(
                          color: Colors.white,
                          child: Icon(Icons.directions_car, size: 140.0),
                          onPressed: () {
                            if (car != null)
                              for (int i = 0; i < car.documents.length; i++) {
                                if (email == car.documents[i].data["email"]) {
                                  print(car.documents[i].data["car"]);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Create(email: widget.email)));
                                  flag = 1;
                                }
                              }
                            if (flag == 0) {
                              print("No Data!!");
                              updateDialog(context);
                            }
                          },
                          shape: CircleBorder())),
                  SizedBox(
                    height: 10.0,
                  ),

                  ColorizeAnimatedTextKit(
                      text: ["Add Ride"],
                      textStyle:
                          TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
                      colors: [
                        Colors.black,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red,
                      ],
                      textAlign: TextAlign.start,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      ),

                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        height: 172.0,
                        width: 310.0,
                        child: RaisedButton(
                          color: Colors.white,
                          child: Icon(
                            Icons.search,
                            size: 140.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ridesearch(email: widget.email)));
                          },
                          shape: CircleBorder(

                              // borderRadius:
                              //     new BorderRadius.circular(50.0)
                              ),
                        )),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Text(
                  //   "Search Ride",
                  //   style: TextStyle(color: Colors.black54, fontSize: 30.0),
                  // ),

                  ColorizeAnimatedTextKit(
                      text: ["Search Ride"],
                      textStyle:
                          TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
                      colors: [
                        Colors.black,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red,
                      ],
                      textAlign: TextAlign.start,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      ),
                ],
              ),
            ),
          ],
        ));
  }
}
