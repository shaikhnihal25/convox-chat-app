import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseServices {
  Future uploadImageToFirebase(BuildContext context, File imageFile) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url;
    String uid = auth.currentUser?.uid;
    String filename = imageFile.path;
    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef = storageRef.child("profileImage/$uid");

    try {
      await storageRef.child("profileImage/$uid").putFile(imageFile);
      url = mountainsRef.getDownloadURL() as String;
      prefs.setString("ImageUrl", url);
      var testUrl = prefs.getString("ImageUrl");

      print(testUrl);
    } catch (e) {
      print(e);
    }
  }
}
