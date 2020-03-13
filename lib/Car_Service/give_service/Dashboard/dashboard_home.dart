import 'package:flutter/material.dart';
class give_dashboard extends StatefulWidget {
   give_dashboard({Key key, this.email}) : super(key: key);

  final String email;
  @override
  _give_dashboardState createState() => _give_dashboardState();
}

class _give_dashboardState extends State<give_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 40, left: 15, right: 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
  new GestureDetector(
        onTap: (){  
            //  Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (BuildContext context) =>
            //                   give_home(email: widget.email)));
        },
        child: new Container(
          width: 310.0,
          height: 100.0, 
          child: Image.asset("asets/give_Service.jpg",height: 200.0,width: 310.0,fit: BoxFit.fill,),
        )
    ),

     SizedBox(
          height: 10.0,
              ),
                  Text("Garage Details",style: TextStyle(
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
          height: 100.0, 
          child: Image.asset("asets/searchrent.jpg",height: 200.0,width: 310.0,fit: BoxFit.fill,),
        )
    ),

     SizedBox(
          height: 10.0,
              ),
                  Text("Bill Status",style: TextStyle(
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
          height: 100.0, 
          child: Image.asset("asets/searchrent.jpg",height: 200.0,width: 310.0,fit: BoxFit.fill,),
        )
    ),

     SizedBox(
          height: 10.0,
              ),
                  Text("History Car Service List",style: TextStyle(
                              fontSize: 30.0, 
                              fontWeight: FontWeight.w400
                          ),),
                ],
              ),
            ),
        ],
      )
    );
  }
}