import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:horizontal_time_picker/horizontal_time_picker.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:mobilyft/Ride_Share/HomePage/car_share_home_page.dart';



enum FormType { login, register }

class Create extends StatefulWidget {
  final String email;
  Create({Key key, this.email}) : super(key: key);
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final formKey = GlobalKey<FormState>();
  TimeOfDay _tod = TimeOfDay.now();
  TimeOfDay picked;
  DateTime ti;//=null;
  String _time = "Not set";
  String _src, _dest, _seat;
  CRUD1 crudobj = new CRUD1();
  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: _tod,
    );
    setState(() {
      print(picked);
    });
  }

  void insert(BuildContext context) {
    print(_src);
    print(_dest);
    print(_time);
    print(_seat);
    print(e);
    Map<String, dynamic> data = {
      'email': widget.email,
      'source': _src,
      'dest': _dest,
      'time': _time,
      'Seat': _seat,
    };

    crudobj.addDetail(data, context).then((result) {}).catchError((e) {
      print(e);
    });
    crudobj.notify(data, context).then((result) {}).catchError((e) {
      print(e);
    });

    // crudobj.history(data, context).then((result) {}).catchError((e) {
    //   print(e);
    // });
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
Future<bool> alert(BuildContext context) async {
  return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
 return AlertDialog(
            title: Center(
              
              child: Text(
                "Select Time First!!",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
 );
        });

}
  void submit() async {
    
    if (validateAndSave()) {
      if(ti == null){
        print("not complete!!");
        alert(context);
      }
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
      Padding(padding: EdgeInsets.only(top: 15.0)),
      Center(
          child: Column(
        children: <Widget>[
          Icon(Icons.transfer_within_a_station,
              size: 80.0, color: Colors.blue[700]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Add Ride ",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blue[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Detail ",
                style: TextStyle(fontSize: 30.0, color: Colors.black45),
              ),
            ],
          )
        ],
      )),
      SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: TextFormField(
            decoration: InputDecoration(
              labelText: ' PickUp',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
              prefixIcon: const Icon(
                Icons.location_searching,
                size: 40.0,
                color: Colors.blue,
              ),
              suffixIcon: IconButton(
                icon: null, 
                onPressed: null
              )
            ),
          
            validator: (value) =>
                value.isEmpty ? "PickUp can't be empty" : null,
            onChanged: (value) => _src = value,
          ),
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: TextFormField(
            decoration: InputDecoration(
              labelText: ' Destination',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
              prefixIcon: const Icon(
                Icons.location_on,
                size: 40.0,
                color: Colors.blue,
              ),
            ),
            validator: (value) =>
                value.isEmpty ? "Destination can't be empty" : null,
            onChanged: (value) => _dest = value,
          ),
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                                  Icons.av_timer,
                                  size: 40.0,
                                  color: Colors.blue,
                                ),
                                Text("  Time",style: TextStyle(fontSize:20.0),)
                        ],
                      ),
                      Container(
            child: HorizontalTimePicker(
                key: UniqueKey(),
                onTimeSelected: (time){
                  
                
                 print(_time);
                  setState(() {
                     _time = '${time.hour} : ${time.minute} ';
                       print(ti);
                  });
                  
                },
                startTimeInHour: 7,
                endTimeInHour: 24,
                dateForTime: DateTime.now(),
                selectedTimeTextStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: "Helvetica Neue",
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      height: 1.0,
                ),
                timeTextStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: "Helvetica Neue",
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      height: 1.0,
                ),
                defaultDecoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border.fromBorderSide(BorderSide(
                        color: Color.fromARGB(255, 151, 151, 151),
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                selectedDecoration: const BoxDecoration(
                      color: Colors.black,
                      border: Border.fromBorderSide(BorderSide(
                        color: Color.fromARGB(255, 151, 151, 151),
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                disabledDecoration: const BoxDecoration(
                      color: Colors.black26,
                      border: Border.fromBorderSide(BorderSide(
                        color: Color.fromARGB(255, 151, 151, 151),
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                showDisabled: true,
                
              ),
          ),
                    ],
                  ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: TextFormField(
            decoration: InputDecoration(
              labelText: ' Seat',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
              prefixIcon: const Icon(
                Icons.airline_seat_recline_normal,
                size: 40.0,
                color: Colors.blue,
              ),
            ),
            validator: (value) => value.isEmpty ? "Seat can't be empty" : null,
            onChanged: (value) => _seat = value,
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
