import 'package:animated_card/animated_card.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Car_Sell/car_sell_dashboard/fav_car.dart';
import 'package:mobilyft/Car_Sell/car_sell_dashboard/intrested_car.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
class buy_car_search extends StatefulWidget {
  buy_car_search({Key key, this.email}) : super(key: key);
  final String email;
  @override
  _buy_car_searchState createState() => _buy_car_searchState();
}
class _buy_car_searchState extends State<buy_car_search> {
  String currentText = "";
   GlobalKey<AutoCompleteTextFieldState<String>> keyComp = new GlobalKey();
  QuerySnapshot  user, cars;
  String comapny = "";
  String emailcr,namecr,_ccomapny,_cmodel,_cprice,_cyear,_ccolor,_cfuel,_cgear,_cnumber,_cadd;
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
   Navigator.pop(context, true);
      Navigator.pop(context, true);
       Navigator.pop(context, true);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => intrested_car(email: widget.email)));
            
  }


void insertfav(BuildContext context) {
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
    crudobj.carfav(data, context).then((result) {}).catchError((e) {
      print(e);
    });
  }

  void submitfav(int i) async {
    //
    
 
 _ccomapny=cars.documents[i].data["car Manufacturer Company"];
 _cmodel=cars.documents[i].data["car Model"];
 _cprice=cars.documents[i].data["car price"];
 _cyear=cars.documents[i].data["car Registration Year"];
 _ccolor=cars.documents[i].data["car color"];
 _cgear=cars.documents[i].data["car gear type"];
 _cfuel=cars.documents[i].data["car fuel type"];
 _cadd=cars.documents[i].data["Address person"];
 _cnumber=cars.documents[i].data["Contact number"];
 
 

  insertfav(context);
     Navigator.pop(context, true);
     Navigator.pop(context, true);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => fav_car(email: widget.email)));
            
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
           leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), 
          onPressed:(){
            Navigator.pop(context, true);
          }
           ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
        ),
        backgroundColor: Colors.white,
         iconTheme: IconThemeData(
             color: Colors.black
          ),
          title: SimpleAutoCompleteTextField(
            key: keyComp,
            decoration: InputDecoration(
              hintText: 'Search Car...',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 30.0),            
            ),
            style: TextStyle(
             fontSize: 24.0,
             fontWeight: FontWeight.w600 
            ),
            controller: TextEditingController(),
            suggestions: suggestionsCompany,
            textChanged: (text) => currentText = text,
            textSubmitted:(val)=>initiateSearch(val),
            submitOnSuggestionTap: true,
            clearOnSubmit: false,
            // onFocusChanged: (val)=>initiateSearch(val),
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
            ),

        ],
      ),
    );
  }
        Widget returncar(int i){
         if (cars != null) {
      if (widget.email != cars.documents[i].data["email"]) {
        return Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: AnimatedCard(
              direction: AnimatedCardDirection.right, 
              initDelay: Duration(milliseconds: 0), 
              duration: Duration(seconds: 2), 
               
              
              child: Card(
                 child: ListTile(
                   title: Container(
                     height: 170.0,
                    //  child: Column(
                    //    children: <Widget>[
                    //      Padding(
                    //        padding: const EdgeInsets.all(5.0),
                    //        child: Row(
                    //          children: <Widget>[
                    //            Expanded(child: Column(
                    //              children: <Widget>[
                    //                Container(
                    //                  child:Text(
                    //                     "Car Company",
                    //                     style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w500),
                    //                     textAlign: TextAlign.left,),
                    //                ),  
                    //              ],
                    //            ),
                    //            flex: 0,
                    //            ),
                               
                    //           Padding(padding: EdgeInsets.only(left:20.0)),
                    //           Expanded(child: Column(
                    //              children: <Widget>[
                    //                Container(
                    //                  child:Text(
                    //                     "${cars.documents[i].data["car Manufacturer Company"]}",
                    //                     style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w300),
                    //                     textAlign: TextAlign.left),
                    //                ),  
                    //              ],
                    //            ),
                    //            flex: 0,
                    //           ),
                               
                    //          ]
                    //        ),
                    //      ),


                    //      Padding(
                    //        padding: const EdgeInsets.all(5.0),
                    //        child: Row(
                    //          children: <Widget>[
                    //           Expanded(child: Column(
                    //              children: <Widget>[
                    //                Container(
                    //                  child:Text(
                    //                     "Car Model",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w500),
                    //                     textAlign: TextAlign.left,),
                    //                ),  
                    //              ],
                    //            ),
                    //            flex: 0,
                    //           ),
                               
                    //            Padding(padding: EdgeInsets.only(left:0.0)),
                    //            Expanded(child: Column(
                    //              children: <Widget>[
                    //                Container(
                    //                  child:Text(
                    //                     "${cars.documents[i].data["car Model"]}",
                    //                     style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w300),
                    //                     textAlign: TextAlign.left),
                    //                ),  
                    //              ],
                    //             ),
                    //             flex: 1,
                    //            ),                               
                    //          ]
                    //        ),
                    //      ),

                    //      Padding(
                    //        padding: const EdgeInsets.all(5.0),
                    //        child: Row(
                    //          children: <Widget>[
                    //           Expanded(child:  Column(
                    //              children: <Widget>[
                    //                Container(
                    //                  child:Text(
                    //                     "Car Price",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w500),textAlign: TextAlign.left,),
                    //                ),  
                    //              ],
                    //            ),
                    //            flex: 0,
                    //           ),
                              
                    //            Padding(padding: EdgeInsets.only(left:57.0)),
                    //            Expanded(child: Column(
                    //              children: <Widget>[
                    //                Container(
                    //                  child:Text(
                    //                     "Rs.""${cars.documents[i].data["car price"]}",
                    //                     style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w300),
                    //                     textAlign: TextAlign.left),
                    //                ),  
                    //              ],
                    //            ),
                    //            flex: 1,
                    //            ),
                               
                    //          ]
                    //        ),
                    //      ),
                             
                    //        ],
                    //      ),

                    child:Padding(
                       padding: EdgeInsets.only(top: 15.0),
                        child: new Column(children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Car Company",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500),
                                 ),
                                   flex: 1,
                                ),
                                
                              Expanded(
                                child: Text(
                                 "${cars.documents[i].data["car Manufacturer Company"]}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                                    ),              
                                  )
                                ],
                              ),
                               Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Car Model",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500),
                                 ),
                                   flex: 1,
                                ),
                               
                              Expanded(
                                child: Text(
                                 "${cars.documents[i].data["car Model"]}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                                    ),              
                                  )
                                ],
                              ),
                              Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Car Price",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500),
                                 ),
                                   flex: 1,
                                ),
                                
                              Expanded(
                                child: Text(
                                 "${cars.documents[i].data["car price"]}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                                    ),              
                                  )
                                ],
                              )
                            ]
                          )
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
                              ],
                            ),
                          ),
                           actions: <Widget>[
                            //  Padding(padding: EdgeInsets.only(left:10.0)),
                            FlatButton(
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                              child: Text(
                              "Intrest",
                                style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                submit(i);
                              },
                            ),
                            Padding(padding: EdgeInsets.only(left:10.0)),
                            FlatButton(
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                              child: Text(
                                "Fav",
                                style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                submitfav(i);
                              },
                            ),
                            Padding(padding: EdgeInsets.only(left:10.0)),
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
            
            }else
        return Container();
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
         }
      }

       List<String> suggestionsCompany=[
    "Audi","BMW","Datsun","Fiat","Ford","Honda","Hyundai","Jeep","Mahindra","Maruti-Suzuki",
    "Nissan","Renault","Skoda","Tata", "Toyota","Volvo","VolksWagen"  
  ];
}
