import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:mobilyft/crud1.dart';
import 'ride_page.dart';

enum FormType { login, register }

class Create extends StatefulWidget {
  final String e;
  Create({Key key, this.e}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final formKey = GlobalKey<FormState>();

  DateTime _time;
  DateTime _date = DateTime.now();
  String _src, _dest;
  CRUD1 crudobj = new CRUD1();

  void insert(BuildContext context) {
    Map<String, dynamic> data = {
      'source': _src,
      'destination': _dest,
      // 'time': "",
      // 'date': " _date.toString()",
      'email': widget.e
    };

    crudobj.addDetail(data, context).then((result) {}).catchError((e) {
      print(e);
    });
  }

  void submit() async {
    print(_src);
    print(_dest);
    insert(context);
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => Ride_Page()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        SizedBox(
          height: 80.0,
        ),
        Center(
            child: Column(
          children: <Widget>[
            Icon(Icons.transfer_within_a_station,
                size: 80.0, color: Colors.green),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Add Ride ",
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  "Detail ",
                  style: TextStyle(fontSize: 30.0, color: Colors.teal),
                ),
              ],
            )
          ],
        )),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: ' Car Number',
            focusColor: Color.fromRGBO(100, 50, 100, 0.8),
            labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
            prefixIcon: const Icon(
              Icons.motorcycle,
              size: 40.0,
              color: Colors.orange,
            ),
            border: UnderlineInputBorder(
              borderSide: new BorderSide(
                color: Colors.teal,
              ),
            ),
          ),
          validator: (value) =>
              value.isEmpty ? "Car Number can't be empty" : null,
          onChanged: (value) => _dest = value,
        ),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: ' PickUp',
            focusColor: Color.fromRGBO(100, 50, 100, 0.8),
            labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
            prefixIcon: const Icon(
              Icons.location_searching,
              size: 40.0,
              color: Colors.orange,
            ),
            border: UnderlineInputBorder(
              borderSide: new BorderSide(
                color: Colors.teal,
              ),
            ),
          ),
          validator: (value) => value.isEmpty ? "PickUp can't be empty" : null,
          onChanged: (value) => _src = value,
        ),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: ' Destination',
            focusColor: Color.fromRGBO(100, 50, 100, 0.8),
            labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
            prefixIcon: const Icon(
              Icons.location_on,
              size: 40.0,
              color: Colors.orange,
            ),
            border: UnderlineInputBorder(
              borderSide: new BorderSide(
                color: Colors.teal,
              ),
            ),
          ),
          validator: (value) =>
              value.isEmpty ? "Destination can't be empty" : null,
          onChanged: (value) => _dest = value,
        ),
        SizedBox(
          height: 10.0,
        ),
        // DateTimePickerFormField(
        //   inputType: InputType.time,
        //   format: DateFormat("HH:mm"),
        //   initialTime: TimeOfDay(hour: 10, minute: 10),
        //   editable: false,
        //   keyboardType: null,
        //   decoration: InputDecoration(
        //       icon: Icon(
        //         Icons.timer,
        //         size: 40.0,
        //         color: Colors.orange,
        //       ),
        //       hasFloatingPlaceholder: false),
        //   onChanged: (dt) {
        //     setState(() => _time = dt);
        //     print('Selected date: $_time');
        //     print('Hour: $_time.hour');
        //     print('Minute: $_time.minute');
        //   },
        // ),
        SizedBox(
          height: 45.0,
        ),
        Container(
          height: 50.0,
          width: 250.0,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.teal[300],
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () {
                submit();
              },
              child: Center(
                child: Text('Add',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat')),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
