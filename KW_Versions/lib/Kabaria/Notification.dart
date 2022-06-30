import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

//import 'package:new_notification/db_holder.dart';
import 'google_maps.dart';

class get_not extends StatefulWidget {
  @override
  @override
  _get_not createState() => _get_not();
}

class _get_not extends State<get_not> {
  late FirebaseMessaging message;
  @override
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('notification').snapshots();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView(
                padding: const EdgeInsets.all(0),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  //print(data['Name']);
                  //print(data['time']);

                  return Card(
                    color: Colors.lightGreen,
                    child: ListTile(
                      title: Text("Mr.Ahmed\n123"),
                      subtitle: Text(data['ins'] + "\n" + data['time']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.location_on,
                                color: Colors.black),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Maps()),
                                (route) => false,
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.cancel, color: Colors.black),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  );
                }).toList());
          },
        ),
      ),
    ));
  }
}
