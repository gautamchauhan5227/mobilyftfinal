import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:mobilyft/Car_Insurance/Car_Insurance_CompanyList.dart';
import 'package:mobilyft/Car_Rent/Car_Rent_HomePage/car_rent_homepage.dart';
import 'package:mobilyft/Car_Sell/car_sell_home.dart';
import 'package:mobilyft/Car_Service/car_ser_home.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:mobilyft/Login_Page/loginpage.dart';
import 'package:mobilyft/Profile/profile.dart';
import 'package:mobilyft/Ride_Share/HomePage/car_share_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class section_page extends StatefulWidget {
  section_page({Key key, this.email}) : super(key: key);

  final String email;

  @override
  _section_pageState createState() => _section_pageState();
}

class _section_pageState extends State<section_page> {
  CRUD1 crudobj = new CRUD1();
  QuerySnapshot pro;
  String user;

 @override
  void initState() {
    crudobj.getData('user').then((result) {
      setState(() {
        pro = result;
      });
    });
  }

  int l = 0;
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
        child: Container(
          height: 300.0,
          width: 300.0,
         child: Center(
           child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: user_name(), 
                accountEmail: Text(widget.email,style: TextStyle(fontWeight:FontWeight.w300,fontSize: 18.0),),
              currentAccountPicture: CircleAvatar(
                child: Text(
                "" 
                )
              ),
               
              ),
              Container(
                child:Column(
                  children: <Widget>[
                    ListTile(
                      title:Text("Edit Profile",style: TextStyle(fontWeight:FontWeight.w500,fontSize:25.0),),
                      onTap: (){
                        Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                             profile(email: widget.email,) ));
                        
                      },
                    ),
                  ],
                ),
              ),
             
              Padding(padding: EdgeInsets.only(top:320.0)),
            Container(
                       child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                            
                            title: Padding(
                              padding: const EdgeInsets.only(bottom:12.0),
                              child: Center(child: Text('Log Out',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30.0,color: Colors.blue),)),
                            ),
                            onTap:() async {
                                // FirebaseAuth.instance.signOut().then((value) {
                                //   Navigator.pop(context);
                                //   Navigator.pop(context);
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (BuildContext context) =>
                                //               LoginPage()));
                               // });

                                SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.remove('email');
                      // prefs.remove('radiovalue');
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
                              },
                            ),
                       
                      ],
                    )
                  )
            ], 
        
           ),
         ),
        
        
        ),
        
        
        
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
                            onPressed: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                             car_ser_selection(email: widget.email,) ));
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
                            onPressed: () {
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            sell_home(
                                              email: widget.email,
                                            )));
                            },
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

  Widget user_name() {
    if (pro != null) {
      for (int i = 0; i <= pro.documents.length; i++) {
        if (widget.email == pro.documents[i].data['email']) {
          user = pro.documents[i].data['name'];
          return Text(pro.documents[i].data['name'],style: TextStyle(fontSize: 25.0,fontWeight:FontWeight.w600),textAlign: TextAlign.center,);
        }
      }
    } else
      return CircularProgressIndicator();
  }
}