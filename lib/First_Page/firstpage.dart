import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Login_Page/loginpage.dart';
class FirstPagee extends StatefulWidget {
  
  @override
  _FirstPageeState createState() => _FirstPageeState();
}

class _FirstPageeState extends State<FirstPagee> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 4),
        () =>
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    SizedBox(width: 20.0, height: 100.0),
    
    
    ScaleAnimatedTextKit(
      text: ["MobiLyft"],
      textStyle: TextStyle(fontSize: 40.0,fontFamily: 'Nosifer',color:Colors.blue,
      
        ),
      textAlign: TextAlign.center,
      alignment: AlignmentDirectional.topStart // or Alignment.topLeft
    ),
  ],
),
      )
    );
  }
}