import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class CRUD1 {
  bool checksignin() {
    if (FirebaseAuth.instance.currentUser() != null)
      return true;
    else
      return false;
  }
  
  Future<void> addData(signupdata, BuildContext context) async {
    if (checksignin()) {
      Firestore.instance.collection('user').add(signupdata).catchError((e) {
        print(e);
      });
    } else {
      final snackBar = SnackBar(content: Text('Please Do Login'));
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> addDetail(data, BuildContext context) async {
    Firestore.instance.collection('current ride').add(data).catchError((e) {
      print(e);
    });
  }
  Future<void> addcar(data, BuildContext context) async {
    Firestore.instance.collection('car_detail').add(data).catchError((e) {
      print(e);
    });
  }

  Future<void> notify(data, BuildContext context) async {
    Firestore.instance.collection('notify').add(data).catchError((e) {
      print(e);
    });
  }

  Future<void> history(data, BuildContext context) async {
    Firestore.instance.collection('all ride').add(data).catchError((e) {
      print(e);
    });
  }

  Future<void> request(data, BuildContext context) async {
    Firestore.instance.collection('ride request').add(data).catchError((e) {
      print(e);
    });
  }

  Future<void> cardetail(data, BuildContext context) async {
    Firestore.instance.collection('car_detail').add(data).catchError((e) {
      print(e);
    });
  }

  Future<void> feedback(data, BuildContext context) async {
    Firestore.instance.collection('feedback').add(data).catchError((e) {
      print(e);
    });
  }

  Future<void> register(data, BuildContext context) async {
    Firestore.instance.collection('register').add(data).catchError((e) {
      print(e);
    });
  }

  Future<void> intrestrequest(data, BuildContext context) async {
    Firestore.instance.collection('intrest request').add(data).catchError((e) {
      print(e);
    });
  }

 

  Future<void> carfav(data, BuildContext context) async {
    Firestore.instance.collection('car fav').add(data).catchError((e) {
      print(e);
    });
  }

  Future<void> garage(data, BuildContext context) async {
    Firestore.instance.collection('garage detail').add(data).catchError((e) {
      print(e);
    });
  }

   Future<void> selldetail(data, BuildContext context) async {
    Firestore.instance.collection('sell car').add(data).catchError((e) {
      print(e);
    });
  }

  Future<void> riderequestresponse(data, BuildContext context) async {
    Firestore.instance.collection('ride request response').add(data).catchError((e) {
      print(e);
    });
  }

  Future<void> rideotp(data, BuildContext context) async {
    Firestore.instance.collection('ride otp').add(data).catchError((e) {
      print(e);
    });
  }

  getData(String table) async {
    return await Firestore.instance.collection(table).getDocuments();
  }

  updateData(selectedDoc, newValue,String coll) {
    Firestore.instance
        .collection(coll)
        .document(selectedDoc)
        .updateData(newValue)
        .catchError((e) {
      print(e);
    });
  
  }

  updateCurrentRideData(selectedDoc, newValue) {
    Firestore.instance
        .collection("current ride")
        .document(selectedDoc)
        .updateData(newValue)
        .catchError((e) {
      print(e);
    });
  }

  updateProfileData(selectedDoc, newValue) {
    Firestore.instance
        .collection("user")
        .document(selectedDoc)
        .updateData(newValue)
        .catchError((e) {
      print(e);
    });
  }

  updateVehicleData(selectedDoc, newValue) {
    Firestore.instance
        .collection("car_detail")
        .document(selectedDoc)
        .updateData(newValue)
        .catchError((e) {
      print(e);
    });
  }

  deleteData(docId,String coll) {
    Firestore.instance
        .collection(coll)
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  deleteallride(docId) {
    Firestore.instance
        .collection("all ride")
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  deletenoty(docId) {
    Firestore.instance
        .collection("notify")
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }


  deleteads(docId) {
    Firestore.instance
        .collection("sell car")
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  deleterequest(docId) {
    Firestore.instance
        .collection("ride request")
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  deletefavcar(docId) {
    Firestore.instance
        .collection("car fav")
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  deleteintrestcar(docId) {
    Firestore.instance
        .collection("intrest request")
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}
