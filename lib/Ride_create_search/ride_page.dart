import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:mobilyft/Ride_create_search/ridesearch.dart';


import 'create.dart';

class Ride_Page extends StatefulWidget {
  Ride_Page({Key key, this.email}) : super(key: key);

  final String email;

  @override
  _Ride_PageState createState() => _Ride_PageState();
}

class _Ride_PageState extends State<Ride_Page> {
 QuerySnapshot car;
CRUD1 crudobj = new CRUD1();
String email;

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
                          child: Icon(Icons.directions_car,size:140.0),
                          onPressed: () {
                            if (car != null)
            for (int i = 0; i < car.documents.length; i++)
             { if (email == car.documents[i].data["email"])
                 {   print(car.documents[i].data["car"]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Create(email: widget.email)));
                
                }}
                          },
                          shape: CircleBorder()
                          )),
                  SizedBox(
                    height: 10.0,
                  ),
                 

                   ColorizeAnimatedTextKit(
    
                          text: ["Add Ride"],
                          textStyle: TextStyle(
                              fontSize: 50.0, 
                              fontFamily: "Horizon"
                          ),
                          
                          colors: [
                            Colors.black,
                            Colors.blue,
                            Colors.yellow,
                            Colors.red,
                          ],
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                   ),

  
  
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        height: 172.0,
                        width: 310.0,
                        child: RaisedButton(
                            color: Colors.white,
                            child: Icon(Icons.search,size: 140.0,),
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
                                ),)),
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
                          textStyle: TextStyle(
                              fontSize: 50.0, 
                              fontFamily: "Horizon"
                          ),
                          
                          colors: [
                            Colors.black,
                            Colors.blue,
                            Colors.yellow,
                            Colors.red,
                          ],
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional.topStart ,
                   ),
                ],
              ),
            ),
          ],
        ));
  }
}
