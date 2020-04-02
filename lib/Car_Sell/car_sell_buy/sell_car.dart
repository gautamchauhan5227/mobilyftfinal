import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> keyReg = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> keyComp = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> keyModel = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> keyFuel = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> keyNumber = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> keyKM = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> keyColor = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> keyGear = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> keyPrice = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> keySeat = new GlobalKey();
  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  final formKey = GlobalKey<FormState>();
  String _carreg,_carcmp,_cmodel,_cartype,_cnumber,_ckm,_ccolor,_cargear,_cprice,_padd,_cnum,_pnumber;
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
      'car number':_cnum,
      'km of use':_ckm,
      'car color':_ccolor,
      'car gear type':_cargear ,
      'car price':_cprice,
      'Address person':_padd,
      'Contact number':_pnumber,
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
      
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  sell_home(email: widget.email)));
      Navigator.pop(context, true);
      Navigator.pop(context, true);
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
      
      
      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: SimpleAutoCompleteTextField(
            key: keyReg,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300
            ),
            decoration: InputDecoration(
              labelText: 'Registration Year',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 25.0,fontWeight: FontWeight.w400),            
            ),
            controller: TextEditingController(),
            suggestions: suggestionsRegYear,
            textChanged: (text) => currentText = text,
            textSubmitted:(value)=>_carreg=value,
            submitOnSuggestionTap: true,
            clearOnSubmit: false,
            suggestionsAmount: 10,
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: SimpleAutoCompleteTextField(
            key: keyComp,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300
            ),
            decoration: InputDecoration(
              labelText: 'Manufacture Comapany',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900],  fontSize: 25.0,fontWeight: FontWeight.w400),            
            ),
            controller: TextEditingController(),
            suggestions: suggestionsCompany,
            textChanged: (text) => currentText = text,
            textSubmitted:(value)=>_carcmp=value,
            submitOnSuggestionTap: true,
            clearOnSubmit: false,
            suggestionsAmount: 10,
            ),
          ),
        ),
     
      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: SimpleAutoCompleteTextField(
            key: keyModel,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300
            ),
            decoration: InputDecoration(
              labelText: 'Model',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900],  fontSize: 25.0,fontWeight: FontWeight.w400),            
            ),
            controller: TextEditingController(),
            suggestions: suggestionsModel,
            textChanged: (text) => currentText = text,
            textSubmitted:(value)=>_cmodel=value,
            submitOnSuggestionTap: true,
            clearOnSubmit: false,
            suggestionsAmount: 10,
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: SimpleAutoCompleteTextField(
            key: keyFuel,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300
            ),
            decoration: InputDecoration(
              labelText: 'Fuel Type',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900],  fontSize: 25.0,fontWeight: FontWeight.w400),            
            ),
            controller: TextEditingController(),
            suggestions: suggestionsFuel,
            textChanged: (text) => currentText = text,
            textSubmitted:(value)=>_cartype=value,
            submitOnSuggestionTap: true,
            clearOnSubmit: false,
            suggestionsAmount: 10,
          ),
        ),
      ),


      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: SimpleAutoCompleteTextField(
            key: keyGear,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300
            ),
            decoration: InputDecoration(
              labelText: 'Gear Type',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900],  fontSize: 25.0,fontWeight: FontWeight.w400),            
            ),
            controller: TextEditingController(),
            suggestions: suggestionsGear,
            textChanged: (text) => currentText = text,
            textSubmitted:(value)=>_cargear=value,
            submitOnSuggestionTap: true,
            clearOnSubmit: false,
            suggestionsAmount: 10,
          ),
        ),
      ),


      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: SimpleAutoCompleteTextField(
            key: keyColor,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300
            ),
            decoration: InputDecoration(
              labelText: 'Color',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900],  fontSize: 25.0,fontWeight: FontWeight.w400),            
            ),
            controller: TextEditingController(),
            suggestions: suggestionsColor,
            textChanged: (text) => currentText = text,
            textSubmitted:(value)=>_ccolor=value,
            submitOnSuggestionTap: true,
            clearOnSubmit: false,
            suggestionsAmount: 10,
          ),
        ),
      ),


      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: SimpleAutoCompleteTextField(
            key: keyKM,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300
            ),
            decoration: InputDecoration(
              labelText: 'Use',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900],  fontSize: 25.0,fontWeight: FontWeight.w400),            
            ),
            controller: TextEditingController(),
            suggestions: suggestionsKm,
            textChanged: (text) => currentText = text,
            textSubmitted:(value)=>_ckm=value,
            submitOnSuggestionTap: true,
            clearOnSubmit: false,
            suggestionsAmount: 10,
          ),
        ),
      ),


      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: SimpleAutoCompleteTextField(
            key: keyPrice,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300
            ),
            decoration: InputDecoration(
              labelText: 'Price',
              hintText: '1Lakh-2Lakh',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900],  fontSize: 25.0,fontWeight: FontWeight.w400),            
            ),
            controller: TextEditingController(),
            suggestions: suggestionsPrice,
            textChanged: (text) => currentText = text,
            textSubmitted:(value)=>_cprice=value,
            submitOnSuggestionTap: true,
            clearOnSubmit: false,
            suggestionsAmount: 10,
          ),
        ),
      ),


      Padding(padding: EdgeInsets.only(top:10.0,left:15.0,right:15.0),
      child: Card(
        color:Colors.lightBlue[50],
        child:TextFormField(
              style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300
            ),
              controller: TextEditingController(),
              textCapitalization: TextCapitalization.characters, 
              inputFormatters: [MaskTextInputFormatter(
                mask: "## ** ## ****", 
                filter: { "#": RegExp(r'[A-Z]') , "*":RegExp(r'[0-9]')})],
              decoration: InputDecoration(
                labelText: 'Car Number',
                labelStyle:
                  TextStyle(color: Colors.grey[900],  fontSize: 25.0,fontWeight: FontWeight.w400),
                  hintText: 'GJ 05 AA 1111'
                  ),
              validator: (value) =>
                value.isEmpty ? "Car Number can't be empty" : null,
              onChanged: (value) {
                this._cnum = value;
              },
            )
          )
        ),


      Padding(padding: EdgeInsets.only(top:10.0,left:15.0,right:15.0),
      child: Card(
        color:Colors.lightBlue[50],
        child:TextFormField(
              style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300
            ),
              controller: TextEditingController(),
              textCapitalization: TextCapitalization.characters, 
              inputFormatters: [MaskTextInputFormatter(
                mask: "**********", 
                filter: { "*":RegExp(r'[0-9]')})],
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle:
                  TextStyle(color: Colors.grey[900],  fontSize: 25.0,fontWeight: FontWeight.w400),
                  hintText: '8899900000'
                  ),
              validator: (value) =>
              value.isEmpty ? "Phone Number can't be empty" : null,
              onChanged: (value) {
                this._pnumber = value;
              },
            )
          )
        ),

        Padding(padding: EdgeInsets.only(top:10.0,left:15.0,right:15.0),
      child: Card(
        color:Colors.lightBlue[50],
        child:TextFormField(
              controller: TextEditingController(),
              style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300
            ),
              decoration: InputDecoration(
                labelText: 'Current Address',
                labelStyle:
                  TextStyle(color: Colors.grey[900],  fontSize: 25.0,fontWeight: FontWeight.w400),
                  hintText: '100,Adajan,Surat'
                  ),
              validator: (value) =>
              value.isEmpty ? "Address can't be empty" : null,
              onChanged: (value) {
                this._padd = value;
              },
            )
          )
        ),
      
     
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

  List<String> suggestionsRegYear = [
    "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010",
    "2011","2012","2013","2014","2015","2016","2017","2019","2020"
  ];

  List<String> suggestionsCompany=[
    "Audi","BMW","Datsun","Fiat","Ford","Honda","Hyundai","Jeep","Mahindra","Maruti-Suzuki",
    "Nissan","Renault","Skoda","Tata", "Toyota","Volvo","VolksWagen"  
  ];

  List<String> suggestionsModel=[
    "Audi A3","Audi A3 Cabriolet","Audi A4","Audi A5","Audi A5 Cabriolet","Audi A6","Audi A8L","Audi Q3",
    "Audi Q5","Audi Q7","Audi Q8","Audi RS5","Audi RS7 SportBack",
    "BMW 3 Series","BMW 3 Series GT","BMW 5 Series","BMW 6 Series GT","BMW 7 Series","BMW M2","BMW M5",
    "BMW X1","BMW X3","BMW X5","BMW X6","BMW Z4"
    "Datsun Go","Datsun Go Plus","Datsun Redi-Go X Facelift",
    "Fiat Abarth Punto","Fiat Avventara","Fiat Linea","Fiat Linea Classic","Fiat Panto Evo","Fiat Urban Cross",
    "Ford Aspire","Ford EcoSport","Ford Endeavour","Ford FreeStyle","Ford Figo","Ford Mustang",
    "Honda Accord","Honda Amaze","Honda City","Honda Civic","Honda CR-V","Honda Jazz",
    "Hyundai Auro","Hyundai Creta","Hyundai Elantra","Hyundai Elite i20","Hyundai Grand i10",
    "Hyundai Kona Electric","Hyundai Santro","Hyundai Venue","Hyundai Verna"
    "Jeep Compass","Jeep Grand Cherokee","Jeep Wrangler",
    "Mahindra Alturas G4","Mahindra Bolero","Mahindra E20 Plus","Mahindra Marazzo","Mahindra Kuv100 NXT",
    "Mahindra Thar","Mahindra Tuv300","Mahindra Tuv300 Plus","Mahindra Scorpio","Mahindra Verito",
    "Mahindra Verito Vibe CS","Mahindra XUV300","Mahindra XUV500",
    "Maruti-Suzuki Alto","Maruti-Suzuki Alto K10","Maruti-Suzuki Baleno","Maruti-Suzuki Ciaz",
    "Maruti-Suzuki Celerio X","Maruti-Suzuki Dzire","Maruti-Suzuki Eeco","Maruti-Suzuki Ertiga",
    "Maruti-Suzuki Lgnis","Maruti-Suzuki S-Cross","Maruti-Suzuki Swift","Maruti-Suzuki S-Presso",
    "Maruti-Suzuki Wagon R","Maruti-Suzuki XL6"
    "Nissan GT-R","Nissan Kick","Nissan Micra","Nissan Micra Active","Nissan Sunny","Nissan Terrano",
    "Renault Captur","Renault Duster","Renault Kwid","Renault Lodgy","Renault Triber",
    "Skoda Kodiaq","Skoda Octavia","Skoda Superb","Skoda Rapid",
    "Tata Altroz","Tata Bolt","Tata Harrier","Tata Nano","Tata Nano Genx","Tata Nexon","Tata Safari Storme"
    "Tata Tiago","Tata Tirgo","Tata Tirgo JTP",
    "Toyota Camry","Toyota Corolla Altis","Toyota Etios Liva","Toyota Etios Cross","Toyota Fortuner",
    "Toyota Lnnova Crysta","Toyota Vellfire","Toyota Yaris"
    "Volvo S90","Volvo V90 Cross Country","Volvo XC40","Volvo XC60","Volvo XC90",
    "VolksWagen Ameo","VolksWagen Tiguan","VolksWagen T-Roc","VolksWagen Polo","VolksWagen Vento"
  ];

  List<String> suggestionsFuel=[
    "CNG","Diesel","Petrol"
  ];

  List<String> suggestionsGear=[
    "Auto","Manual"
  ];
  
  List<String> suggestionsColor=[
    "White","Black","Grey","Red","Blue","Yellow","Brown"
  ];

  List<String> suggestionsKm=[
    "0-5,000 kM","5,000-10,000 KM","10,000-50,000 KM","50,000-1Lakh Km","1Lakh-1.5Lakh","1.5Lakh-2Lakh","Above 2Lakh"
  ];

  List<String> suggestionsPrice=[
    "50,000-1Lakh","1Lakh-2Lakh","2Lakh-3Lakh","3Lakh-4Lakh","4Lakh-6Lakh","6Lakh-8Lakh",
    "8Lakh-10Lakh","10Lakh-12Lakh","12Lakh-15Lakh","Above 15Lakh"
  ];  
}