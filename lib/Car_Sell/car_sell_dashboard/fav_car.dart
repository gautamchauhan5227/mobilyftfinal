import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Car_Sell/car_sell_home.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:nice_button/NiceButton.dart';
class fav_car extends StatefulWidget {
  fav_car({Key key, this.email}) : super(key: key);

  final String email;
  @override
  _fav_carState createState() => _fav_carState();
}

class _fav_carState extends State<fav_car> {
   var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  QuerySnapshot fav,cars,user;
   CRUD1 crudobj = new CRUD1();
  int l = 0;
String _ccomapny,_cmodel,_cprice,_cyear,_ccolor,_cfuel,_cgear,_cnumber,_cadd,emailcr,namecr;

  void insert(BuildContext context) {
    Map<String, dynamic> data = {
      'Emailreq': widget.email,
      'Emailcr' : emailcr,
      'Namecr' : namecr,
      'Car Company' : _ccomapny,
      'Car Model' : _cmodel,
      'car price':_cprice,
      'car Registration Year':_cyear,
      'car color':_ccolor,
      'car gear type':_cgear,
      'car fuel type':_cfuel,
      'Address person':_cadd,
      'Contact number':_cnumber
      
    };

    crudobj.intrestrequest(data, context).then((result) {}).catchError((e) {
      print(e);
    });
  }


void submit(int i) async {
    //
    
 namecr=user.documents[i].data["name"];
 emailcr=cars.documents[i].data["email"];
 _ccomapny=cars.documents[i].data["car Manufacturer Company"];
 _cmodel=cars.documents[i].data["car Model"];
 _cprice=cars.documents[i].data["car price"];
 _cyear=cars.documents[i].data["car Registration Year"];
 _ccolor=cars.documents[i].data["car color"];
 _cgear=cars.documents[i].data["car gear type"];
 _cfuel=cars.documents[i].data["car fuel type"];
 _cadd=cars.documents[i].data["Address person"];
 _cnumber=cars.documents[i].data["Contact number"];
 
 

  insert(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => sell_home(email: widget.email)));
             
      
  }


  @override
  void initState() {
    crudobj.getData('car fav').then((result) {
      setState(() {
        fav = result;
      });
    });
     crudobj.getData('sell car').then((result) {
      setState(() {
        cars = result;
      });
    });
    crudobj.getData('user').then((result) {
      setState(() {
        user = result;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          if (fav != null)
            for (int i = 0; i < fav.documents.length; i++)
              Column(
                children: <Widget>[
                  returnfav(i),
                ],
              ),
          Padding(padding: EdgeInsets.only(top: 250.0)),
          if (fav == null)
            Column(
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
              ],
            )
        ],
      ),

    );
  }
  Widget returnfav(int i) {
    if (fav != null) {
      if (widget.email == fav.documents[i].data["Emailreq"]) {
        return Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: AnimatedCard(
              direction: AnimatedCardDirection.right, 
              initDelay: Duration(milliseconds: 0), 
              duration: Duration(seconds: 2), 
              child: Padding(
                padding: const EdgeInsets.only(left:20.0,right:20.0,top: 20.0,bottom: 20.0),
                child: Card(
                   child: ListTile(
                     title: Container(
                       height: 200.0,
                       child: Column(
                         children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: Row(
                               children: <Widget>[
                                
                                 Column(
                                   children: <Widget>[
                                     Container(
                                       child:Text(
                                          "Car Company",style: TextStyle(fontSize:20.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left,),
                                     ),  
                                   ],
                                 ),
                                Padding(padding: EdgeInsets.only(left:40.0)),
                                 Column(
                                   children: <Widget>[
                                     Container(
                                       child:Text(
                                          "${fav.documents[i].data["Car Company"]}",style: TextStyle(fontSize:30.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
                                     ),  
                                   ],
                                 ),
                               ]
                             ),
                           ),


                           Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: Row(
                               children: <Widget>[
                                
                                 Column(
                                   children: <Widget>[
                                     Container(
                                       child:Text(
                                          "Car Model",style: TextStyle(fontSize:20.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left,),
                                     ),  
                                   ],
                                 ),
                                 Padding(padding: EdgeInsets.only(left:65.0)),
                                 Column(
                                   children: <Widget>[
                                     Container(
                                       child:Text(
                                          "${fav.documents[i].data["Car Model"]}",style: TextStyle(fontSize:30.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
                                     ),  
                                   ],
                                 ),
                               ]
                             ),
                           ),

                           Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: Row(
                               children: <Widget>[
                                
                                 Column(
                                   children: <Widget>[
                                     Container(
                                       child:Text(
                                          "Car Price",style: TextStyle(fontSize:20.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left,),
                                     ),  
                                   ],
                                 ),
                                 Padding(padding: EdgeInsets.only(left:74.0)),
                                 Column(
                                   children: <Widget>[
                                     Container(
                                       child:Text(
                                          "Rs.""${fav.documents[i].data["car price"]}",style: TextStyle(fontSize:30.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
                                     ),  
                                   ],
                                 ),
                               ]
                             ),
                           ),


                           Padding(
                             padding: const EdgeInsets.only(top:15.0),
                             child: NiceButton(
                               onPressed: (){
                                 submit(i);
                               },
                               text: "Intrest",
                               gradientColors: [secondColor, firstColor],
                               background: null,
                             )
                           ),
                               
                             ],
                           ),
                        
                      
                     ),
            )
                ),
              )
            )
        );
      }
    }
  }
}