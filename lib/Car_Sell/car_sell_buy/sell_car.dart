import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:mobilyft/Car_Sell/car_sell_home.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:nice_button/NiceButton.dart';
class car_sell extends StatefulWidget {
  car_sell({Key key, this.email}) : super(key: key);
  final String email;
  @override
  _car_sellState createState() => _car_sellState();
}

class _car_sellState extends State<car_sell> {
  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  final formKey = GlobalKey<FormState>();
  String _carreg,_carcmp,_cmodel,_cartype,_cnumber,_ckm,_ccolor,_cargear,_cprice,_padd,_pnumer ,_cseat;
  CRUD1 crudobj = new CRUD1();
  void insert(BuildContext context) {
    print(_carreg);
    print(_carcmp);
    print(_cmodel);
    print(_cnumber);
    print(_cartype);
    print(_ckm);
;
    Map<String, dynamic> data = {
      'email': widget.email,
      'car Registration Year': _carreg,
      'car Manufacturer Company': _carcmp,
      'car Model': _cmodel,
      'car fuel type':_cartype,
      'car number':_cnumber,
      'km of use':_ckm,
      'car color':_ccolor,
      'car gear type':_cargear ,
      'car price':_cprice,
      'Address person':_padd,
      'Contact number':_pnumer,
      'car seat':_cseat
    };

    crudobj.selldetail(data, context).then((result) {}).catchError((e) {
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
                  sell_home(email: widget.email)));
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
        )
    );
  }
  List<Widget> detail() {
    return [
      Padding(padding: EdgeInsets.only(top: 15.0)),
      Center(
          child: Column(
        children: <Widget>[
          Icon(Icons.directions_car,
              size: 80.0, color: Colors.blue[700]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Add Car ",
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
          child: DropDownFormField(
                
                  titleText: 'Select Registration Year',
                  
                  value: _carreg,
                  onSaved: (value) {
                    setState(() {
                      _carreg = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _carreg = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "2000",
                      "value": "2000",
                    },
                    {
                      "display": "2001",
                      "value": "2001",
                    },
                    {
                      "display": "2002",
                      "value": "2002",
                    },
                    {
                      "display": "2003",
                      "value": "2003",
                    },
                    {
                      "display": "2004",
                      "value": "2004",
                    },
                    {
                      "display": "2005",
                      "value": "2005",
                    },
                    {
                      "display": "2006",
                      "value": "2006",
                    },
                    {
                      "display": "2007",
                      "value": "2007",
                    },
                    {
                      "display": "2008",
                      "value": "2008",
                    },
                    {
                      "display": "2009",
                      "value": "2009",
                    },
                    {
                      "display": "2010",
                      "value": "2010",
                    },
                    {
                      "display": "2011",
                      "value": "2011",
                    },
                    {
                      "display": "2012",
                      "value": "2012",
                    },
                    {
                      "display": "2013",
                      "value": "2013",
                    },
                    {
                      "display": "2014",
                      "value": "2014",
                    },
                    {
                      "display": "2015",
                      "value": "2015",
                    },
                    {
                      "display": "2016",
                      "value": "2016",
                    },
                    {
                      "display": "2017",
                      "value": "2017",
                    },
                     {
                      "display": "2018",
                      "value": "2018",
                    },
                     {
                      "display": "2019",
                      "value": "2019",
                    },
                     {
                      "display": "2020",
                      "value": "2020",
                    },


                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
        ),


       Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: DropDownFormField(
                
                  titleText: 'Car Manufacturer Comapany',
                  
                  value: _carcmp,
                  onSaved: (value) {
                    setState(() {
                      _carcmp = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _carcmp = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Maruti",
                      "value": "Maruti",
                    },
                    {
                      "display": "Hyundai",
                      "value": "Hyundai",
                    },
                    {
                      "display": "Honda",
                      "value": "Honda",
                    },
                    {
                      "display": "Tata",
                      "value": "Tata",
                    },
                    {
                      "display": "Mahindra",
                      "value": "Mahindra",
                    },
                    {
                      "display": "Toyota",
                      "value": "Toyota",
                    },
                    {
                      "display": "Ford",
                      "value": "Ford",
                    },
                    {
                      "display": "Audi",
                      "value": "Audi",
                    },
                    {
                      "display": "BMW",
                      "value": "BMW",
                    },
                    {
                      "display": "Jeep",
                      "value": "Jeep",
                    },
                    
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
        ),

       
      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: DropDownFormField(
                
                  titleText: 'Car Model',
                  
                  value: _cmodel,
                  onSaved: (value) {
                    setState(() {
                      _cmodel = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _cmodel = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Swift",
                      "value": "Swift",
                    },
                    {
                      "display": " Datsun",
                      "value": " Datsun",
                    },
                    {
                      "display": "SUV",
                      "value": "SUV",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
        ),


        Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: DropDownFormField(
                
                  titleText: 'Car Gear Type',
                  
                  value: _cargear,
                  onSaved: (value) {
                    setState(() {
                      _cargear = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _cargear = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Manual",
                      "value": "Manual",
                    },
                    {
                      "display": " Automatic",
                      "value": " Automatic",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
        ),
     

      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: DropDownFormField(
                
                  titleText: 'Car Fuel Type',
                  
                  value: _cartype,
                  onSaved: (value) {
                    setState(() {
                      _cartype = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _cartype = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Diesel",
                      "value": "Diesel",
                    },
                    {
                      "display": "Petrol",
                      "value": "Petrol",
                    },
                    {
                      "display": "CNG",
                      "value": "CNG",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
        ),


         Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: DropDownFormField(
                
                  titleText: 'Car Color',
                  
                  value: _ccolor,
                  onSaved: (value) {
                    setState(() {
                      _ccolor = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _ccolor = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "White",
                      "value": "White",
                    },
                    {
                      "display": "Black",
                      "value": "Black",
                    },
                    {
                      "display": "Grey",
                      "value": "Grey",
                    },
                    {
                      "display": "Red",
                      "value": "Red",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
        ),

        Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: DropDownFormField(
                
                  titleText: 'Car Color',
                  
                  value: _cseat,
                  onSaved: (value) {
                    setState(() {
                      _cseat = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _cseat = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "4",
                      "value": "4",
                    },
                    {
                      "display": "5",
                      "value": "5",
                    },
                    {
                      "display": "6",
                      "value": "6",
                    },
                    {
                      "display": "7",
                      "value": "7",
                    },
                    {
                      "display": "8",
                      "value": "8",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
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
              labelText: 'Car Number',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
              // prefixIcon: const Icon(
              //   Icons.location_on,
              //   size: 40.0,
              //   color: Colors.blue,
              // ),
            ),
            validator: (value) =>
                value.isEmpty ? "Car Number can't be empty" : null,
            onChanged: (value) => _cnumber = value,
          ),
        ),
      ),
      
       Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Use of KM',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
              // prefixIcon: const Icon(
              //   Icons.airline_seat_recline_normal,
              //   size: 40.0,
              //   color: Colors.blue,
              // ),
            ),
            validator: (value) => value.isEmpty ? "km can't be empty" : null,
            onChanged: (value) => _ckm = value,
          ),
        ),
      ),
 Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Car Price',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
              // prefixIcon: const Icon(
              //   Icons.airline_seat_recline_normal,
              //   size: 40.0,
              //   color: Colors.blue,
              // ),
            ),
            validator: (value) => value.isEmpty ? "Price can't be empty" : null,
            onChanged: (value) => _cprice = value,
          ),
        ),
      ),



       Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Your Current Address',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
              // prefixIcon: const Icon(
              //   Icons.airline_seat_recline_normal,
              //   size: 40.0,
              //   color: Colors.blue,
              // ),
            ),
            validator: (value) => value.isEmpty ? "Address can't be empty" : null,
            onChanged: (value) => _padd = value,
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Your Contact Number',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
              // prefixIcon: const Icon(
              //   Icons.airline_seat_recline_normal,
              //   size: 40.0,
              //   color: Colors.blue,
              // ),
            ),
            validator: (value) => value.isEmpty ? "Contact Number can't be empty" : null,
            onChanged: (value) => _pnumer = value,
          ),
        ),
      ),
      

     
     
        
      // Padding(
      //   padding: EdgeInsets.only(top: 30.0, left: 100.0, right: 100.0),
      //   child: Card(
      //     color: Colors.lightGreen[50],
      //     shape: RoundedRectangleBorder(
      //         borderRadius: new BorderRadius.circular(150.0)),
      //     child: Container(
      //       height: 50.0,
      //       width: 250.0,
      //       color: Colors.transparent,
      //       child: Container(
      //         decoration: BoxDecoration(
      //             color: Colors.blue[400],
      //             borderRadius: BorderRadius.circular(50.0)),
      //         child: InkWell(
      //           onTap: () {
      //             submit();
      //           },
      //           child: Center(
      //             child: Text('Add',
      //                 style: TextStyle(
      //                     fontSize: 25.0,
      //                     color: Colors.white,
      //                     fontWeight: FontWeight.bold,
      //                     fontFamily: 'Montserrat')),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      Padding(padding: EdgeInsets.only(top:30.0)),
      Center(
        child: NiceButton(
          onPressed: (){
            submit();
          },
           text: 'Add',
           textColor: Colors.white,
           fontSize: 30.0, 
           gradientColors: [secondColor, firstColor],
           background: null
           ),
      ),
      Padding(padding: EdgeInsets.only(top:30.0)),
    ];
  }
}