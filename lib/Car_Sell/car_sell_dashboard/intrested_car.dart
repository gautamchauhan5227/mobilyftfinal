import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:nice_button/NiceButton.dart';
class intrested_car extends StatefulWidget {
  intrested_car({Key key, this.email}) : super(key: key);

  final String email;
  @override
  _intrested_carState createState() => _intrested_carState();
}

class _intrested_carState extends State<intrested_car> {

   var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  QuerySnapshot intrest,cars,user;
   CRUD1 crudobj = new CRUD1();
  int l = 0;

  @override
  void initState() {
    crudobj.getData('intrest request').then((result) {
      setState(() {
        intrest= result;
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
              "Intrested Car",
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
      body:ListView(
        children: <Widget>[
          if (intrest != null)
            for (int i = 0; i < intrest.documents.length; i++)
              Column(
                children: <Widget>[
                  returnintrest(i),
                ],
              ),
          Padding(padding: EdgeInsets.only(top: 250.0)),
          if (intrest == null)
            Column(
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
              ],
            )
        ],
      ),

    );
  }
  Widget returnintrest(int i) {
    if (intrest != null) {
      if (widget.email == intrest.documents[i].data["Emailreq"]) {
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
                                          "${intrest.documents[i].data["Car Company"]}",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
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
                                          "${intrest.documents[i].data["Car Model"]}",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
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
                                          "Rs.""${intrest.documents[i].data["car price"]}",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
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
                                 crudobj.deleteintrestcar(intrest.documents[i].documentID);
                                
                                 Navigator.pop(context, true);
                                 
                                
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            intrested_car(email: widget.email,)));
                               },
                               text: "Remove",
                               gradientColors: [secondColor, firstColor],
                               background: null,
                             )
                           ),
                               
                             ],
                           ),
                        
                      
                     ),
                                 ),
            
                ),
                
              )
            )
        );
     } else
        return Container();
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}