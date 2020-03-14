import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:url_launcher/url_launcher.dart';
class buy_car_search extends StatefulWidget {
  buy_car_search({Key key, this.email}) : super(key: key);

  final String email;

  @override
  _buy_car_searchState createState() => _buy_car_searchState();
}

class _buy_car_searchState extends State<buy_car_search> {
  QuerySnapshot  user, cars;
  String comapny = "";
  String emailcr,namecr;
  CRUD1 crudobj = new CRUD1();
int l = 0;

  TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
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

  void initiateSearch(String val) {
    setState(() {
      comapny = val.trim();
    });
  }

      Widget returncar(int i){
         if (cars != null) {
      if (widget.email != cars.documents[i].data["email"]) {
        return Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: AnimatedCard(
              direction: AnimatedCardDirection.right, //Initial animation direction
              initDelay: Duration(milliseconds: 0), //Delay to initial animation
              duration: Duration(seconds: 2), //Initial animation duration
               //Implement this action to active dismiss
              
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
                              Expanded(
                                child: Column(
                                 children: <Widget>[
                                   Text(
                                        "Car Company",style: TextStyle(fontSize:20.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left,),
                                 ],
                               ),
                               flex: 0,
                               ),
                                Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Column(
                                   children: <Widget>[
                                     Text(
                                          "${cars.documents[i].data["car Manufacturer Company"]}",style: TextStyle(fontSize:30.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
                                   ],
                               ),
                                ),
                              //  flex: 2,
                               ),
                             ]
                           ),
                         ),
                             Padding(
                               padding: const EdgeInsets.all(5.0),
                               child: Row(
                                 children: <Widget>[
                                   Expanded(
                                child: Column(
                                 children: <Widget>[
                                   Text(
                                        "Car Model",style: TextStyle(fontSize:20.0,fontWeight:FontWeight.w300),textAlign: TextAlign.start,),
                                 ],
                               ),
                               flex: 0,
                               ),
                                Expanded(
                                child: Column(
                                 children: <Widget>[
                                   Text(
                                        "${cars.documents[i].data["car Model"]}",style: TextStyle(fontSize:30.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
                                 ],
                               ),
                                flex: 4,
                               ),
                                 ],
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(5.0),
                               child: Row(
                                 children: <Widget>[
                                   Expanded(
                                child: Column(
                                 children: <Widget>[
                                   Text(
                                        "Car Price",style: TextStyle(fontSize:20.0,fontWeight:FontWeight.w300),textAlign: TextAlign.start,),
                                 ],
                               ),
                               flex:0,
                               ),
                                Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 70.0),
                                  child: Column(
                                   children: <Widget>[
                                     Text(
                                          "Rs.""${cars.documents[i].data["car price"]}",style: TextStyle(fontSize:30.0,fontWeight:FontWeight.w300),textAlign: TextAlign.left),
                                   ],
                               ),
                                ),
                            flex: 2,
                               ),
                                 ],
                               ),
                             )
                             
                           ],
                         ),
                      
                    
                   ),
                   onTap: (){
                     emailcr = cars.documents[i].data["email"];
                    print(emailcr);
                     for (int i = 0; i < user.documents.length; i++)
                      if(emailcr == user.documents[i].data["email"])
                      {
                       namecr= user.documents[i].data["name"];
                      }
                       showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.all(Radius.circular(10.0))),
                            title: Center(
                            child: Text(
                              'Car Details',
                              style: TextStyle(
                                fontFamily: 'helvetica_neue_light',
                                fontWeight: FontWeight.w500,
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Name",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              namecr,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),

                                    Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Company",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${cars.documents[i].data["car Manufacturer Company"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),

                                     Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Model",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${cars.documents[i].data["car Model"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),

                                     Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Buy",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${cars.documents[i].data["car Registration Year"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),

                                     Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Fuel Type",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${cars.documents[i].data["car fuel type"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),

                                    Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Gear Type",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${cars.documents[i].data["car gear type"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),

                                     Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Color",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${cars.documents[i].data["car color"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),

                                     Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Seat",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${cars.documents[i].data["car seat"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),
                                  
                                  Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Car Number",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${cars.documents[i].data["car number"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),

                                    Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "KM Of Used",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${cars.documents[i].data["km of use"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),

                                    Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Price",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "Rs.""${cars.documents[i].data["car price"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),

                                    Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Address",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${cars.documents[i].data["Address person"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                            
                                          )
                                        ],
                                      )
                                    ])),

                                    Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: new Column(children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Contact",
                                              // 'Destination'
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            flex: 1,
                                          ),
                                          Icon(Icons.chevron_right),
                                          
                                          Expanded(
                                            child: FlatButton(
                                                onPressed: () => launch("tel:""${cars.documents[i].data["Contact number"]}"),
                                                child: new Text("${cars.documents[i].data["Contact number"]}",style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w300),)),
                                            
                                          )
                                        ],
                                      )
                                    ])),
                              ],
                            ),
                          ),
                           actions: <Widget>[
                            FlatButton(
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                              child: Text(
                                "Buy",
                                style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                
                              },
                            ),
                            FlatButton(
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                              child: Text(
                                "Favourite",
                                style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                
                              },
                            ),
                            FlatButton(
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                              child: Text(
                                "Cancel",
                                style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                            )
                          ],
                        );
                      }
                       );
                   },
                 ),
          ) 
                ),
        );
            
            }
         }
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
        ),
        backgroundColor: Colors.white,
         iconTheme: IconThemeData(
             color: Colors.black
          ),
        title: TextField(
          onChanged: (val) => initiateSearch(val),
          style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w300),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search...",
            hintStyle: TextStyle(fontSize:25.0,fontWeight:FontWeight.w300)
          ),
        ),
      ),

      body: ListView(
        children: <Widget>[
          if (cars != null)
            for (int i = 0; i < cars.documents.length; i++)
              if (comapny == cars.documents[i].data["car Manufacturer Company"])
                Column(
                  children: <Widget>[
                    returncar(i),
                  ],
                ),
          Padding(padding: EdgeInsets.only(top: 250.0)),
          if (cars == null)
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
