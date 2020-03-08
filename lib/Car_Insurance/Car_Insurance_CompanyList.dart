import 'package:flutter/material.dart';
class insurance_company extends StatefulWidget {
  insurance_company({Key key, this.email}) : super(key: key);

  final String email;

  @override
  _insurance_companyState createState() => _insurance_companyState();
}

class _insurance_companyState extends State<insurance_company> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          
          appBar: AppBar(
            elevation:6.0,
          ),
          body: Container(
             decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.white,Colors.lightBlue])),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110.0,
                        width: 290.0,
                        child: RaisedButton(
                              color: Colors.white,
                              child: Image.asset('asets/bajajallianz.png'),
                              onPressed: (){}
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top:10.0)),
                      SizedBox(
                        height:30.0,
                        child: Text(
                          "Bajaj Allianz General Insurance co. Ltd.",style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

              Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110.0,
                        width: 290.0,
                        child: RaisedButton(
                              color: Colors.white,
                              child: Image.asset('asets/Bharti-axa-.png'),
                              onPressed: (){},
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(top:10.0)),
                                                  SizedBox(
                                                    height:30.0,
                                                    child: Text(
                                                      "Bharti AXA General Insurance Co. Ltd.",style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110.0,
                        width: 290.0,
                        child: RaisedButton(
                              color: Colors.white,
                              child: Image.asset('asets/hdfc.png',width: 250,),
                              onPressed: (){},
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(top:10.0)),
                                                  SizedBox(
                                                    height:30.0,
                                                    child: Text(
                                                      "HDFC ERGO General Insurance Co. Ltd.",style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110.0,
                        width: 290.0,
                        child: RaisedButton(
                              color: Colors.white,
                              child: Image.asset('asets/icici.PNG',width: 250,),
                              onPressed: (){},
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(top:10.0)),
                                                  SizedBox(
                                                    height:30.0,
                                                    child: Text(
                                                      "ICICI Lombard General Insurance Ltd",style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                       Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110.0,
                        width: 290.0,
                        child: RaisedButton(
                              color: Colors.white,
                              child: Image.asset('asets/iffco.png',),
                              onPressed: (){},
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(top:10.0)),
                                                  SizedBox(
                                                    height:30.0,
                                                    child: Text(
                                                      "IFCCO TOKIO General Insurance Ltd.",style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),


                                             Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110.0,
                        width: 290.0,
                        child: RaisedButton(
                              color: Colors.white,
                              child: Image.asset('asets/new-india.png',),
                              onPressed: (){},
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(top:10.0)),
                                                  SizedBox(
                                                    height:30.0,
                                                    child: Text(
                                                      "New India Assurance Company Ltd. ",style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),



                                            Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110.0,
                        width: 290.0,
                        child: RaisedButton(
                              color: Colors.white,
                              child: Image.asset('asets/orientalinsurance.png',),
                              onPressed: (){},
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(top:10.0)),
                                                  SizedBox(
                                                    height:30.0,
                                                    child: Text(
                                                      "Oriental Insurance Co. Ltd.",style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),



                                            Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110.0,
                        width: 290.0,
                        child: RaisedButton(
                              color: Colors.white,
                              child: Image.asset('asets/royalsundaram.png',),
                              onPressed: (){},
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(top:10.0)),
                                                  SizedBox(
                                                    height:30.0,
                                                    child: Text(
                                                      "royal sundaram general insurance",style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),



                                            Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110.0,
                        width: 290.0,
                        child: RaisedButton(
                              color: Colors.white,
                              child: Image.asset('asets/tata.png',),
                              onPressed: (){},
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(top:10.0)),
                                                  SizedBox(
                                                    height:30.0,
                                                    child: Text(
                                                      "Tata AIG General Insurance Co. Ltd",style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),


                                            Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110.0,
                        width: 290.0,
                        child: RaisedButton(
                              color: Colors.white,
                              child: Image.asset('asets/uiic.png',),
                              onPressed: (){},
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(top:10.0)),
                                                  SizedBox(
                                                    height:30.0,
                                                    child: Text(
                                                      "United India Insurance Co Ltd",style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            



                              
                                          ]
                                    ),
          ),
                                );
                              
                                              
                              }
}