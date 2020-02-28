import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mobilyft/crud1.dart';
import 'package:mobilyft/home_page.dart';

enum FormType { login, register }

class feedback extends StatefulWidget {
  final String email;
  feedback({Key key, this.email}) : super(key: key);
  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  final formKey = GlobalKey<FormState>();

  CRUD1 crudobj = new CRUD1();
  String _feed;

  void insert(BuildContext context) {
    Map<String, dynamic> data = {
      'email': widget.email,
      'feed': _feed,
    };

    crudobj.feedback(data, context).then((result) {}).catchError((e) {
      print(e);
    });
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }

  void submit() async {
    if (validateAndSave()) {
      insert(context);

      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Home_page(email: widget.email)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: detail()),
            ),
          ],
        ));
  }

  List<Widget> detail() {
    return [
      Padding(padding: EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0)),
      Container(
        height: 200.0,
        width: 280.0,
        child: Card(
          color: Colors.lightBlue[50],
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter Your Feedback here.....',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
            ),
            validator: (value) =>
                value.isEmpty ? "Please Enter Feedback" : null,
            onChanged: (value) => _feed = value,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 30.0, left: 100.0, right: 100.0),
        child: Card(
          color: Colors.lightGreen[50],
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(150.0)),
          child: Container(
            height: 50.0,
            width: 250.0,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(50.0)),
              child: InkWell(
                onTap: () {
                  submit();
                },
                child: Center(
                  child: Text('Add',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                ),
              ),
            ),
          ),
        ),
      )
    ];
  }
}
