import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:mobilyft/Car_Rent/Car_Rent_HomePage/car_rent_homepage.dart';
import 'package:mobilyft/Login_Page/loginpage.dart';
import 'package:mobilyft/Ride_Share/HomePage/car_share_home_page.dart';

class section_page extends StatefulWidget {
  section_page({Key key, this.email}) : super(key: key);

  final String email;

  @override
  _section_pageState createState() => _section_pageState();
}

class _section_pageState extends State<section_page> {


  Future<bool> manage_back_button() {
    showDialog(
        context: context,
        builder: (_) => FlareGiffyDialog(
              flarePath: 'asets/space_demo.flr',
              flareAnimation: 'loading',
              title: Text(
                'Thank you',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              description: Text(
                'Do you really want to exit.',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              onOkButtonPressed: () {
                exit(0);
              },
            ));
  }
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: manage_back_button,
    
    child:Scaffold(
      
      
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child:AppBar(backgroundColor: Colors.white,actions: <Widget>[
            IconButton(icon: Icon(Icons.power_settings_new,color: Colors.red,), onPressed: (){
               FirebaseAuth.instance.signOut().then((value) {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginPage()));
                                 
            });
            }
            ),
            ],
            iconTheme: IconThemeData(color: Colors.black,size: 30.0),
          ),
      ),

      drawer: Drawer(),
      
      
      
      body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 15, right: 15),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child:  Column(
                    children: <Widget>[
                     SizedBox(
                       height:120.0,
                       width:140.0,
                       child: RaisedButton(
                          color: Colors.white,
                          child: Icon(Icons.directions_car,size:100.0),
                          onPressed: () {
                            
                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Home_page(
                                            email: widget.email,
                                          )));
                          },
                          // shape: CircleBorder()
                          ),
                     ),
                  Padding(padding: EdgeInsets.only(top:10.0)),
                   SizedBox(
                     height:40.0,
                     width: 140.0,
                     child: ColorizeAnimatedTextKit(
                          text: ["Ride Share"],                          
                          textStyle: TextStyle(
                              fontSize: 30.0, 
                              fontFamily: "Horizon",                           
                          ),                         
                          colors: [
                            Colors.black,
                            Colors.blue,
                            Colors.yellow,
                            Colors.red,
                          ],
                          textAlign: TextAlign.center,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                   ),
                   ) ,                     
                    ],
                  ),),

                 Expanded(child:  Column(
                    children: <Widget>[
                     SizedBox(
                       height:120.0,
                       width:140.0,
                       child: RaisedButton(
                          color: Colors.white,
                          child: Icon(Icons.directions_car,size:100.0),
                          onPressed: () {
                             Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          rent_homepage(
                                            email: widget.email,
                                          )));
                          },
                          // shape: CircleBorder()
                          ),
                     ),
                 
                  Padding(padding: EdgeInsets.only(top:10.0,left: 15, right: 15)),
                   SizedBox(
                     height:40.0,
                     width: 140.0,
                     child: ColorizeAnimatedTextKit(    
                          text: ["Car Rent"],                          
                          textStyle: TextStyle(
                              fontSize: 30.0, 
                              fontFamily: "Horizon",                           
                          ),                          
                          colors: [
                            Colors.black,
                            Colors.blue,
                            Colors.yellow,
                            Colors.red,
                          ],
                          textAlign: TextAlign.center,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                   ),
                   ) ,                                    
                    ],
                  ),),
                ],
              ),
          ),

Padding(padding: EdgeInsets.only(top:10.0,left: 15, right: 15),
               child:Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child:  Column(
                    children: <Widget>[
                     SizedBox(
                       height:120.0,
                       width:140.0,
                       child: RaisedButton(
                          color: Colors.white,
                          child: Icon(Icons.directions_car,size:100.0),
                          onPressed: () {},
                          // shape: CircleBorder()
                          ),
                     ),
                  Padding(padding: EdgeInsets.only(top:10.0,left: 15, right: 15)),
                   SizedBox(
                     height:40.0,
                     width: 140.0,
                     child: ColorizeAnimatedTextKit(
                          text: ["Car Service"],                          
                          textStyle: TextStyle(
                              fontSize: 30.0, 
                              fontFamily: "Horizon",                           
                          ),                         
                          colors: [
                            Colors.black,
                            Colors.blue,
                            Colors.yellow,
                            Colors.red,
                          ],
                          textAlign: TextAlign.center,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                   ),
                   ) ,                     
                    ],
                  ),),

                 Expanded(child:  Column(
                    children: <Widget>[
                     SizedBox(
                       height:120.0,
                       width:140.0,
                       child: RaisedButton(
                          color: Colors.white,
                          child: Icon(Icons.directions_car,size:100.0),
                          onPressed: () {},
                          // shape: CircleBorder()
                          ),
                     ),
                 
                  Padding(padding: EdgeInsets.only(top:10.0)),
                   SizedBox(
                     height:40.0,
                     width: 140.0,
                     child: ColorizeAnimatedTextKit(    
                          text: ["Car sell"],                          
                          textStyle: TextStyle(
                              fontSize: 30.0, 
                              fontFamily: "Horizon",                           
                          ),                          
                          colors: [
                            Colors.black,
                            Colors.blue,
                            Colors.yellow,
                            Colors.red,
                          ],
                          textAlign: TextAlign.center,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                   ),
                   ) ,                                    
                    ],
                  ),),
                ],
               )
              ),


              Padding(padding: EdgeInsets.only(top:10.0,left: 15, right: 15),

               child:Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child:  Column(
                    children: <Widget>[
                     SizedBox(
                       height:120.0,
                       width:140.0,
                       child: RaisedButton(
                          color: Colors.white,
                          child: Icon(Icons.directions_car,size:100.0),
                          onPressed: () {},
                          // shape: CircleBorder()
                          ),
                     ),
                  Padding(padding: EdgeInsets.only(top:10.0)),
                   SizedBox(
                     height:40.0,
                     width: 140.0,
                     child: ColorizeAnimatedTextKit(
                          text: ["Insurance"],                          
                          textStyle: TextStyle(
                              fontSize: 30.0, 
                              fontFamily: "Horizon",                           
                          ),                         
                          colors: [
                            Colors.black,
                            Colors.blue,
                            Colors.yellow,
                            Colors.red,
                          ],
                          textAlign: TextAlign.center,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                   ),
                   ) ,                     
                    ],
                  ),),

                 Expanded(child:  Column(
                    children: <Widget>[
                     SizedBox(
                       height:120.0,
                       width:140.0,
                       child: RaisedButton(
                          color: Colors.white,
                          child: Icon(Icons.directions_car,size:100.0),
                          onPressed: () {},
                          // shape: CircleBorder()
                          ),
                     ),
                 
                  Padding(padding: EdgeInsets.only(top:10.0)),
                   SizedBox(
                     height:40.0,
                     width: 140.0,
                     child: ColorizeAnimatedTextKit(    
                          text: ["About"],                          
                          textStyle: TextStyle(
                              fontSize: 30.0, 
                              fontFamily: "Horizon",                           
                          ),                          
                          colors: [
                            Colors.black,
                            Colors.blue,
                            Colors.yellow,
                            Colors.red,
                          ],
                          textAlign: TextAlign.center,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                   ),
                   ) ,                                    
                    ],
                  ),),
                ],
               )
              ),              
            
          ],
      )
    )
    );
  }
}