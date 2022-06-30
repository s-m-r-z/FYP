import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:kw_versions/Customer/trashpost.dart';
import 'package:kw_versions/Kabaria/auth.dart';
import 'package:kw_versions/app.dart';

import 'Homepage.dart';
import 'Signupscreen.dart';
import 'settings.dart';

CollectionReference fire = FirebaseFirestore.instance.collection('kabaria');

class BuyerLoginScreen extends StatefulWidget {
  const BuyerLoginScreen({Key? key}) : super(key: key);

  @override
  _Loginscreenstate createState() => _Loginscreenstate();
}

class _Loginscreenstate extends State<BuyerLoginScreen> {
  final loggedInUser = FirebaseAuth.instance;
  String name = "", email = "", password = "", phone = "", uid = "";
  TextEditingController emaileditcontroller = TextEditingController();
  TextEditingController passwordeditcontroller = TextEditingController();
  bool isloading = false;
  authmethods auth = authmethods();

  signInUser(BuildContext context) async {
    const snackBar = SnackBar(
      content: Text('User Does not exist'),
      duration: Duration(seconds: 10),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFFFFFFF),
                        Color(0xFFFFFFFF),
                        Color(0xFFFFFFFF),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 110.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'KachreWala',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.green.shade900,
                                fontSize: 19.0,
                              ),
                            ),
                            const SizedBox(
                              height: 13.0,
                            ),
                            Container(
                              color: Colors.black12,
                              alignment: Alignment.centerLeft,
                              height: 60.0,
                              child: TextField(
                                controller: emaileditcontroller,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                    hintText: ''),
                                maxLength: 50,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Password',
                              style: TextStyle(
                                color: Colors.green.shade900,
                                fontSize: 19.0,
                              ),
                            ),
                            const SizedBox(
                              height: 13.0,
                            ),
                            Container(
                              color: Colors.black12,
                              alignment: Alignment.centerLeft,
                              height: 60.0,
                              child: TextField(
                                controller: passwordeditcontroller,
                                obscureText: true,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                ),
                                maxLength: 50,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyApp(),
                                ),
                              );
                            },
                            padding: const EdgeInsets.only(right: 0.0),
                            child: const Text('Forgot Password?'),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 5.0,
                            onPressed: () async => {
                              //signInUser(context),
                              await auth.signinwithemailandpassword(
                                  emaileditcontroller.text,
                                  passwordeditcontroller.text),

                              await fire
                                  .doc(loggedInUser.currentUser!.uid)
                                  .update({
                                'flag': '1',
                              }),

                              loggedInUser.currentUser == null
                                  ? signInUser(context)
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ),
                                    ),
                            },
                            color: Colors.green.shade900,
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  letterSpacing: 1.5,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Opensans'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signupscreen()),
                            );
                          },
                          child: RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                text: ('Dont have an account? '),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                              TextSpan(
                                text: ('Sign Up'),
                                style: TextStyle(
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const mainscreen()),
                            );
                          },
                          child: RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                text: ('Choose Another Account? '),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                              TextSpan(
                                text: ('Back To Main'),
                                style: TextStyle(
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

class Data {
  final String uid;

  Data(this.uid);
}
