import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convox/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  //--------Sign-Up------------//

  Future<void> register(
      BuildContext context, String name, String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      addUser(email, name);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  //---------ADD USER--------------//

  Future<void> addUser(String email, String name) async {
    await users
        .add({"full_name": name, "user_email": email})
        .then((value) => print("User Added "))
        .catchError((error) => print("Failed : " + error));
  }
}
