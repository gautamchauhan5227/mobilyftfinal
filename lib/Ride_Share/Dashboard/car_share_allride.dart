import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
class allride extends StatefulWidget {
  allride({Key key, this.email}) : super(key: key);
  final String email;
  @override
  _allrideState createState() => _allrideState();
}
class _allrideState extends State<allride> {
  CRUD1 crudobj = new CRUD1();
int l = 0;
  QuerySnapshot ride;
  String _src,_dest,_time,_seat;
  @override
  void initState() {
    crudobj.getData('all ride').then((result) {
      setState(() {
        ride = result;
      });
    });
  }
void insert(BuildContext context) {    
    Map<String, dynamic> data = {
      'email': widget.email,
      'source': _src,
      'dest': _dest,
      'time': _time,
      'Seat': _seat,
    };
    crudobj.addDetail(data, context).then((result) {}).catchError((e) {
      print(e);
    });
    crudobj.notify(data, context).then((result) {}).catchError((e) {
      print(e);
    });

    crudobj.history(data, context).then((result) {}).catchError((e) {
      print(e);
    });
  }
  void submit(int i) async {   
 _src=ride.documents[i].data["source"]; 
 _dest=ride.documents[i].data["dest"];
 _time=ride.documents[i].data["time"];
 _seat=ride.documents[i].data["Seat"];  
      insert(context);
      Navigator.pop(context,true);
      Navigator.pop(context,true);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  allride(email: widget.email)));
        }
  
  Widget returnride(int i) {
    if (ride != null) {
      if (widget.email == ride.documents[i].data["email"]) {
        return Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: AnimatedCard(
              direction: AnimatedCardDirection.right, 
              initDelay: Duration(milliseconds: 5), 
              duration: Duration(seconds: 3), 
            child: Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 10.0),
              child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      size: 60.0,
                    ),
                    title: Text(
                        "${ride.documents[i].data["source"]}\tto\t${ride.documents[i].data["dest"]}",
                        style: TextStyle(
                          fontSize:30.0,
                          fontWeight: FontWeight.w400
                          ),
                        ),
                    subtitle: Text("Time : "
                        "${ride.documents[i].data["time"]}\nSeat : ${ride.documents[i].data["Seat"]}",
                        style: TextStyle(
                          fontSize:20.0
                          ),
                        ),
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                              child: Text(
                                'Ride Details',
                                style: TextStyle(
                                  fontFamily: 'helvetica_neue_light',
                                  fontWeight: FontWeight.bold,
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
                                            Icon(
                                              Icons.location_searching,
                                              size: 40.0,
                                            ),
                          
                                            Icon(Icons.chevron_right),
                                            Expanded(
                                              child: Text(
                                                "${ride.documents[i].data["source"]}",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w300),
                                              ),
                                              flex: 1,
                                            )
                                          ],
                                        )
                                      ])),
                                  Padding(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: new Column(children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              size: 40.0,
                                            ),
                                           
                                            Icon(Icons.chevron_right),
                                            Expanded(
                                              child: Text(
                                                "${ride.documents[i].data["dest"]}",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w300),
                                              ),
                                              flex: 1,
                                            )
                                          ],
                                        )
                                      ])),
                                  Padding(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: new Column(children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.access_time,
                                              size: 40.0,
                                            ),
                                           
                                            Icon(Icons.chevron_right),
                                            Expanded(
                                              child: Text(
                                                "${ride.documents[i].data["time"]}",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w300),
                                              ),
                                              flex: 1,
                                            )
                                          ],
                                        )
                                      ])),
                                  Padding(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: new Column(children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.airline_seat_recline_normal,
                                              size: 40.0,
                                            ),
                                            
                                            Icon(Icons.chevron_right),
                                            Expanded(
                                              child: Text(
                                                "${ride.documents[i].data["Seat"]}",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w300),
                                              ),
                                              flex: 1,
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
                                    ' Re-add ',
                                    style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w300),
                                  ),
                                  onPressed: () {
                                    submit(i);
                                  },
                                ),
                                FlatButton(
                                  color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                                  child: Text('    Delete    ',
                                      style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w300)),
                                  onPressed: () {
                                    //Navigator.of(context).pop();

                                    crudobj.deleteallride(
                                        ride.documents[i].documentID);
                                    Navigator.pop(context, true);
                                    Navigator.pop(context, true);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              allride(email: widget.email)));
                                  },
                                ),
                                FlatButton(
                                  color: Colors.lightBlue[50],
                                 shape: RoundedRectangleBorder(
                                     borderRadius:
                                    new BorderRadius.circular(20.0)),
                                  child: Text('Ok',
                                      style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w300)),
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                ),
                            ],
                          );
                        },
                      );
                    },
                  )),
            )));
      } else
        return Container();
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
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
              "Histroy Ride",
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
      body: ListView(
        children: <Widget>[
          if (ride != null)
            for (int i = 0; i < ride.documents.length; i++)
              Column(
                children: <Widget>[
                  returnride(i),
                ],
              ),
          Padding(padding: EdgeInsets.only(top: 250.0)),
          if (ride == null)
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
