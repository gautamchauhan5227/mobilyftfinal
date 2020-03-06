import 'package:flutter/material.dart';
import 'package:mobilyft/First_Page/firstpage.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Moilyft",
        // theme: ThemeData(

        //),
        home: Scaffold(
          body: FirstPagee(),
        ));
  }
}
