import 'package:flutter/material.dart';
import 'package:mobilyft/Car_Rent/Car_Rent_Add_Search/car_rent_add.dart';
class rent_addsearch extends StatefulWidget {
  final String email;
  rent_addsearch({Key key, this.email}) : super(key: key);
  @override
  _rent_addsearchState createState() => _rent_addsearchState();
}
class _rent_addsearchState extends State<rent_addsearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomPadding: false,
                body: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                        new GestureDetector(
                                onTap: (){  
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                        rent_add(email: widget.email)
                                      )
                                    ); 
                                },
                                child: new Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2.0),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                    width: MediaQuery.of(context).size.width*1.0,
                                    height: MediaQuery.of(context).size.height*0.28, 
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:2.8,left: 2.5,right: 2.5,bottom: 2.8),
                                      child: Image.asset(
                                        "asets/caradd.jpg",
                                        //fit: BoxFit.fill,
                                      ),
                                    ),
                                )
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height*0.08,
                                child:Text("Add Car On Rent",
                                      style: TextStyle(
                                        fontSize: 35.0,
                                        fontWeight: FontWeight.w400
                                      ),
                                  )
                            ),

                            Padding(padding: EdgeInsets.only(top:30.0)),

                            new GestureDetector(
                                onTap: (){   
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (BuildContext context) =>
                                  //       payment()
                                  //     )
                                  //   ); 
                                  },
                                  child: new Container(
                                    decoration: BoxDecoration(
                                    border: Border.all(width: 2.0),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                    width: MediaQuery.of(context).size.width*1.0,
                                    height: MediaQuery.of(context).size.height*0.28, 
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Image.asset(
                                        "asets/searchrent.jpg",                                        
                                      ),
                                    ),
                                  )
                              ),

                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.08,
                                child:Text("Search Car On Rent",
                                      style: TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.w400
                                    ),
                                  )
                            ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}