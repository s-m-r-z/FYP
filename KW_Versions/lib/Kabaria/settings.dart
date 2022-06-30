// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kw_versions/Customer/reset_password.dart';

import '../Customer/auth.dart';

AuthMethods auth = AuthMethods();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SettingsButton());
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reset Password',
      home: Reset(),
    );
  }
}

TextEditingController emailControlEditor = TextEditingController();

class Reset extends StatelessWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        backgroundColor: Colors.green.shade900,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: TextField(
              controller: emailControlEditor,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Your Email'),
            ),
          ),
          SizedBox(
              width: 350,
              height: 65,
              child: Padding(
                padding: EdgeInsets.only(top: 25),
                child: RaisedButton(
                  color: Colors.green.shade900,
                  child: Text('Send Reset Link',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () async {
                    final snackBar = SnackBar(
                      content: const Text('Password Reset link sent'),
                      duration: Duration(seconds: 10),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    await auth.resetPass(emailControlEditor.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPassword(),
                      ),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
