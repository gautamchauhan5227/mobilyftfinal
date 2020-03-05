import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:mobilyft/Home_Page/home_page.dart';



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
  String _pin, lic, rc, model;
  bool _toggleVisibility = true;
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

  void insert1(BuildContext context) {
    print(_email);
    print(_password);
    print(_phone);
    print(_name);
    print(_pin);
    Map<String, dynamic> signupdata = {
      'name': _name,
      'email': _email,
      'pass': _password,
      'phone': _phone,
      'pincode': _pin
    };
    crudobj.addData(signupdata, context).then((result) {}).catchError((e) {
      print(e);
    });
    Map<String, dynamic> data = {
      'car': model,
      'email': _email,
      'RC book': rc,
      'Lic': lic,
    };
    crudobj.cardetail(data, context).then((result) {}).catchError((e) {
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
              builder: (BuildContext context) =>Home_page(
                email: _email,
              ),
            );
            Navigator.of(context).push(route);
          });
        } else {
          insert1(context);
          FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _email, password: _password);
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
        body: ListView(
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buildInput() + buildSubmitButton()),
            ),
          ],
        ));
  }

  List<Widget> buildInput() {
    String validateName(String value) {
      if (value.length == 0) {
        return 'Password can\'t be empty!';
      } else {
        if (value.length < 8)
          return 'Password must be more than 7 charater';
        else
          return null;
      }
    }

    String validateEmail(String value) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (value.length == 0) {
        return 'Email can\'t be empty!';
      } else {
        if (!regex.hasMatch(value))
          return 'Enter Valid Email';
        else
          return null;
      }
    }

    return [
      Padding(
        padding: EdgeInsets.only(top: 30.0, right: 100.0, left: 100.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Icon(Icons.contact_mail, size: 80.0, color: Colors.blueGrey[700]),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 100.0, left: 100.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Mobi',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              'Lyft',
              style: TextStyle(fontSize: 40.0, color: Colors.amberAccent[700]),
            )
          ],
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Padding(
        padding: EdgeInsets.only(right: 25.0, left: 15.0),
        child: Card(
          color: Colors.blue[50],
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(150.0)),
          child: TextFormField(
            // inputFormatters: [LengthLimitingTextInputFormatter(10)],
            style: TextStyle(color: Colors.black, fontSize: 20.0),

            inputFormatters: [LengthLimitingTextInputFormatter(20)],
            decoration: InputDecoration(
              hoverColor: Colors.black,
              focusColor: Colors.black12,
              labelText: ' Email',
              border: InputBorder.none,
              hintText: ' abc@gmail.com',
              hintStyle: TextStyle(color: Colors.black54),
              //focusColor: Colors.grey,
              labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
              prefixIcon: Padding(
                child: const Icon(
                  Icons.mail,
                  size: 40.0,
                  color: Colors.teal,
                ),
                padding: EdgeInsets.only(left: 30, right: 10),
              ),
            ),
            validator: (value) => validateEmail(value),
            onSaved: (value) => _email = value,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10.0, right: 25.0, left: 15.0),
        child: Card(
          color: Colors.blue[50],
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(150.0)),
          child: TextFormField(
            style: TextStyle(color: Colors.black, fontSize: 20.0),
            //maxLength: 15,
            maxLengthEnforced: true,
            decoration: InputDecoration(
              labelText: ' Password',
              hintText: ' *********',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.black54),
              focusColor: Color.fromRGBO(255, 0, 0, 0.8),
              labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 30, right: 10),
                child: const Icon(
                  Icons.vpn_key,
                  size: 40.0,
                  color: Colors.teal,
                ),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _toggleVisibility = !_toggleVisibility;
                    });
                  },
                  icon: _toggleVisibility
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
            ),
            obscureText: _toggleVisibility,
            validator: (value) => validateName(value),
            onSaved: (value) => _password = value,
          ),
        ),
      ),
    ];
  }

  List<Widget> buildSubmitButton() {
    String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
      if (value.length == 0) {
        return 'Mobile No. can\'t be empty!';
      } else {
        if (value.length != 10)
          return 'Mobile Number must be of 10 digit';
        else
          return null;
      }
    }

    if (_formType == FormType.login) {
      return [
        Padding(
          padding: EdgeInsets.only(top: 15.0, left: 100.0, right: 100.0),
          child: Container(
            height: 50.0,
            width: 250.0,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(50.0)),
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
                  color: Colors.blueGrey[700],
                  fontSize: 17.0,
                  fontFamily: 'Montserrat'),
            ),
            //SizedBox(width: 5.0),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
            ),
            InkWell(
                onTap: () {
                  signin();
                },
                child: Text(
                  '  Register',
                  style: TextStyle(
                    color: Colors.deepOrange[300],
                    fontSize: 18.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    //decoration: TextDecoration.underline
                  ),
                ))
          ],
        ),
      ];
    } else {
      return [
        // SizedBox(height: 0.0),
        Padding(
          padding: EdgeInsets.only(right: 25.0, left: 15.0, top: 10.0),
          child: Card(
            color: Colors.blue[50],
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(150.0)),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: ' Name',
                hintText: ' john',
                focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black54),
                labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 30, right: 10),
                  child: const Icon(
                    Icons.person,
                    size: 40.0,
                    color: Colors.teal,
                  ),
                ),
              ),
              keyboardType: TextInputType.text,
              validator: (value) =>
                  value.isEmpty ? "Name can't be empty" : null,
              onChanged: (value) => _name = value,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(right: 25.0, left: 15.0, top: 10.0),
          child: Card(
            color: Colors.blue[50],
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(150.0)),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              //maxLength: 10,
              decoration: InputDecoration(
                labelText: ' Phone',
                hintText: ' 9845388..',
                border: InputBorder.none,
                focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                hintStyle: TextStyle(color: Colors.black54),
                labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 30, right: 10),
                  child: const Icon(Icons.phone_iphone,
                      size: 40.0, color: Colors.teal),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) => validateMobile(value),
              onChanged: (value) => _phone = value,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 25),
          child: Card(
            color: Colors.blue[50],
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(150.0)),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: ' Pincode',
                hintText: ' 300396',
                focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 30, right: 10),
                  child: const Icon(
                    Icons.person_pin_circle,
                    size: 40.0,
                    color: Colors.teal,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value.isEmpty ? "Pincode can't be empty" : null,
              onChanged: (value) => _pin = value,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 25.0),
          child: Card(
            color: Colors.blue[50],
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(150.0)),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: ' Car Model',
                focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 30, right: 10),
                  child: const Icon(
                    Icons.directions_car,
                    size: 40.0,
                    color: Colors.teal,
                  ),
                ),
              ),
              validator: (value) =>
                  value.isEmpty ? "Model can't be empty" : null,
              onChanged: (value) => model = value,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 25.0),
          child: Card(
            color: Colors.blue[50],
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(150.0)),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: ' RC book number',
                focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 30, right: 10),
                  child: const Icon(
                    Icons.confirmation_number,
                    size: 40.0,
                    color: Colors.teal,
                  ),
                ),
              ),
              validator: (value) => value.isEmpty ? " Can't be empty" : null,
              onChanged: (value) => rc = value,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 25.0),
          child: Card(
            color: Colors.blue[50],
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(150.0)),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: ' License Number',
                focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 30, right: 10),
                  child: const Icon(
                    Icons.verified_user,
                    size: 40.0,
                    color: Colors.teal,
                  ),
                ),
              ),
              validator: (value) => value.isEmpty ? "Can't be empty" : null,
              onChanged: (value) => lic = value,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 20.0, left: 100.0, right: 100.0),
          child: Container(
            height: 50.0,
            width: 250.0,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.circular(50.0)),
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
                  color: Colors.blueGrey[700],
                  fontFamily: 'Montserrat',
                  fontSize: 20.0),
            ),
            SizedBox(width: 5.0),
            InkWell(
                onTap: () {
                  login();
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.red[400],
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    //decoration: TextDecoration.underline
                  ),
                )),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 100.0),
        ),
      ];
    }
  }
}
