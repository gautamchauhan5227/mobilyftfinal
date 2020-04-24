import 'package:flutter/material.dart';
import 'package:mobilyft/Car_Sell/car_sell_buy/car_buy.dart';
import 'package:mobilyft/Car_Sell/car_sell_buy/sell_car.dart';
class car_add_search extends StatefulWidget {
  car_add_search({Key key, this.email}) : super(key: key);
  final String email;
  @override
  _car_add_searchState createState() => _car_add_searchState();
}

class _car_add_searchState extends State<car_add_search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: false,
            body: ListView(
              children: <Widget>[            
                Padding(padding: EdgeInsets.only(top:20.0)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.25,
                    child: Center(
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              car_sell(email: widget.email,)
                                        )
                                  );
                        },
                        child: Image.asset(
                            'asets/car_add.png',
                            height:MediaQuery.of(context).size.height*0.35 ,
                            width: MediaQuery.of(context).size.width*0.35,
                          ),
                        // shape: CircleBorder(side: BorderSide(color: Colors.blue,width: 3.0)),
                        shape: CircleBorder(),
                        color: Colors.white,
                      )
                    ),
                  ), 

                  Padding(padding: EdgeInsets.only(top:10.0)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.09,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text('Add Car',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w600
                          )
                        ),
                      ),
                  ),

                  Padding(padding: EdgeInsets.only(top:20.0)),
                    Container(
                      height: MediaQuery.of(context).size.height*0.25,
                      
                      child: Center(
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                buy_car_search(email: widget.email,)
                                          )
                                    );
                          },
                          child: Image.asset(
                            'asets/car_search.png',
                            height:MediaQuery.of(context).size.height*0.35 ,
                            width: MediaQuery.of(context).size.width*0.35,
                          ),
                          // shape: CircleBorder(side: BorderSide(color: Colors.lightBlue,width: 3.0)),
                          shape: CircleBorder(),
                          color: Colors.white,
                        )
                      ),
                  ), 
            
                  Padding(padding: EdgeInsets.only(top:10.0)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.09,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text('Search Car',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w600
                          )
                        ),
                      ),
                  ),
              ],
            ),
          ),
    );  
  }
}