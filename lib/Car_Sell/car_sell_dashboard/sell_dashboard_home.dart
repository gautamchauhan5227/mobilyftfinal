import 'package:flutter/material.dart';
import 'package:mobilyft/Car_Sell/car_sell_dashboard/current_ads.dart';
class sell_dashboard extends StatefulWidget {
  sell_dashboard({Key key, this.email}) : super(key: key);
  final String email;
  @override
  _sell_dashboardState createState() => _sell_dashboardState();
}

class _sell_dashboardState extends State<sell_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top:30.0,left:15.0,right:15.0),
          child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
  new GestureDetector(
        onTap: (){  
             Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));
        },
        child: new Container(
          width: 310.0,
          height: 200.0, 
          child: Image.asset("asets/give_Service.jpg",height: 200.0,width: 310.0,fit: BoxFit.fill,),
        )
    ),

     SizedBox(
          height: 10.0,
              ),
                  Text("Current Ads",style: TextStyle(
                              fontSize: 30.0, 
                              fontWeight: FontWeight.w400
                          ),),

Padding(padding: EdgeInsets.only(top:30.0)),
  
new GestureDetector(
        onTap: (){ 
          // Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (BuildContext context) =>
          //                     get_services(email: widget.email)));   
        },
        child: new Container(
          width: 310.0,
          height: 200.0, 
          child: Image.asset("asets/searchrent.jpg",height: 200.0,width: 310.0,fit: BoxFit.fill,),
        )
    ),

     SizedBox(
          height: 10.0,
              ),
                  Text("Fav Car List",style: TextStyle(
                              fontSize: 30.0, 
                              fontWeight: FontWeight.w400
                          ),),


                          Padding(padding: EdgeInsets.only(top:30.0)),
                ],
              ),
          
          ),
        ],
      )
    );
  }
}