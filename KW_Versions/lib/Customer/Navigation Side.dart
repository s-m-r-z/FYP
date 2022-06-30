import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kw_versions/Customer/Edit%20Profile%20Screen.dart';
import 'package:kw_versions/app.dart';

import 'Homepage.dart';
import 'auth.dart';
import 'post_option.dart';
import 'schedule.dart';

AuthMethods auth = AuthMethods();

class Nav extends StatelessWidget {
  Nav({Key? key}) : super(key: key);

  final user = FirebaseFirestore.instance.collection("user");
  final curr = FirebaseAuth.instance.currentUser!.uid;

  //Future<void> getdata(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          // CircleAvatar(
          //     radius: 50,
          //     child: ClipRRect(
          //       child: Image.asset(
          //         'images/Barack_Obama.jpg',
          //         fit: BoxFit.fitWidth,
          //       ),
          //       borderRadius: BorderRadius.circular(50.0),
          //     ),
          //     backgroundColor: Colors.transparent),
          Image.asset(
            'images/1.gif',
            height: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          // Text(
          //   "Welcome !",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     color: Colors.green.shade900,
          //     fontSize: 18,
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
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

              //await getdata(context);

              // final retreiveData =
              //     await user.where('uid', isEqualTo: curr.toString()).get();
              //
              // if (retreiveData.docs.isEmpty) {
              //   throw Exception("User Not Found!");
              // }
              //
              // final contactNo = retreiveData.docs[0].data()['phone'];
              // final name = retreiveData.docs[0].data()['Name'];

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(),
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
              title: const Text("Post Trash"),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => categorychoose(),
                  ),
                );
              }),
          Divider(
            height: 20,
            color: Colors.green.shade900,
          ),
          ListTile(
              leading: const Icon(Icons.payment_sharp),
              title: const Text("Schedule"),
              trailing: const Icon(Icons.schedule),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => schedule(),
                    ));
              }),
          Divider(
            height: 20,
            color: Colors.green.shade900,
          ),

          const SizedBox(
            height: 180,
          ),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                auth.signOut();
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
