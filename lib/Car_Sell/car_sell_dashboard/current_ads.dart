import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Car_Sell/car_sell_dashboard/view_ads.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:nice_button/NiceButton.dart';
class car_ads extends StatefulWidget {
  car_ads({Key key, this.email}) : super(key: key);
  final String email;
  @override
  _car_adsState createState() => _car_adsState();
}
class _car_adsState extends State<car_ads> {
  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  QuerySnapshot ads;
  CRUD1 crudobj = new CRUD1();
  int l = 0;
String adr,phn,km,prc;
final formKey = GlobalKey<FormState>();
bool validateAndSave() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }
  @override
  void initState() {
    crudobj.getData('sell car').then((result) {
      setState(() {
        ads = result;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child:AppBar(
        
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
              "Current Ads",
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
          )
      ),
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
   Widget returnads(int i) {
    if (ads != null) {
      if (widget.email == ads.documents[i].data["email"]) {
        return Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: AnimatedCard(
              direction: AnimatedCardDirection.right, 
              initDelay: Duration(milliseconds: 0), 
              duration: Duration(seconds: 2), 
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                   child: ListTile(
                     title: Container(
                       
                       child: Column(
                         children: <Widget>[
                            Padding(
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
                                   
                                ),
                                
                              Expanded(
                                child: Text(
                                 "${ads.documents[i].data["car Manufacturer Company"]}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w300),
                                    ), 
                                    flex: 1,             
                                  )
                                ],
                              ),
                               Padding(padding: EdgeInsets.only(top: 5.0),),
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
                                   
                                ),
                               
                              Expanded(
                                child: Text(
                                 "${ads.documents[i].data["car Model"]}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w300),
                                    ), 
                                    flex: 1,             
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 5.0),),
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
                                   
                                ),
                                
                              Expanded(
                                child: Text(
                                 "${ads.documents[i].data["car price"]}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w300),
                                    ),
                                    flex: 1,              
                                  )
                                ],
                              )
                            ]
                          )
                        ),
                        Padding(padding: EdgeInsets.only(top:15.0)),          
                ],
              ),               
            ),
            onTap: (){
              if (widget.email == ads.documents[i].data["email"])
              showCupertinoDialog(
                context: context, 
                builder: (BuildContext context){
                  return CupertinoAlertDialog(
                    title: Center(
                      child: Text(
                        "Car Detail",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    content: ListBody(
                      children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 0.0),
                              child: new Column(children: <Widget>[
                                Divider(),
                                    Padding(
                                      padding: const EdgeInsets.only(top:10.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Company",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${ads.documents[i].data["car Manufacturer Company"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                            ),
                                          ),  
                                        ],
                                      ),
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
                                        ),
                                        Icon(Icons.chevron_right),
                                        Expanded(
                                          child: Text(
                                            "${ads.documents[i].data["car Model"]}",
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
                                        ),
                                        Icon(Icons.chevron_right),
                                        Expanded(
                                          child: Text(
                                            "${ads.documents[i].data["car price"]}",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
                                          ),                                          
                                        )
                                      ],
                                    )
                                  ])),

                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                              child: Text(
                                "View Car Detail",
                                style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                 Navigator.pop(context, true);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                            view_ads(
                                              email: ads.documents[i].data["email"], 
                                              company:ads.documents[i].data["car Manufacturer Company"],
                                              model:ads.documents[i].data["car Model"],
                                              year:ads.documents[i].data["car Registration Year"],
                                              fuel:ads.documents[i].data["car fuel type"],
                                              gear:ads.documents[i].data["car gear type"],
                                              color:ads.documents[i].data["car color"],
                                              carnum:ads.documents[i].data["car number"],
                                              km:ads.documents[i].data["km of use"],
                                              price:ads.documents[i].data["car price"],
                                              number:ads.documents[i].data["Contact number"],
                                              address:ads.documents[i].data["Address person"]
                                            )
                                      )
                                    );
                              },
                            ),

                            FlatButton(
                              onPressed: (){
                                showDialog<void>(
                                      context: context,
                                      barrierDismissible: false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return CupertinoAlertDialog(
                                          
                                              content: SingleChildScrollView(
                                                child: Center(
                                                  child: Text(
                                                    "Your Car is Sold? Yes/No",
                                                      style: TextStyle(
                                                        fontSize:25,
                                                        fontWeight:FontWeight.w400
                                                        ),
                                                      )
                                                    ),
                                                  ),
                                    actions: <Widget>[
                                    FlatButton(
                                      
                                      
                                      child: Text(
                                        "    Yes    ",
                                        style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                                      ),
                                      onPressed: () {
                                      crudobj.deleteads(ads.documents[i].documentID);                               
                                          Navigator.pop(context, true);
                                          Navigator.pop(context, true); 
                                          Navigator.pop(context, true);                               
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    car_ads(email: widget.email)
                                                    )
                                                  );                             
                                                },
                                              ),
                                    Padding(padding: EdgeInsets.only(left:17.0)),
                                    FlatButton(
                                      
                                      child: Text(
                                        "    No    ",
                                        style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                                      ),
                                      onPressed: () {
                                      Navigator.pop(context, true);
                                      },
                                    ),
                                    Padding(padding: EdgeInsets.only(left:20.0)),
                                    ]
                                    );
                                  }
                                ); 
                              },
                               
                              child: Text(
                                "Sold",
                                style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w300),
                              ),
                            ),
                            FlatButton(
                              onPressed: (){
                                Navigator.pop(context,true);
                              },
                               child: Text(
                                "Cancle",
                                style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w300),
                              )
                            )
                    ],
                  );
                }
              );
            },
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