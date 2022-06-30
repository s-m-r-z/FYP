import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class authmethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String name = "", phone = "", id = "", u = "";

  Future<String> signinwithemailandpassword(
      String email, String Password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: Password);
      result.user?.email;
      u = result.user!.uid;
    } catch (e) {
      print(e.toString());
    }
    return u;
  }

  Future<String> get_current() async {
    var curr = await _auth.currentUser;
    String uid = "1";

    if (curr != null) {
      uid = curr.uid.toString();
      print("The id of the user is:" + uid);
      return uid;
    } else {
      return uid;
    }
  }

  Future<String> signupwithemailandpassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      u = result.user!.uid;
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('User Already Exist'),
        duration: Duration(seconds: 10),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return u;
  }

  Future resetpass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future set_name(String n) async {
    name = n;
    print("Set:" + name);
  }

  Future<String> get_name() async {
    print("Get:" + name);
    return name;
  }

  Future set_phone(String ph) async {
    phone = ph;

    print("Set:" + phone);
  }

  get_phone() {
    print("Get:" + phone);
    return phone;
  }

  set_uid(String user) {
    id = user;

    print("Set:" + id);
  }

  String get_uid() {
    print("Get:" + id);
    return id;
  }
}
