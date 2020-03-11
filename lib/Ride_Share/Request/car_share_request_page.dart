import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Crud_File/crud1.dart';



class request_page extends StatefulWidget {
  final String email;
  request_page({Key key, this.email}) : super(key: key);

  @override
  _request_pageState createState() => _request_pageState();
}

class _request_pageState extends State<request_page> {
  CRUD1 crudobj = new CRUD1();
  QuerySnapshot req, user;
  String requester,namereq,phonereq;

  @override
  void initState() {
    crudobj.getData('ride request').then((result) {
      setState(() {
        req = result;
      });
    });
   // print(req.documents[0].data["Emailcr"]);
    crudobj.getData('user').then((result) {
      setState(() {
        user = result;
      });
    });
  }

  int l = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          if (req != null)
            for (int i = 0; i < req.documents.length; i++)
             
              Column(
                children: <Widget>[
                  returnride(i),
                ],
              ),
          Padding(padding: EdgeInsets.only(top: 250.0)),
          if (req == null)
            Column(
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
              ],
            )
        ],
      ),
    );
  }

  Widget returnride(int i) {
    if (req != null) {
      if (widget.email == req.documents[i].data["Emailcr"]) {
        requester = req.documents[i].data["Emailreq"];
        if(user != null){
          for(int i=0;i < user.documents.length; i++)
            if(requester == user.documents[i].data["email"])
              namereq=user.documents[i].data["name"];
              phonereq = user.documents[i].data["phone"];
        }
        return Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Card(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 60.0,
                  ),
                  title: Text(
                      namereq
                      ,style: TextStyle(fontSize: 28.0 ,),),
                  subtitle: Text(
                      "${req.documents[i].data["PickUp"]}\tto\t${req.documents[i].data["Destination"]}\nSeat : ${req.documents[i].data["Seat"]}",
                      style: TextStyle(fontSize: 17.0),),
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              'Requester Details',
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
                                            Icons.person,
                                            // location_on
                                            size: 40.0,
                                          ),
                                          
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              namereq,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 18.0),
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
                                            Icons.email,
                                            size: 40.0,
                                          ),
                                         
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              "${req.documents[i].data["Emailreq"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 18.0),
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
                                            Icons.call,
                                            size: 40.0,
                                          ),
                                          
                                          Icon(Icons.chevron_right),
                                          Expanded(
                                            child: Text(
                                              phonereq,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 18.0),
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
                              child: Text(
                                "Cancel      ",
                                style: TextStyle(fontSize: 25.0),
                              ),
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                )));
      } else
        return Container();
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
