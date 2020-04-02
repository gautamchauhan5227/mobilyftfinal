import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
class Ride_Details extends StatefulWidget {
  final String email;
  Ride_Details({Key key, this.email}) : super(key: key);
  @override
  _Ride_DetailsState createState() => _Ride_DetailsState();
}
class _Ride_DetailsState extends State<Ride_Details> {
  CRUD1 crudobj = new CRUD1();
  QuerySnapshot ride,all;
  final formKey = GlobalKey<FormState>();
  String _ride;
  @override
  void initState() {
    crudobj.getData('current ride').then((result) {
      setState(() {
        ride = result;
      });
    });
    crudobj.getData('all ride').then((result) {
      setState(() {
        all = result;
      });
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
  int l = 0;
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
              "Current Ride",
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
            padding: EdgeInsets.only(left:10.0,right: 10.0,top: 10.0),
            child: AnimatedCard(
              direction: AnimatedCardDirection.right, 
              initDelay: Duration(milliseconds: 5), 
              duration: Duration(seconds: 3), 
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 60.0,
                  ),
                  title: Text(
                      "${ride.documents[i].data["source"]}\tto\t${ride.documents[i].data["dest"]}",
                      style: TextStyle(
                        fontSize:30.0,
                        fontWeight: FontWeight.w400
                        ),
                      ),
                  subtitle: Text("Time : "
                      "${ride.documents[i].data["time"]}\nSeat : ${ride.documents[i].data["Seat"]}",
                      style: TextStyle(
                        fontSize:20.0
                        ),
                      ),
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
                                             
                                              Icon(Icons.chevron_right),
                                              Expanded(
                                                child: Text(
                                                  "${ride.documents[i].data["source"]}",
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      TextStyle(fontSize: 30.0,fontWeight: FontWeight.w300),
                                                ),
                                                flex: 1,
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                onPressed: (){
                                                updatesource(context, ride.documents[i].documentID);
                                                } 
                                              ),
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
                                             
                                              Icon(Icons.chevron_right),
                                              Expanded(
                                                child: Text(
                                                  "${ride.documents[i].data["dest"]}",
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      TextStyle(fontSize: 30.0,fontWeight: FontWeight.w300),
                                                ),
                                                flex: 1,
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                onPressed: (){
                                                updatedest(context, ride.documents[i].documentID);
                                                } 
                                              ),
                                            ],
                                          ),
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
                                              
                                              Icon(Icons.chevron_right),
                                              Expanded(
                                                child: Text(
                                                  "${ride.documents[i].data["time"]}",
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      TextStyle(fontSize: 30.0,fontWeight: FontWeight.w300),
                                                ),
                                                flex: 1,
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                onPressed: (){
                                                updatetime(context, ride.documents[i].documentID);
                                                } 
                                              ),
                                            ],
                                          ),
                                        ])),
                                    Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: new Column(children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons
                                                    .airline_seat_recline_normal,
                                                size: 40.0,
                                              ),
                                              
                                              Icon(Icons.chevron_right),
                                              Expanded(
                                                child: Text(
                                                  "${ride.documents[i].data["Seat"]}",
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      TextStyle(fontSize: 30.0,fontWeight: FontWeight.w300),
                                                ),
                                                flex: 1,
                                              ),
                                               IconButton(
                                                icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                onPressed: (){
                                                updateseat(context, ride.documents[i].documentID);
                                                } 
                                              ),
                                            ],                                            
                                          ),                                         
                                        ]
                                      )
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                Padding(padding: EdgeInsets.only(left:10.0)),
                                FlatButton(
                                  color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                                  child: Text('  Delete  ',
                                      style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w300)),
                                  onPressed: () {
                                    crudobj.deleteData(
                                        ride.documents[i].documentID,"current ride");
                                    Navigator.pop(context, true);
                                    Navigator.pop(context, true); 
                                    Navigator.pop(context, true);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Ride_Details(email: widget.email)));
                                  },
                                ),
                                Padding(padding: EdgeInsets.only(left:10.0,right: 10.0)),
                                FlatButton(
                                  color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                                  child: Text(' Ok ',
                                      style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w300)),
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                ),
                                Padding(padding: EdgeInsets.only(left:10.0,right: 30.0)),
                              ],
                            );
                          },
                        );
                      }
                      // ),
                ))));
      } else
        return Container();
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

   Future<bool> updatesource(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Source",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: 80.0,
                  width: 60.0,
                  child: ListView(children: <Widget>[
                    TextFormField(
                  controller: TextEditingController(),
                    textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        labelText: 'PickUp',
                        labelStyle:
                        TextStyle(color: Colors.grey[900], fontSize: 25.0,fontWeight: FontWeight.w700),
                     ),
                      validator: (value) =>
                       value.isEmpty ? "PickUp can't be empty" : null,
                      onChanged: (value) {
                        this._ride = value;
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
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                   if (validateAndSave()) {
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Ride_Details(email: widget.email)));
                          crudobj. updateCurrentRideData(selectedDoc, {
                            'source': this._ride,
                  });
                }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  Future<bool> updatedest(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Destination",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: 80.0,
                  width: 60.0,
                  child: ListView(children: <Widget>[
                    TextFormField(
                  controller: TextEditingController(),
                    textCapitalization: TextCapitalization.characters,                     
                      decoration: InputDecoration(
                        labelText: 'Destination',
                        labelStyle:
                        TextStyle(color: Colors.grey[900], fontSize: 25.0,fontWeight: FontWeight.w700),
                     ),
                      validator: (value) =>
                       value.isEmpty ? "Destination can't be empty" : null,
                      onChanged: (value) {
                        this._ride = value;
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
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                   if (validateAndSave()) {
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Ride_Details(email: widget.email)));
                          crudobj. updateCurrentRideData(selectedDoc, {
                            'dest': this._ride,
                  });
                }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }


  Future<bool> updatetime(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Time",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: 80.0,
                  width: 60.0,
                  child: ListView(children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Time',
                        labelStyle:
                        TextStyle(color: Colors.grey[900], fontSize: 25.0,fontWeight: FontWeight.w700),
                     ),
                      validator: (value) =>
                       value.isEmpty ? "Time can't be empty" : null,
                      onChanged: (value) {
                        this._ride = value;
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
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                   if (validateAndSave()) {
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Ride_Details(email: widget.email)));
                          crudobj. updateCurrentRideData(selectedDoc, {
                            'source': this._ride,
                  });
                }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }


  Future<bool> updateseat(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Seat",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: 80.0,
                  width: 60.0,
                  child: ListView(children: <Widget>[
                    TextFormField( 
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(),
                      inputFormatters: [MaskTextInputFormatter(
                        mask: "#", 
                        filter: { "#": RegExp(r'[0-4]') }
                        )
                      ],                   
                      decoration: InputDecoration(
                        hintText: 'Max 5 Seat',
                        labelText: 'Seat',
                        labelStyle:
                        TextStyle(color: Colors.grey[900], fontSize: 25.0,fontWeight: FontWeight.w700),
                     ),
                      validator: (value) =>
                       value.isEmpty ? "Seat can't be empty" : null,
                      onChanged: (value) {
                        this._ride = value;
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
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                   if (validateAndSave()) {
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Ride_Details(email: widget.email)));
                          crudobj. updateCurrentRideData(selectedDoc, {
                            'Seat': this._ride,
                  });
                }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
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
