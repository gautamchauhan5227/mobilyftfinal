import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
class rent_dashboard extends StatefulWidget {
  final String email;
  rent_dashboard({Key key, this.email}) : super(key: key);
  @override
  _rent_dashboardState createState() => _rent_dashboardState();
}

class _rent_dashboardState extends State<rent_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 160.0,
                      width: 310.0,
                      child: RaisedButton(
                          color: Colors.white,
                          child: Icon(Icons.directions_car,size:140.0),
                          onPressed: () {
                            
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (BuildContext context) =>
                    //           Create(email: widget.email)));
                
                
                          },
                          shape: CircleBorder()
                          )),
                  SizedBox(
                    height: 10.0,
                  ),
                 

                   ColorizeAnimatedTextKit(
    
                          text: ["Add Rent Car"],
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
                        height: 160.0,
                        width: 310.0,
                        child: RaisedButton(
                            color: Colors.white,
                            child: Icon(Icons.search,size: 140.0,),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //             ridesearch(email: widget.email)));
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
    
                          text: ["Search Rent Car"],
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