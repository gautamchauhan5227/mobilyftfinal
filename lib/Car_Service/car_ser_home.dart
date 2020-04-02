import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Car_Service/get_service/service_home.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:nice_button/NiceButton.dart';
class car_ser_selection extends StatefulWidget {
   car_ser_selection({Key key, this.email}) : super(key: key);
  final String email;
  @override
  _car_ser_selectionState createState() => _car_ser_selectionState();
}

class _car_ser_selectionState extends State<car_ser_selection> {
  final formKey = GlobalKey<FormState>();
  CRUD1 crudobj = new CRUD1();
  List _gday;
  String _gdayResult ;
  String _gname,_gadd,_gid,_gopen,_gclose,email;

  @override
  void initState() {
    email = widget.email;
    print(email);
   crudobj.getData('garage detail').then((result) {
      setState(() {
        garage = result;
      });
    });
  
  }
   

  void insert(BuildContext context) {
    print(_gname);
    print(_gadd);
    print(_gid);
    print(_gdayResult);
    
    Map<String, dynamic> data = {
      'email': widget.email,
      'Garage Name': _gname,
      'Garage Address': _gadd,
      'Garage ID': _gid,
      'Open Time': _gopen,
      'Close time':_gclose,
      'Open Days':_gdayResult
    };

    crudobj.garage(data, context).then((result) {}).catchError((e) {
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
                  car_ser_selection(email: widget.email)));
    }
  }
int flag=0;
 QuerySnapshot garage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40, left: 15, right: 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
  new GestureDetector(
        onTap: (){  


          Navigator.push(
                       context,
                      MaterialPageRoute(
                         builder: (BuildContext context) =>
                             get_services(email: widget.email)
                             )
                             );
               

            // if (garage != null)
            // for (int i = 0; i < garage.documents.length; i++)
            // { if (email == garage.documents[i].data["email"])
            //      {   
            //       //  print(car.documents[i].data["car"]);
            //             Navigator.push(
            //            context,
            //           MaterialPageRoute(
            //               builder: (BuildContext context) =>
            //                   give_home(email: widget.email)));
            //                   flag = 1;
            //     }
            //  }
            //      if(flag == 0 )
            //      {
            //        return showDialog<Void>(
            //         context: context,
            //          barrierDismissible: false, // user must tap button!
            //           builder: (BuildContext context) {
            //             AlertDialog(
            //               title: Text("Add Garage Details"),
            //               content: Container(
            //                 // height: 300.0,
            //                 // width: 280.0,
            //                 child: ListView(
            //                   children: <Widget>[
            //                     TextFormField(
            //                       decoration: InputDecoration(
            //                         labelText: "Garage Name",
            //                         hintText: "Sai Garage",
            //                         prefixIcon: const Icon(
            //                             Icons.home,
            //                             size: 40.0,
            //                             color: Colors.blue,
            //                         ),
            //                       ),
            //                       validator: (value) =>
            //                         value.isEmpty ? "Garage Name can't be empty" : null,
            //                         onChanged: (value) => _gname = value,
            //                     ),
            //                     TextFormField(
            //                       decoration: InputDecoration(
            //                         labelText: "Garage Address",
            //                         hintText: "Adajan ,Surat",
            //                         prefixIcon: const Icon(
            //                             Icons.location_city,
            //                             size: 40.0,
            //                             color: Colors.blue,
            //                         ),
            //                       ),
            //                       validator: (value) =>
            //                         value.isEmpty ? "Garage Address can't be empty" : null,
            //                         onChanged: (value) => _gadd = value,
            //                     ),
            //                     TextFormField(
            //                       decoration: InputDecoration(
            //                         labelText: "Garage ID",
            //                         hintText: "Gar8348743847",
            //                         prefixIcon: const Icon(
            //                             Icons.verified_user,
            //                             size: 40.0,
            //                             color: Colors.blue,
            //                         ),
            //                       ),
            //                       validator: (value) =>
            //                         value.isEmpty ? "Garage ID can't be empty" : null,
            //                         onChanged: (value) => _gid = value,
            //                     ),
            //                     TextFormField(
            //                       decoration: InputDecoration(
            //                         labelText: "Open Time",
            //                         hintText: "9:00AM",
            //                         prefixIcon: const Icon(
            //                             Icons.timer,
            //                             size: 40.0,
            //                             color: Colors.blue,
            //                         ),
            //                       ),
            //                       validator: (value) =>
            //                         value.isEmpty ? "Open Garage Time can't be empty" : null,
            //                         onChanged: (value) => _gopen = value,
            //                     ),
            //                     TextFormField(
            //                       decoration: InputDecoration(
            //                         labelText: "Close Time",
            //                         hintText: "9:00AM",
            //                         prefixIcon: const Icon(
            //                             Icons.access_time,
            //                             size: 40.0,
            //                             color: Colors.blue,
            //                         ),
            //                       ),
            //                       validator: (value) =>
            //                         value.isEmpty ? "Close Garage Time can't be empty" : null,
            //                         onChanged: (value) => _gclose = value,
            //                     ),

            //                      MultiSelectFormField(
            //                        autovalidate: false,
            //                        titleText: 'Working Days',
            //                        validator: (value) {
            //                           if (value == null || value.length == 0) {
            //                             return 'Please select one or more options';
            //                           }
            //                         },
            //                         dataSource: [
            //                         {
            //                           "display": "Monday",
            //                           "value": "Monday",
            //                         },
            //                         {
            //                           "display": "Tuesday",
            //                           "value": "Tuesday",
            //                         },
            //                         {
            //                           "display": "Wednesday",
            //                           "value": "Wednesday",
            //                         },
            //                         {
            //                           "display": "Thursday",
            //                           "value": "Thursday",
            //                         },
            //                         {
            //                           "display": "Friday",
            //                           "value": "Friday",
            //                         },
            //                         {
            //                           "display": "Saturday",
            //                           "value": "Saturday",
            //                         },
            //                         {
            //                           "display": "Sunday",
            //                           "value": "Sunday",
            //                         },
            //                         ],
            //                         textField: 'display',
            //                         valueField: 'value',
            //                         okButtonLabel: 'OK',
            //                         cancelButtonLabel: 'CANCEL',
            //                         hintText: 'Please choose one or more',
                                   
            //                         value: _gday,
            //                         onSaved: (value) {
            //                           if (value == null) return;
            //                           setState(() {
            //                             _gday = value;
            //                           });
            //                         }, 
            //                      ),
            //                     NiceButton(
            //                       onPressed: (){
            //                         submit();
            //                       },
            //                       text: "Add",
            //                       background: null)
            //                   ],
            //                 )
            //               ),
            //             );
            //           }
            //         );
            //      }
                  
                // });
                  // if(email != garage.documents[i].data[email])
                 

                  
                
                
                // else {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (BuildContext context) =>
                //               give_home(email: widget.email)));
                // }
                   
                
                  
                
                
               
        
        },
        child: new Container(
          width: 310.0,
          height: 200.0, 
          child: Image.asset("asets/searchrent.jpg",height: 200.0,width: 310.0,fit: BoxFit.fill,),
        )
    ),

     SizedBox(
          height: 10.0,
              ),
                  Text("Get Service",style: TextStyle(
                              fontSize: 50.0, 
                              fontWeight: FontWeight.w300
                          ),),

Padding(padding: EdgeInsets.only(top:30.0)),
  
new GestureDetector(
        onTap: (){ 
          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              get_services(email: widget.email)));   
        },
        child: new Container(
          width: 310.0,
          height: 200.0, 
          child: Image.asset("asets/searchrent.jpg",height: 200.0,width: 310.0,fit: BoxFit.fill,),
        )
    ),

     SizedBox(
          height: 10.0,
              ),
                  Text("Recent Service",style: TextStyle(
                              fontSize: 50.0, 
                              fontWeight: FontWeight.w300
                          ),),
                ],
              ),
            ),
          ],
        )
    );
  }
}