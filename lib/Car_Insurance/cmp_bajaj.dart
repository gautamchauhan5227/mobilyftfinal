import 'package:flutter/material.dart';
class cmp_bajaj extends StatefulWidget {
  @override
  _cmp_bajajState createState() => _cmp_bajajState();
}

class _cmp_bajajState extends State<cmp_bajaj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Container(
            child:Center(
              child: Text("Bajaj Allianz General Insurance co. Ltd.",style: TextStyle(fontFamily:"Merriweather"),),
            ),
          ),
          Padding(padding: EdgeInsets.only(top:10.0)),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.arrow_right),
                  Text("")
                ],
              ),
            ],
          ),
        ],
      ),

    );
  }
}