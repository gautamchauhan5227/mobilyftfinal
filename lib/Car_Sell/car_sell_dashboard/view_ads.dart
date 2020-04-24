import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobilyft/Car_Sell/car_sell_buy/sell_car.dart';
import 'package:mobilyft/Car_Sell/car_sell_dashboard/current_ads.dart';
import 'package:mobilyft/Crud_File/crud1.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
class view_ads extends StatefulWidget {
  view_ads({
    Key key, this.email,this.company,this.model,this.year,this.fuel,this.gear,
    this.color,this.carnum,this.km,this.price,this.number,this.address
    }) : super(key: key);

  final String email,company,model,year,fuel,gear,color,carnum,km,price,number,address;

  @override
  _view_adsState createState() => _view_adsState();
}

class _view_adsState extends State<view_ads> {
  CRUD1 crudobj = new CRUD1();
  final formKey = GlobalKey<FormState>();
  int l = 0;
  QuerySnapshot pro;
  Company selectedcompany;
  Model selectedmodel;
  Years selectedyear;
  Fuel selectedfuel;
  Gear selectedgear;
  Col selectedcolor;
  String _model;

  @override
  void initState() {
    crudobj.getData('sell car').then((result) {
      setState(() {
        pro = result;
      });
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

   Widget cardetails(int i){
    if(pro!=null){
      if (widget.email == pro.documents[i].data["email"]) 
      if (widget.company == pro.documents[i].data["car Manufacturer Company"]) 
      if (widget.model == pro.documents[i].data["car Model"]) 
      if (widget.year == pro.documents[i].data["car Registration Year"]) 
      if (widget.fuel == pro.documents[i].data["car fuel type"]) 
      if (widget.gear == pro.documents[i].data["car gear type"]) 
      if (widget.color == pro.documents[i].data["car color"]) 
      if (widget.carnum == pro.documents[i].data["car number"])
      if (widget.km == pro.documents[i].data["km of use"])
      if (widget.price == pro.documents[i].data["car price"])
      if (widget.address == pro.documents[i].data["Address person"]) 
      if (widget.number == pro.documents[i].data["Contact number"]) 
      {
        return Padding(padding: EdgeInsets.only(top:10.0,left:10.0,right: 10.0,),
          child: AnimatedCard(
              direction: AnimatedCardDirection.top, 
              initDelay: Duration(milliseconds: 5), 
              duration: Duration(seconds: 3),
              child: Column(
                children: <Widget>[
                  Padding(
                  padding: EdgeInsets.only(top:10.0),
                  child:SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.11,
                    child: Icon(Icons.directions_car,
                      size: 80.0,
                      color: Colors.blue[700],
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top:5.0),
                  child:SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,             
                    child:Center(
                      child: RichText(
                        text:TextSpan(
                          text:'Car',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: Colors.black
                          ),
                          children: <TextSpan>[
                            TextSpan(text: ' Detail', 
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.blue,
                                fontSize: 40
                              )
                            )
                          ]
                        ),
                      ),
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),


                Divider(),
                Padding(padding: EdgeInsets.only(),
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(right:15.0)),
                      Column(
                        children: <Widget>[
                          Text("Company",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                         IconButton(
                           icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                           onPressed: (){
                             updatecompany(context, pro.documents[i].documentID);
                                                          } 
                                                       ),
                                                     ],
                                                   ),
                                                 ], 
                                               ),
                                             ),
                                             Padding(padding: EdgeInsets.only(left: 15.0),
                                               child: Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     child: Text("${pro.documents[i].data["car Manufacturer Company"]}",
                                                       style: TextStyle(
                                                         fontSize: 20.0,
                                                         fontWeight: FontWeight.w300
                                                       ),
                                                     ),
                                                     flex: 3,
                                                   ),                 
                                                 ],
                                               ),
                                             ),
                                             Divider(),
                             
                                             Divider(),
                                             Padding(padding: EdgeInsets.only(),
                                               child: Row(
                                                 children: <Widget>[
                                                   Padding(padding: EdgeInsets.only(right:15.0)),
                                                   Column(
                                                     children: <Widget>[
                                                       Text("Model",
                                                         style: TextStyle(
                                                           fontSize: 25.0,
                                                           fontWeight: FontWeight.w700
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                      onPressed: (){
                                                        updatemodel(context, pro.documents[i].documentID);
                                                          } 
                                                       ),
                                                     ],
                                                   ),
                                                 ], 
                                               ),
                                             ),
                                             Padding(padding: EdgeInsets.only(left: 15.0),
                                               child: Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     child: Text("${pro.documents[i].data["car Model"]}",
                                                       style: TextStyle(
                                                         fontSize: 20.0,
                                                         fontWeight: FontWeight.w300
                                                       ),
                                                     ),
                                                     flex: 3,
                                                   ),                 
                                                 ],
                                               ),
                                             ),
                                             Divider(),
                             
                                             Divider(),
                                             Padding(padding: EdgeInsets.only(),
                                               child: Row(
                                                 children: <Widget>[
                                                   Padding(padding: EdgeInsets.only(right:15.0)),
                                                   Column(
                                                     children: <Widget>[
                                                       Text("Buy Year",
                                                         style: TextStyle(
                                                           fontSize: 25.0,
                                                           fontWeight: FontWeight.w700
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                   Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                      onPressed: (){
                                                        updateyear(context, pro.documents[i].documentID);
                                                          } 
                                                       ),
                                                     ],
                                                   ),
                                                 ], 
                                               ),
                                             ),
                                             Padding(padding: EdgeInsets.only(left: 15.0),
                                               child: Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     child: Text("${pro.documents[i].data["car Registration Year"]}",
                                                       style: TextStyle(
                                                         fontSize: 20.0,
                                                         fontWeight: FontWeight.w300
                                                       ),
                                                     ),
                                                     flex: 3,
                                                   ),                 
                                                 ],
                                               ),
                                             ),
                                             Divider(),
                             
                                             Divider(),
                                             Padding(padding: EdgeInsets.only(),
                                               child: Row(
                                                 children: <Widget>[
                                                   Padding(padding: EdgeInsets.only(right:15.0)),
                                                   Column(
                                                     children: <Widget>[
                                                       Text("Fuel Type",
                                                         style: TextStyle(
                                                           fontSize: 25.0,
                                                           fontWeight: FontWeight.w700
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                   Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                      onPressed: (){
                                                        updatefuel(context, pro.documents[i].documentID);
                                                          } 
                                                       ),
                                                     ],
                                                   ),
                                                 ], 
                                               ),
                                             ),
                                             Padding(padding: EdgeInsets.only(left: 15.0),
                                               child: Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     child: Text("${pro.documents[i].data["car fuel type"]}",
                                                       style: TextStyle(
                                                         fontSize: 20.0,
                                                         fontWeight: FontWeight.w300
                                                       ),
                                                     ),
                                                     flex: 3,
                                                   ),                 
                                                 ],
                                               ),
                                             ),
                                             Divider(),
                             
                                             Divider(),
                                             Padding(padding: EdgeInsets.only(),
                                               child: Row(
                                                 children: <Widget>[
                                                   Padding(padding: EdgeInsets.only(right:15.0)),
                                                   Column(
                                                     children: <Widget>[
                                                       Text("Gear Type",
                                                         style: TextStyle(
                                                           fontSize: 25.0,
                                                           fontWeight: FontWeight.w700
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                   Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                      onPressed: (){
                                                        updategear(context, pro.documents[i].documentID);
                                                          } 
                                                       ),
                                                     ],
                                                   ),
                                                 ], 
                                               ),
                                             ),
                                             Padding(padding: EdgeInsets.only(left: 15.0),
                                               child: Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     child: Text("${pro.documents[i].data["car gear type"]}",
                                                       style: TextStyle(
                                                         fontSize: 20.0,
                                                         fontWeight: FontWeight.w300
                                                       ),
                                                     ),
                                                     flex: 3,
                                                   ),                 
                                                 ],
                                               ),
                                             ),
                                             Divider(),
                             
                                             Divider(),
                                             Padding(padding: EdgeInsets.only(),
                                               child: Row(
                                                 children: <Widget>[
                                                   Padding(padding: EdgeInsets.only(right:15.0)),
                                                   Column(
                                                     children: <Widget>[
                                                       Text("Color",
                                                         style: TextStyle(
                                                           fontSize: 25.0,
                                                           fontWeight: FontWeight.w700
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                   Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                      onPressed: (){
                                                        updatecolor(context, pro.documents[i].documentID);
                                                          } 
                                                       ),
                                                     ],
                                                   ),
                                                 ], 
                                               ),
                                             ),
                                             Padding(padding: EdgeInsets.only(left: 15.0),
                                               child: Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     child: Text("${pro.documents[i].data["car color"]}",
                                                       style: TextStyle(
                                                         fontSize: 20.0,
                                                         fontWeight: FontWeight.w300
                                                       ),
                                                     ),
                                                     flex: 3,
                                                   ),                 
                                                 ],
                                               ),
                                             ),
                                             Divider(),
                             
                                             Divider(),
                                             Padding(padding: EdgeInsets.only(),
                                               child: Row(
                                                 children: <Widget>[
                                                   Padding(padding: EdgeInsets.only(right:15.0)),
                                                   Column(
                                                     children: <Widget>[
                                                       Text("Car Number",
                                                         style: TextStyle(
                                                           fontSize: 25.0,
                                                           fontWeight: FontWeight.w700
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                   Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                      onPressed: (){
                                                        updateCarNo(context, pro.documents[i].documentID);
                                                          } 
                                                       ),
                                                     ],
                                                   ),
                                                 ], 
                                               ),
                                             ),
                                             Padding(padding: EdgeInsets.only(left: 15.0),
                                               child: Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     child: Text("${pro.documents[i].data["car number"]}",
                                                       style: TextStyle(
                                                         fontSize: 20.0,
                                                         fontWeight: FontWeight.w300
                                                       ),
                                                     ),
                                                     flex: 3,
                                                   ),                 
                                                 ],
                                               ),
                                             ),
                                             Divider(),
                             
                                             Divider(),
                                             Padding(padding: EdgeInsets.only(),
                                               child: Row(
                                                 children: <Widget>[
                                                   Padding(padding: EdgeInsets.only(right:15.0)),
                                                   Column(
                                                     children: <Widget>[
                                                       Text("Use",
                                                         style: TextStyle(
                                                           fontSize: 25.0,
                                                           fontWeight: FontWeight.w700
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                   Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                      onPressed: (){
                                                        updateuse(context, pro.documents[i].documentID);
                                                          } 
                                                       ),
                                                     ],
                                                   ),
                                                 ], 
                                               ),
                                             ),
                                             Padding(padding: EdgeInsets.only(left: 15.0),
                                               child: Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     child: Text("${pro.documents[i].data["km of use"]}",
                                                       style: TextStyle(
                                                         fontSize: 20.0,
                                                         fontWeight: FontWeight.w300
                                                       ),
                                                     ),
                                                     flex: 3,
                                                   ),                 
                                                 ],
                                               ),
                                             ),
                                             Divider(),
                             
                                             Divider(),
                                             Padding(padding: EdgeInsets.only(),
                                               child: Row(
                                                 children: <Widget>[
                                                   Padding(padding: EdgeInsets.only(right:15.0)),
                                                   Column(
                                                     children: <Widget>[
                                                       Text("Price",
                                                         style: TextStyle(
                                                           fontSize: 25.0,
                                                           fontWeight: FontWeight.w700
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                   Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                      onPressed: (){
                                                        updateprice(context, pro.documents[i].documentID);
                                                          } 
                                                       ),
                                                     ],
                                                   ),
                                                 ], 
                                               ),
                                             ),
                                             Padding(padding: EdgeInsets.only(left: 15.0),
                                               child: Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     child: Text("${pro.documents[i].data["car price"]}",
                                                       style: TextStyle(
                                                         fontSize: 20.0,
                                                         fontWeight: FontWeight.w300
                                                       ),
                                                     ),
                                                     flex: 3,
                                                   ),                 
                                                 ],
                                               ),
                                             ),
                                             Divider(),
                             
                                             Divider(),
                                             Padding(padding: EdgeInsets.only(),
                                               child: Row(
                                                 children: <Widget>[
                                                   Padding(padding: EdgeInsets.only(right:15.0)),
                                                   Column(
                                                     children: <Widget>[
                                                       Text("Address",
                                                         style: TextStyle(
                                                           fontSize: 25.0,
                                                           fontWeight: FontWeight.w700
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                   Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                      onPressed: (){
                                                        updateaddress(context, pro.documents[i].documentID);
                                                          } 
                                                       ),
                                                     ],
                                                   ),
                                                 ], 
                                               ),
                                             ),
                                             Padding(padding: EdgeInsets.only(left: 15.0),
                                               child: Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     child: Text("${pro.documents[i].data["Address person"]}",
                                                       style: TextStyle(
                                                         fontSize: 20.0,
                                                         fontWeight: FontWeight.w300
                                                       ),
                                                     ),
                                                     flex: 3,
                                                   ),                 
                                                 ],
                                               ),
                                             ),
                                             Divider(),  
                             
                                             Divider(),
                                             Padding(padding: EdgeInsets.only(),
                                               child: Row(
                                                 children: <Widget>[
                                                   Padding(padding: EdgeInsets.only(right:15.0)),
                                                   Column(
                                                     children: <Widget>[
                                                       Text("Number",
                                                         style: TextStyle(
                                                           fontSize: 25.0,
                                                           fontWeight: FontWeight.w700
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                   Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(Icons.edit,size: 20.0,color: Colors.black54,), 
                                                      onPressed: (){
                                                        updatepnum(context, pro.documents[i].documentID);
                                                          } 
                                                       ),
                                                     ],
                                                   ),
                                                 ], 
                                               ),
                                             ),
                                             Padding(padding: EdgeInsets.only(left: 15.0),
                                               child: Row(
                                                 children: <Widget>[
                                                   Expanded(
                                                     child: Text("${pro.documents[i].data["Contact number"]}",
                                                       style: TextStyle(
                                                         fontSize: 20.0,
                                                         fontWeight: FontWeight.w300
                                                       ),
                                                     ),
                                                     flex: 3,
                                                   ),                 
                                                 ],
                                               ),
                                             ),
                                             Divider(), 
                                           ],
                                         )
                                       ),
                                     );
                                   } 
                                 }
                               }

  Future<bool> updatecompany(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Company",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*4,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color(0xFFFFFF),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(32.0)), 
                  ),
                  child: ListView(children: <Widget>[
                    SimpleAutocompleteFormField<Company>(
                      suggestionsHeight: 80.0,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300
                      ),
                      decoration: InputDecoration(             
                        labelText: 'Car Company',
                        focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Colors.grey[900], 
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400
                        ),            
                      ),
                      controller: TextEditingController(),
                      itemBuilder: (context, company) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(company.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ]
                        ),
                      ),
                      onSearch: (search) async => company
                      .where((company) =>company.name.toLowerCase().contains(search.toLowerCase())).toList(),                      
                      itemFromString: (string) => company.singleWhere(
                        (company) => company.name.toLowerCase() == string.toLowerCase(),
                        orElse: () => null),
                      onChanged: (value) => setState(() => selectedcompany = value),
                      // onSaved: (value) => setState(() => selectedseat = value),
                      validator: (company) => company == null ? 'Invalid Company!' : null,           
                    ),
                  ]),
                ),
              ),
            actions: <Widget>[
              FlatButton(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                borderRadius:new BorderRadius.circular(20.0))                                    ,
                child: Text(
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  if (validateAndSave()) {
                    crudobj.updateData(selectedDoc, {
                                'car Manufacturer Company': this.selectedcompany.toString(),
                            },"sell car");
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));                   
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {                
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        }
      );
  }

    Future<bool> updatemodel(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Car Model",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*4,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color(0xFFFFFF),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(32.0)), 
                  ),
                  child: ListView(children: <Widget>[
                    SimpleAutocompleteFormField<Model>(
                      suggestionsHeight: 80.0,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300
                      ),
                      decoration: InputDecoration(              
                        labelText: 'Car Model',
                        focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Colors.grey[900], 
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400
                        ),            
                      ),
                      controller: TextEditingController(),
                      itemBuilder: (context, model) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(model.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ]
                        ),
                      ),
                      onSearch: (search) async => model
                      .where((model) =>model.name.toLowerCase().contains(search.toLowerCase())).toList(),                      
                      itemFromString: (string) => model.singleWhere(
                        (model) => model.name.toLowerCase() == string.toLowerCase(),
                        orElse: () => null),
                      onChanged: (value) => setState(() => selectedmodel = value),
                      // onSaved: (value) => setState(() => selectedseat = value),
                      validator: (model) => model == null ? 'Invalid Pick-Up Point!' : null,           
                    ),
                  ]),
                ),
              ),
            actions: <Widget>[
              FlatButton(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                borderRadius:new BorderRadius.circular(20.0))                                    ,
                child: Text(
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  if (validateAndSave()) {
                    crudobj.updateData(selectedDoc, {
                                'car Model': this.selectedmodel.toString(),
                            },"sell car");
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));                   
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {                
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        }
      );
  }

   Future<bool> updateyear(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Buy Year",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*4,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color(0xFFFFFF),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(32.0)), 
                  ),
                  child: ListView(children: <Widget>[
                    SimpleAutocompleteFormField<Years>(
                      suggestionsHeight: 80.0,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300
                      ),
                      decoration: InputDecoration(               
                        labelText: 'Buy Year',
                        focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Colors.grey[900], 
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400
                        ),            
                      ),
                      controller: TextEditingController(),
                      itemBuilder: (context, years) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(years.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ]
                        ),
                      ),
                      onSearch: (search) async => years
                      .where((years) =>years.name.toLowerCase().contains(search.toLowerCase())).toList(),                      
                      itemFromString: (string) => years.singleWhere(
                        (years) => years.name.toLowerCase() == string.toLowerCase(),
                        orElse: () => null),
                      onChanged: (value) => setState(() => selectedyear = value),
                      // onSaved: (value) => setState(() => selectedseat = value),
                      validator: (years) => years == null ? 'Invalid Year!' : null,           
                    ),
                  ]),
                ),
              ),
            actions: <Widget>[
              FlatButton(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                borderRadius:new BorderRadius.circular(20.0))                                    ,
                child: Text(
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  if (validateAndSave()) {
                    crudobj.updateData(selectedDoc, {
                                'car Registration Year': this.selectedyear.toString(),
                            },"sell car");
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));                   
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {                
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        }
      );
  }

  Future<bool> updatefuel(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Fuel Type",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*4,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color(0xFFFFFF),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(32.0)), 
                  ),
                  child: ListView(children: <Widget>[
                    SimpleAutocompleteFormField<Fuel>(
                      suggestionsHeight: 80.0,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300
                      ),
                      decoration: InputDecoration(               
                        labelText: 'Fuel Type',
                        focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Colors.grey[900], 
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400
                        ),            
                      ),
                      controller: TextEditingController(),
                      itemBuilder: (context, fuel) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(fuel.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ]
                        ),
                      ),
                      onSearch: (search) async => fuel
                      .where((fuel) =>fuel.name.toLowerCase().contains(search.toLowerCase())).toList(),                      
                      itemFromString: (string) => fuel.singleWhere(
                        (fuel) => fuel.name.toLowerCase() == string.toLowerCase(),
                        orElse: () => null),
                      onChanged: (value) => setState(() => selectedfuel = value),
                      // onSaved: (value) => setState(() => selectedseat = value),
                      validator: (fuel) => fuel == null ? 'Invalid Fuel Type!' : null,           
                    ),
                  ]),
                ),
              ),
            actions: <Widget>[
              FlatButton(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                borderRadius:new BorderRadius.circular(20.0))                                    ,
                child: Text(
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  if (validateAndSave()) {
                    crudobj.updateData(selectedDoc, {
                                'car fuel type': this.selectedfuel.toString(),
                            },"sell car");
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));                   
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {                
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        }
      );
  }

  Future<bool> updategear(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Gear Type",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*4,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color(0xFFFFFF),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(32.0)), 
                  ),
                  child: ListView(children: <Widget>[
                    SimpleAutocompleteFormField<Gear>(
                      suggestionsHeight: 80.0,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300
                      ),
                      decoration: InputDecoration(               
                        labelText: 'Car Gear Type',
                        focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Colors.grey[900], 
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400
                        ),            
                      ),
                      controller: TextEditingController(),
                      itemBuilder: (context, gear) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(gear.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ]
                        ),
                      ),
                      onSearch: (search) async => gear
                      .where((gear) =>gear.name.toLowerCase().contains(search.toLowerCase())).toList(),                      
                      itemFromString: (string) => gear.singleWhere(
                        (gear) => gear.name.toLowerCase() == string.toLowerCase(),
                        orElse: () => null),
                      onChanged: (value) => setState(() => selectedgear= value),
                      // onSaved: (value) => setState(() => selectedseat = value),
                      validator: (gear) => gear == null ? 'Invalid Gear Type!' : null,           
                    ),
                  ]),
                ),
              ),
            actions: <Widget>[
              FlatButton(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                borderRadius:new BorderRadius.circular(20.0))                                    ,
                child: Text(
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  if (validateAndSave()) {
                    crudobj.updateData(selectedDoc, {
                                'car gear type': this.selectedgear.toString(),
                            },"sell car");
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));                   
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {                
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        }
      );
  }

  Future<bool> updatecolor(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Car Color",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*4,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color(0xFFFFFF),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(32.0)), 
                  ),
                  child: ListView(children: <Widget>[
                    SimpleAutocompleteFormField<Col>(
                      suggestionsHeight: 80.0,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300
                      ),
                      decoration: InputDecoration(             
                        labelText: 'Car Color',
                        focusColor: Color.fromRGBO(100, 50, 100, 0.8),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Colors.grey[900], 
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400
                        ),            
                      ),
                      controller: TextEditingController(),
                      itemBuilder: (context, col) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(col.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ]
                        ),
                      ),
                      onSearch: (search) async => col
                      .where((col) =>col.name.toLowerCase().contains(search.toLowerCase())).toList(),                      
                      itemFromString: (string) => col.singleWhere(
                        (col) => col.name.toLowerCase() == string.toLowerCase(),
                        orElse: () => null),
                      onChanged: (value) => setState(() => selectedcolor = value),
                      // onSaved: (value) => setState(() => selectedseat = value),
                      validator: (col) => col == null ? 'Invalid Car Color!' : null,           
                    ),
                  ]),
                ),
              ),
            actions: <Widget>[
              FlatButton(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                borderRadius:new BorderRadius.circular(20.0))                                    ,
                child: Text(
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  if (validateAndSave()) {
                    crudobj.updateData(selectedDoc, {
                                'car color': this.selectedcolor.toString(),
                            },"sell car");
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));                   
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {                
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        }
      );
  }

  Future<bool> updateCarNo(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Car Number",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*4,
                  child: ListView(children: <Widget>[
                    TextFormField(
                    
                    textCapitalization: TextCapitalization.characters, 
                    inputFormatters: [MaskTextInputFormatter(mask: "## ** ## ****", filter: { "#": RegExp(r'[A-Z]') , "*":RegExp(r'[0-9]')})],
                      decoration: InputDecoration(
                        labelText: 'Car Number',
                        labelStyle:
                          TextStyle(
                            color: Colors.grey[900], 
                            fontSize: 20.0
                          ),
                          hintText: 'GJ 05 AA 0220',
                     ),
                      validator: (value) =>
                       value.isEmpty ? "Car Number can't be empty" : null,
                      onChanged: (value) {
                        this._model = value;
                      },
                    ),
                  ]),
                ),
              ),
            actions: <Widget>[
              FlatButton(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                borderRadius:new BorderRadius.circular(20.0))                                    ,
                child: Text(
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  if (validateAndSave()) {
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));
                              crudobj.updateData(selectedDoc, {
                                      'car number': this._model,
                                  },
                                  "sell car"
                                );
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  Future<bool> updateuse(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Car Use",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*4,
                  child: ListView(children: <Widget>[
                    TextFormField(
                       controller: TextEditingController(),
                    textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        labelText: 'Car Use',
                        labelStyle:
                          TextStyle(
                            color: Colors.grey[900], 
                            fontSize: 20.0
                          ),
                          hintText: '1000KM',
                     ),
                      validator: (value) =>
                       value.isEmpty ? "Car Use can't be empty" : null,
                      onChanged: (value) {
                        this._model = value;
                      },
                    ),
                  ]),
                ),
              ),
            actions: <Widget>[
              FlatButton(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                borderRadius:new BorderRadius.circular(20.0))                                    ,
                child: Text(
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  if (validateAndSave()) {
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));
                              crudobj.updateData(selectedDoc, {
                                      'km of use': this._model,
                                  },
                                  "sell car"
                                );
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

   Future<bool> updateprice(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Car Price",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*4,
                  child: ListView(children: <Widget>[
                    TextFormField(
                       controller: TextEditingController(),
                    textCapitalization: TextCapitalization.characters, 
                      decoration: InputDecoration(
                        labelText: 'Car Price',
                        labelStyle:
                          TextStyle(
                            color: Colors.grey[900], 
                            fontSize: 20.0
                          ),
                     ),
                      validator: (value) =>
                       value.isEmpty ? "Car Price can't be empty" : null,
                      onChanged: (value) {
                        this._model = value;
                      },
                    ),
                  ]),
                ),
              ),
            actions: <Widget>[
              FlatButton(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                borderRadius:new BorderRadius.circular(20.0))                                    ,
                child: Text(
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  if (validateAndSave()) {
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));
                              crudobj.updateData(selectedDoc, {
                                      'car price': this._model,
                                  },
                                  "sell car"
                                );
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  Future<bool> updatepnum(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Phone Number",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*4,
                  child: ListView(children: <Widget>[
                    TextFormField(                     
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number, 
                    inputFormatters: [MaskTextInputFormatter(mask: "**********", filter: { "*":RegExp(r'[0-9]')})],
                      decoration: InputDecoration(
                        labelText: 'Number',
                        labelStyle:
                          TextStyle(
                            color: Colors.grey[900], 
                            fontSize: 20.0
                          ),
                     ),
                      validator: (value) =>
                       value.isEmpty ? "Number can't be empty" : null,
                      onChanged: (value) {
                        this._model = value;
                      },
                    ),
                  ]),
                ),
              ),
            actions: <Widget>[
              FlatButton(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                borderRadius:new BorderRadius.circular(20.0))                                    ,
                child: Text(
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  if (validateAndSave()) {
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));
                              crudobj.updateData(selectedDoc, {
                                      'Contact number': this._model,
                                  },
                                  "sell car"
                                );
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  Future<bool> updateaddress(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Update Address",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Form(
                key: formKey,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*4,
                  child: ListView(children: <Widget>[
                    TextFormField(
                       controller: TextEditingController(),
                       maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle:
                          TextStyle(
                            color: Colors.grey[900], 
                            fontSize: 20.0
                          ),
                     ),
                      validator: (value) =>
                       value.isEmpty ? "Address can't be empty" : null,
                      onChanged: (value) {
                        this._model = value;
                      },
                    ),
                  ]),
                ),
              ),
            actions: <Widget>[
              FlatButton(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                borderRadius:new BorderRadius.circular(20.0))                                    ,
                child: Text(
                  "   Update   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  if (validateAndSave()) {
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              car_ads(email: widget.email)));
                              crudobj.updateData(selectedDoc, {
                                      'Address person': this._model,
                                  },
                                  "sell car"
                                );
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(left:15.0)),
              FlatButton(
                color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                child: Text(
                  "   Cancel   ",
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
           if (pro != null)
              for (int i = 0; i < pro.documents.length; i++)
              
                Container(
                  child: cardetails(i),
                ),
            Padding(padding: EdgeInsets.only(top: 250.0)),
            if (pro == null)
              Column(
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                ],
              )
          ],
        ),
      )
    );
  }
}
final company=<Company>[Company('Audi'),Company('BMW'),Company('Datsun'),Company('Fiat'),Company('Ford'),Company('Honda'),Company('Hyundai'),
  Company('Jeep'),Company('Mahindra'),Company('Maruti-Suzuki'),Company('Nissan'),Company('Renault'),Company('Skoda'),Company('Tata'),
  Company('Toyota'),Company('Volvo'),Company('VolksWagen')];
  
final model=<Model>[Model('Audi A3'),Model('Audi A3 Cabriolet'),Model('Audi A4'),Model('Audi A5'),Model('Audi A5 Cabriolet'),Model('Audi A6'),
  Model('Audi A8L'),Model('Audi Q3'),Model('Audi Q5'),Model('Audi Q7'),Model('Audi Q8'),Model('Audi RS5'),Model('Audi RS7 SportBack'), 
  Model('BMW 3 Series'),Model('BMW 3 Series GT'),Model('BMW 5 Series'),Model('BMW 6 Series GT'),Model('BMW 7 Series'),
  Model('BMW M2'),Model('BMW M5'),Model('BMW X1'),Model('BMW X3'),Model('BMW X5'),Model('BMW X6'),Model('BMW Z4'),Model('Datsun Go'),
  Model('Datsun Go Plus'),Model('Datsun Redi-Go X Facelift'),Model('Fiat Abarth Punto'),Model('Fiat Avventara'),Model('Fiat Linea'),
  Model('Fiat Linea Classic'),Model('Fiat Panto Evo'),Model('Fiat Urban Cross'),Model('Ford Aspire'),Model('Ford EcoSport'),
  Model('Ford Endeavour'),Model('Ford FreeStyle'),Model('Ford Figo'),Model('Ford Mustang'),Model('Honda Accord'),Model('Honda Amaze'),
  Model('Honda City'),Model('Honda Civic'),Model('Honda CR-V'),Model('Honda Jazz'),Model('Hyundai Auro'),Model('Hyundai Creta'),
  Model('Hyundai Elantra'),Model('Hyundai Elite i20'),Model('Hyundai Grand i10'),Model('Hyundai Kona Electric'),Model('Hyundai Santro'),
  Model('Hyundai Venue'),Model('Hyundai Verna'),Model('Jeep Compass'),Model('Jeep Grand Cherokee'),Model('Jeep Wrangler'),
  Model('Mahindra Alturas G4'),Model('Mahindra Bolero'),Model('Mahindra E20 Plus'),Model('Mahindra Marazzo'),Model('Mahindra Kuv100 NXT'),
  Model('Mahindra Thar'),Model('Mahindra Tuv300'),Model('Mahindra Tuv300 Plus'),Model('Mahindra Scorpio'),Model('Mahindra Verito'),
  Model('Mahindra Verito Vibe CS'),Model('Mahindra XUV300'),Model('Mahindra XUV500'), Model('Maruti-Suzuki Alto'),Model('Maruti-Suzuki Alto K10'),
  Model('Maruti-Suzuki Baleno'),Model('Maruti-Suzuki Ciaz'),Model('Maruti-Suzuki Celerio X'),Model('Maruti-Suzuki Dzire'),
  Model('Maruti-Suzuki Eeco'),Model('Maruti-Suzuki Ertiga'),Model('Maruti-Suzuki Lgnis'),Model('Maruti-Suzuki S-Cross'),
  Model('Maruti-Suzuki Swift'),Model('Maruti-Suzuki S-Presso'),Model('Maruti-Suzuki Wagon R'),Model('Maruti-Suzuki XL6'),Model('Nissan GT-R'),
  Model('Nissan Kick'),Model('Nissan Micra'),Model('Nissan Micra Active'),Model('Nissan Sunny'),Model('Nissan Terrano'),Model('Renault Captur'),
  Model('Renault Duster'),Model('Renault Kwid'),Model('Renault Lodgy'),Model('Renault Triber'),Model('Skoda Kodiaq'),Model('Skoda Octavia'),
  Model('Skoda Superb'),Model('Skoda Rapid'),Model('Tata Altroz'),Model('Tata Bolt'),Model('Tata Harrier'),Model('Tata Nano'),
  Model('Tata Nano Genx'),Model('Tata Nexon'),Model('Tata Safari Storme'),Model('Tata Tiago'),Model('Tata Tirgo'),Model('Tata Tirgo JTP'),
  Model('Toyota Camry'),Model('Toyota Corolla Altis'),Model('Toyota Etios Liva'),Model('Toyota Etios Cross'),Model('Toyota Fortuner'),
  Model('Toyota Lnnova Crysta'),Model('Toyota Vellfire'),Model('Toyota Yaris'),Model('Volvo S90'),Model('Volvo V90 Cross Country'),
  Model('Volvo XC40'),Model('Volvo XC60'),Model('Volvo XC90'),Model('VolksWagen Ameo'),Model('VolksWagen Tiguan'),Model('VolksWagen T-Roc'),
  Model('VolksWagen Polo'),Model('VolksWagen Vento'), ];

  final years = <Years>[
    Years('2000'),Years('2001'),Years('2002'),Years('2003'),Years('2004'),Years('2005'),Years('2006'),Years('2007'),Years('2008'),
    Years('2009'),Years('2010'),Years('2011'),Years('2012'),Years('2013'),Years('2014'),Years('2015'),Years('2016'),Years('2017'),
    Years('2019'),Years('2020'), 
  ];

  final fuel=<Fuel>[Fuel("CNG"),Fuel("Diesel"),Fuel("Petrol")];

  final gear=<Gear>[Gear("Auto"),Gear("Manual")];

  final col=<Col>[Col('Black'),Col('Blue'),Col('Brown'),Col('Grey'),Col('Red'),Col('Yellow'),Col('White'), ];

class Company {
  Company(this.name);

  final String name;

  @override
  String toString() => name;
}


class Model {
  Model(this.name);
  final String name;
  @override
  String toString() => name;
}

class Years {
  Years(this.name);
  final String name;
  @override
  String toString() => name;
}

class Fuel {
  Fuel(this.name);
  final String name;
  @override
  String toString() => name;
}

class Gear {
  Gear(this.name);
  final String name;
  @override
  String toString() => name;
}

class Col {
  Col(this.name);
  final String name;
  @override
  String toString() => name;
}