import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kw_versions/app.dart';

import 'Homepage.dart';
import 'Payment.dart';
import 'auth.dart';
import 'categorychoose.dart';
import 'edit_profile_screen.dart';

class Nav extends StatelessWidget {
  final curr = FirebaseAuth.instance.currentUser!.uid;

  final fire = FirebaseFirestore.instance.collection("kabaria");

  final auth = authmethods();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Image.asset('images/1.gif'),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => HomePage()),
                // );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage()),
                  (route) => false,
                );
              }),
          Divider(
            height: 20,
            color: Colors.green.shade900,
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text("Profile"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () async {
              Navigator.pop(context);

              // final retreiveData =
              //     await fire.where('uid', isEqualTo: curr.toString()).get();

              // if (retreiveData.docs.isEmpty) {
              //   throw Exception("User Not Found!");
              // }

              // final contactNo = await retreiveData.docs[0].data()['phone'];
              // final name = await retreiveData.docs[0].data()['Name'];

              // print(name.toString());
              // print(contactNo.toString());

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(),
                ),
              );
            },
          ),
          Divider(
            height: 20,
            color: Colors.green.shade900,
          ),
          ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Categories"),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => categorychoose()),
                );
              }),
          Divider(
            height: 20,
            color: Colors.green.shade900,
          ),
          ListTile(
              leading: const Icon(Icons.payment_sharp),
              title: const Text("Payment"),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Payment()),
                  (route) => false,
                );
              }),
          Divider(
            height: 20,
            color: Colors.green.shade900,
          ),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () async {
                await fire.doc(curr.toString()).update({
                  'flag': '0',
                });

                auth.signout();

                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const mainscreen()),
                );
              }),
        ],
      ),
    );
  }
}
