import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mobilyft/crud1.dart';
import 'package:mobilyft/home_page.dart';
import 'package:mobilyft/services/create.dart';
import 'package:mobilyft/services/ride_details.dart';
import 'package:mobilyft/services/ride_page.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _phone;
  String _name;
  String _pin;

  FormType _formType = FormType.login;
  CRUD1 crudobj = new CRUD1();

  bool validateAndSave() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }

  void insert(BuildContext context) {
    print(_email);
    print(_password);
    print(_phone);
    Map<String, dynamic> signupdata = {
      'email': _email,
      'username': _password,
      'phone': _phone
    };

    crudobj.addData(signupdata, context).then((result) {}).catchError((e) {
      print(e);
    });
  }

  void insert1(BuildContext context) {
    print(_email);
    print(_password);
    print(_phone);
    print(_name);
    print(_pin);
    Map<String, dynamic> data = {
      'name': _name,
      'email': _email,
      'pass': _password,
      'phone': _phone,
      'pincode': _pin
    };

    crudobj.register(data, context).then((result) {}).catchError((e) {
      print(e);
    });
  }

  void submit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password)
              .then((user) {
            Navigator.pop(context);
            var route = new MaterialPageRoute(
              builder: (BuildContext context) => new Ride_Page(email: _email),
            );
            Navigator.of(context).push(route);
          });
        } else {
          FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _email, password: _password);
          insert1(context);

          showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: new Text("Thanks"),
                content: new Text(
                    "Registration successfully done \n please do login"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                    child: new Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()));
                    },
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        print("Error is: $e");
      }
    }
  }

  void signin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void login() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'asets/r2.jpeg',
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: buildInput() + buildSubmitButton()),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }

  List<Widget> buildInput() {
    return [
      Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          Icon(Icons.contact_mail, size: 80.0, color: Colors.green),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Mobi',
            style: TextStyle(fontSize: 40.0, color: Colors.white),
          ),
          Text(
            'Lyft',
            style: TextStyle(fontSize: 40.0, color: Colors.green[600]),
          )
        ],
      ),
      SizedBox(
        height: 20.0,
      ),
      TextFormField(
        // inputFormatters: [LengthLimitingTextInputFormatter(10)],
        style: TextStyle(color: Colors.white),

        inputFormatters: [LengthLimitingTextInputFormatter(20)],
        decoration: InputDecoration(
          hoverColor: Colors.white,
          labelText: ' Email',
          hintText: ' abc@gmail.com',
          hintStyle: TextStyle(color: Colors.white54),
          //focusColor: Colors.grey,
          labelStyle: TextStyle(color: Colors.white70, fontSize: 20.0),

          prefixIcon: const Icon(
            Icons.mail,
            size: 40.0,
            color: Colors.orange,
          ),
          border: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),

        validator: (value) => value.isEmpty ? " Email can't be empty" : null,
        onSaved: (value) => _email = value,
      ),
      TextFormField(
        style: TextStyle(color: Colors.white),
        maxLength: 8,
        maxLengthEnforced: true,
        decoration: InputDecoration(
          labelText: ' Password',
          hintText: ' *********',
          hintStyle: TextStyle(color: Colors.white54),
          focusColor: Color.fromRGBO(255, 0, 0, 0.8),
          labelStyle: TextStyle(color: Colors.white70, fontSize: 20.0),
          prefixIcon: const Icon(
            Icons.lock,
            size: 40.0,
            color: Colors.orange,
          ),
          border: UnderlineInputBorder(
            borderSide: new BorderSide(
              color: Colors.teal,
            ),
          ),
        ),
        obscureText: true,
        validator: (value) => value.isEmpty ? " Password can't be empty" : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButton() {
    if (_formType == FormType.login) {
      return [
        Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        Container(
          height: 50.0,
          width: 250.0,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () {
                submit();
              },
              child: Center(
                child: Text('Login',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat')),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'New to MobiLyft ?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: 'Montserrat'),
            ),
            SizedBox(width: 5.0),
            InkWell(
                onTap: () {
                  signin();
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
      ];
    } else {
      return [
        TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: ' Name',
            hintText: ' john',
            focusColor: Color.fromRGBO(100, 50, 100, 0.8),
            hintStyle: TextStyle(color: Colors.white54),
            labelStyle: TextStyle(color: Colors.white70, fontSize: 20.0),
            prefixIcon: const Icon(
              Icons.person,
              size: 40.0,
              color: Colors.orange,
            ),
            border: UnderlineInputBorder(
              borderSide: new BorderSide(
                color: Colors.teal,
              ),
            ),
          ),
          keyboardType: TextInputType.text,
          validator: (value) => value.isEmpty ? "Name can't be empty" : null,
          onChanged: (value) => _name = value,
        ),
        TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: ' Phone',
            hintText: ' 9845388..',
            focusColor: Color.fromRGBO(100, 50, 100, 0.8),
            hintStyle: TextStyle(color: Colors.white54),
            labelStyle: TextStyle(color: Colors.white70, fontSize: 20.0),
            prefixIcon: const Icon(
              Icons.phone_iphone,
              size: 40.0,
              color: Colors.orange,
            ),
            border: UnderlineInputBorder(
              borderSide: new BorderSide(
                color: Colors.teal,
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          validator: (value) => value.isEmpty ? "Phone can't be empty" : null,
          onChanged: (value) => _phone = value,
        ),
        //pincode
        TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: ' Pincode',
            hintText: ' 300396',
            focusColor: Color.fromRGBO(100, 50, 100, 0.8),
            hintStyle: TextStyle(color: Colors.white54),
            labelStyle: TextStyle(color: Colors.white70, fontSize: 20.0),
            prefixIcon: const Icon(
              Icons.person_pin_circle,
              size: 40.0,
              color: Colors.orange,
            ),
            border: UnderlineInputBorder(
              borderSide: new BorderSide(
                color: Colors.teal,
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          validator: (value) => value.isEmpty ? "Pincode can't be empty" : null,
          onChanged: (value) => _pin = value,
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.0),
        ),
        Container(
          height: 50.0,
          width: 250.0,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () {
                submit();
              },
              child: Center(
                child: Text('SignUp',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat')),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Have an Account?',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 15.0),
            ),
            SizedBox(width: 5.0),
            InkWell(
                onTap: () {
                  login();
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
      ];
    }
  }
}
