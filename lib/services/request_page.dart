import 'package:flutter/material.dart';
import 'package:mobilyft/services/ride_request.dart';

class request_page extends StatefulWidget {
  request_page({Key key}) : super(key: key);

  @override
  _request_pageState createState() => _request_pageState();
}

class _request_pageState extends State<request_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
              width: 100.0,
            ),
            Center(
              child: Icon(
                Icons.account_circle,
                size: 130.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Raj",
              style: TextStyle(color: Colors.black54, fontSize: 30.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Surat",
              style: TextStyle(color: Colors.black54, fontSize: 30.0),
            ),
            SizedBox(
              height: 80.0,
              width: 80.0,
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.only(left: 140.0, right: 100.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.green[200],
                        child: Text('Accept'),
                        onPressed: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ride_request()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(80.0)),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.green[200],
                        child: Text('Delete'),
                        onPressed: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ride_request()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(80.0)),
                      ),
                    ],
                  )
                ],
              ),
            ))
          ]),
    );
  }
}
