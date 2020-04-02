import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:mobilyft/Ride_Share/HomePage/car_share_home_page.dart';
import 'package:url_launcher/url_launcher.dart';
class request_page extends StatefulWidget {
  request_page({Key key, this.email}) : super(key: key);
  final String email;
  @override
  _request_pageState createState() => _request_pageState();
}
class _request_pageState extends State<request_page> {
  CRUD1 crudobj = new CRUD1();
  int l = 0;
  String requester,namereq,phonereq,namereqs,emailreq,emailcr,namecr,src,dest,time,seat;
  QuerySnapshot req, user;
  void insert(BuildContext context) {
    Map<String, dynamic> data = {
      'Emailcr': widget.email,
      'Emailreqs' : emailcr,
      'Namecr' : namereqs,
      'Source':src,
      'Destination':dest,
      'Time':time,
      'Seat':seat   
    };
    crudobj.riderequestresponse(data, context).then((result) {}).catchError((e) {
      print(e);
    });
  }
void submit(int i) async {   
//  namereqs=req.documents[i].data["name"];
 emailcr=req.documents[i].data["Emailreq"];
 namereqs=req.documents[i].data["Namecr"];
 src=req.documents[i].data["PickUp"]; 
 dest=req.documents[i].data["Destination"];
 time=req.documents[i].data["Time"];
 seat=req.documents[i].data["Sear"];
  insert(context);
  Navigator.pop(context, true);
  Navigator.pop(context, true);
  Navigator.pop(context, true);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Home_page(email: widget.email)));   
  }
  @override
  void initState() {
    crudobj.getData('ride request').then((result) {
      setState(() {
        req = result;
      });
    });
    crudobj.getData('user').then((result) {
      setState(() {
        user = result;
      });
    });
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
            padding: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0,),
            child: AnimatedCard(
              direction: AnimatedCardDirection.right, 
              initDelay: Duration(milliseconds: 0), 
              duration: Duration(seconds: 2), 
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0)),
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
                                              style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
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
                                              style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
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
                                             FlatButton(
                                        onPressed: () => launch("tel:$phonereq"),
                                  child: new Text(
                                    "$phonereq",
                                     textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize:25.0,
                                      fontWeight: FontWeight.w300
                                      ),
                                      )
                                    ),
                                            
                                          
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
                                "      Give Your Response      ",
                                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                      showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: Text(
                              "You Want To Share Ride With ""$namereq""\t""?""\t""Yes/No",
                              style: TextStyle(
                                fontSize:20.0,
                                fontWeight: FontWeight.w300
                                ),
                              ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                              child: Text(
                                "     Yes     ",
                                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                              ),
                              onPressed: (){
                                submit(i);
                              },
                            ),
                            Padding(padding: EdgeInsets.only(left:15.0)),
                             FlatButton(
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                              child: Text(
                                "     No     ",
                                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                              ),
                              onPressed: (){
                                crudobj.deleteData(
                                        req.documents[i].documentID,"ride request");
                                    Navigator.pop(context, true);
                                    Navigator.pop(context, true);
                                    Navigator.pop(context, true);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              request_page(email: widget.email)));
                                            },
                                          ),
                                        Padding(padding: EdgeInsets.only(left:10.0)),
                                      ]
                                    );
                                  }
                                );                                
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ))));
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
}
