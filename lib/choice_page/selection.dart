import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:mobilyft/Car_Insurance/Car_Insurance_CompanyList.dart';
import 'package:mobilyft/Car_Rent/Car_Rent_HomePage/car_rent_homepage.dart';
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
      
      
      
     
      
      drawer: Drawer(
        elevation:6.0,
      
      ),
      
      
      
      body: 
      Container(
         decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.white,Colors.lightBlue])),
        child: ListView(
          
            children: <Widget>[
              Padding(padding:EdgeInsets.only(top:20.0),
              child: Center(child: Text("Welcome To MobiLyft",style: TextStyle(fontFamily:"Merriweather",fontSize: 30.0,fontWeight: FontWeight.bold),)),
              
              ),
             
              
              Padding(
                padding: EdgeInsets.only(top: 40.0, left: 10, right: 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child:  Column(
                      children: <Widget>[
                             Container(
                            
                         
                         height:140.0,
                         width:160.0,
                         child: RaisedButton(
                           
                            color: Colors.white,
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
                                         
                      ],
                    ),),

                   Expanded(child:  Column(
                      children: <Widget>[
                       SizedBox(
                         height:140.0,
                         width:160.0,
                         child: RaisedButton(
                            color: Colors.white,
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
                            
                      ],
                    ),),
                  ],
                ),
            ),

Padding(padding: EdgeInsets.only(top:30.0,left: 10, right: 10),
                 child:Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child:  Column(
                      children: <Widget>[
                       SizedBox(
                         height:140.0,
                         width:160.0,
                         child: RaisedButton(
                            color: Colors.white,
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
                     ) ,
                            onPressed: () {},
                            // shape: CircleBorder()
                            ),
                       ),
                              
                      ],
                    ),),

                   Expanded(child:  Column(
                      children: <Widget>[
                       SizedBox(
                         height:140.0,
                         width:160.0,
                         child: RaisedButton(
                            color: Colors.white,
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
                            onPressed: () {},
                            // shape: CircleBorder()
                            ),
                       ),                                 
                      ],
                    ),),
                  ],
                 )
                ),


                Padding(padding: EdgeInsets.only(top:30.0,left: 10, right: 10),

                 child:Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child:  Column(
                      children: <Widget>[
                       SizedBox(
                         height:140.0,
                         width:160.0,
                         child: RaisedButton(
                            color: Colors.white,
                            child: ColorizeAnimatedTextKit(
                            text: ["Car Insurance"],                          
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
                            onPressed: () {
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            insurance_company(
                                              email: widget.email,
                                            )));
                            },
                            // shape: CircleBorder()
                            ),
                       ),                 
                      ],
                    ),),

                   Expanded(child:  Column(
                      children: <Widget>[
                       SizedBox(
                         height:140.0,
                         width:160.0,
                         child: RaisedButton(
                            color: Colors.white,
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
                            onPressed: () {},
                            // shape: CircleBorder()
                            ),
                       ),                               
                      ],
                    ),),
                  ],
                 )
                ),              
              
            ],
        ),
      )
    )
    );
  }
}