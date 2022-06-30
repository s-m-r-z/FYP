import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String name = "", phone = "", id = "", u = "";

  Future<String> signinWithEmailAndPassword(
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

  Future<String> signupWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      u = result.user!.uid;
      print(u);
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('User Already Exist'),
        duration: Duration(seconds: 10),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return u;
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future confirmResetPassword(String code, String newPassword) async {
    try {
      return await _auth.confirmPasswordReset(
          code: code, newPassword: newPassword);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future getCurrent() async {
    final user = _auth.currentUser!;
    //User(userid:user.toString());
  }
}
