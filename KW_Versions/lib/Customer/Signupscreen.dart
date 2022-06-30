import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';
import 'auth.dart';
import 'loginscreen.dart';

class Signupscreen extends StatefulWidget {
  @override
  _Signupscreenstate createState() => _Signupscreenstate();
}

class _Signupscreenstate extends State<Signupscreen> {
  bool isloading = false;

  AuthMethods auth = AuthMethods();
  final _formkey = GlobalKey<FormState>();
  final formkey1 = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final formkey3 = GlobalKey<FormState>();
  TextEditingController nameeditcontroller = TextEditingController();
  TextEditingController emaileditcontroller = TextEditingController();
  TextEditingController phonennoditcontroller = TextEditingController();
  TextEditingController passwordeditcontroller = TextEditingController();
  final collectionReference = FirebaseFirestore.instance.collection('user');

  callme() {
    const snackBar = SnackBar(
      content: Text('User Already "Exist'),
      duration: Duration(seconds: 10),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> signMeUP(BuildContext context, Map<String, String> data) async {
    final userid = await auth.signupWithEmailAndPassword(
        emaileditcontroller.text, passwordeditcontroller.text, context);
    print(userid.toString());
    await collectionReference.doc(userid.toString()).set(data);
    await collectionReference.doc(userid).update({'uid': userid});

    setState(() {
      isloading = false;
    });
  }

  bool _rememberMe = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
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
                      vertical: 70.0,
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
                        const SizedBox(height: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 13.0),
                            Container(
                              color: Colors.black12,
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Name',
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
                              child: TextFormField(
                                key: _formkey,
                                keyboardType: TextInputType.name,
                                controller: nameeditcontroller,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    prefixIcon: Icon(
                                      Icons.account_box_rounded,
                                      color: Colors.black,
                                    ),
                                    hintText: ''),
                                maxLength: 50,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 13.0,
                        ),
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
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emaileditcontroller,
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
                        const SizedBox(
                          height: 13.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Mobile Number',
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
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                controller: phonennoditcontroller,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    prefixIcon: Icon(
                                      Icons.wifi_calling,
                                      color: Colors.black,
                                    ),
                                    hintText: ''),
                                maxLength: 50,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 13.0,
                        ),
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
                              child: TextFormField(
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
                        const SizedBox(height: 30.0),
                        Container(),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 5.0,
                            onPressed: () async {
                              //await collectionReference.add({'Name':nameeditcontroller.text,'email':emaileditcontroller.text,'password':passwordeditcontroller.text,'phoneno':phonennoditcontroller.text,});

                              Map<String, String> a = {
                                'Name': nameeditcontroller.text,
                                'email': emaileditcontroller.text,
                                'password': passwordeditcontroller.text,
                                'phone': phonennoditcontroller.text
                              };
                              //
                              // userid = await auth.signupWithEmailAndPassword(
                              //     emaileditcontroller.text,
                              //     passwordeditcontroller.text);

                              // context.read<UserCubit>().addUser(
                              //     User(
                              //         name: nameeditcontroller.text,
                              //         email: emaileditcontroller.text,
                              //         phone: phonennoditcontroller.text,
                              //         password: passwordeditcontroller.text,
                              //         userid: userid),
                              //     userid);

                              await signMeUP(context, a);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SellerLoginscreen(),
                                ),
                              );
                            },
                            padding: const EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.green.shade900,
                            child: const Text(
                              'SIGN UP',
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
                          //onTap: () => print('SIGN IN'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SellerLoginscreen(),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                text: ('Have an account? '),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                              TextSpan(
                                text: ('Sign In'),
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
