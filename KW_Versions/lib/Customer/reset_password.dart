import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart' as h;
import 'auth.dart';
import 'loginscreen.dart';

AuthMethods auth = AuthMethods();

final loggedInUser = FirebaseAuth.instance;

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Reset Password',
      home: Reset(),
    );
  }
}

TextEditingController authenticationCode = TextEditingController();
TextEditingController newPassword = TextEditingController();

class Reset extends StatelessWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reset Details'),
          backgroundColor: Colors.green.shade900,
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: TextField(
              controller: authenticationCode,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Reset Code'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: TextField(
              controller: newPassword,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'New Password'),
            ),
          ),
          SizedBox(
              width: 350,
              height: 190,
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: RaisedButton(
                  color: Colors.green.shade900,
                  child: const Text('Reset Password',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () async {
                    const snackBar = SnackBar(
                      content: Text('Password has been reset successfully'),
                      duration: Duration(seconds: 10),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    await auth.confirmResetPassword(
                        authenticationCode.text, newPassword.text);

                    loggedInUser.currentUser == null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SellerLoginscreen(),
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => h.HomePage(),
                            ),
                          );
                  },
                ),
              ))
        ]));
  }
}
