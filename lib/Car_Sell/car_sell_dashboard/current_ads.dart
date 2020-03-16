import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
class car_ads extends StatefulWidget {
  car_ads({Key key, this.email}) : super(key: key);

  final String email;

  @override
  _car_adsState createState() => _car_adsState();
}

class _car_adsState extends State<car_ads> {
  QuerySnapshot ads;
   CRUD1 crudobj = new CRUD1();
  int l = 0;



  @override
  void initState() {
    crudobj.getData('sell car').then((result) {
      setState(() {
        ads = result;
      });
    });
  }

  Widget returnads(int i) {
    if (ads != null) {
      if (widget.email == ads.documents[i].data["email"]) {
        return Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: AnimatedCard(
              direction: AnimatedCardDirection.right, 
              initDelay: Duration(milliseconds: 0), 
              duration: Duration(seconds: 2), 
              child: Card(
                 child: ListTile(
                   title: Container(
                     height: 120.0,
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
                                        "${ads.documents[i].data["car Manufacturer Company"]}",style: TextStyle(fontSize:30.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
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
                                        "${ads.documents[i].data["car Model"]}",style: TextStyle(fontSize:30.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
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
                                        "Rs.""${ads.documents[i].data["car price"]}",style: TextStyle(fontSize:30.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
                                   ),  
                                 ],
                               ),
                             ]
                           ),
                         ),
                             
                           ],
                         ),
                      
                    
                   ),
            )
              )
            )
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          if (ads != null)
            for (int i = 0; i < ads.documents.length; i++)
              Column(
                children: <Widget>[
                  returnads(i),
                ],
              ),
          Padding(padding: EdgeInsets.only(top: 250.0)),
          if (ads == null)
            Column(
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
              ],
            )
        ],
      ),
    );
  }
}