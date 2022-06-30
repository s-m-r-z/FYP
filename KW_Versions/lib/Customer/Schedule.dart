import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'db_holder.dart';
import 'global.dart';
import 'location.dart';

DateTime dateTime = DateTime.now();
String time = "", ins = "", date = "";

final _firebaseMessaging = FirebaseMessaging.instance;
final fire = FirebaseFirestore.instance.collection('kabaria');

class schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        //title: 'Schedule Kabaria',
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: ScheduleKabaria());
  }
}

class ScheduleKabaria extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance.collection('user');
  final _firestore1 = FirebaseFirestore.instance.collection('notification');
  final auth = FirebaseAuth.instance.currentUser!.uid;

  @override
  //Future<String?> a=_firebaseMessaging.getToken();
  //print(a);
  static int count = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        // ----------------- App Bar --------------- //
        appBar: AppBar(
          backgroundColor: Colors.green.shade900,
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green.shade900,
          onPressed: () {
            count = count + 1;
            print(count);
          },
          icon: const Icon(Icons.add),
          label: const Text("Distance"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

        // --------------- Body --------------- /
        body: Center(
            child: SingleChildScrollView(
          child: Column(children: [
            // ------------------ Title ----------------- //
            Container(
                margin: const EdgeInsets.only(bottom: 50, top: 50),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.speed),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                          'Schedule Kabaria',
                          style: TextStyle(
                              fontSize: 32.0, fontFamily: 'Times New Roman'),
                        ),
                      )
                    ])),
            // --------------------- Date Time ---------------- //
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green.shade900),
                // borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              height: 200,
              width: 350,
              child: CupertinoDatePicker(
                backgroundColor: Colors.white,
                mode: CupertinoDatePickerMode.dateAndTime,
                //minimumDate: DateTime.now(),
                maximumYear: DateTime.now().year,
                initialDateTime: dateTime,
                onDateTimeChanged: (DateTime newDateTime) {
                  time = newDateTime.toString();
                  date = newDateTime.hour.toString();
                },
              ),
            ),
            // ---------------------- Instructions ----------- //
            Container(
                margin: const EdgeInsets.only(top: 0, bottom: 10),
                child: const Text(
                  'Instructions',
                  style: TextStyle(fontSize: 30),
                )),
            // -------------------- Text Field ------------ //
            Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 50),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (value) {
                    ins = value;
                  },
                )),

            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(
                        onPressed: () async {
                          const snackBar = SnackBar(
                            content: Text(
                                "All Kabaria in the selected distance have been notified"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          locate a = new locate();
                          Position position = await a.getGeoLocationPosition();
                          Placemark place =
                              await a.GetAddressFromLatLong(position);

                          final retreiveData =
                              await fire.where('flag', isEqualTo: '1').get();

                          if (retreiveData.docs.isEmpty) {
                            throw Exception("Flag Not Found");
                          }

                          final kabariaToken =
                              await retreiveData.docs[0].data()['token'];

                          print("The Token Of Schdeuled Karabaira is: " +
                              kabariaToken);

                          await album(kabariaToken);

                          lat = position.latitude;
                          long = position.longitude;
                          String t = '1';

                          String? token = await _firebaseMessaging.getToken();

                          print(token);

                          Map<String, String> d = {
                            'time': time,
                            'ins': ins,
                            'lat': position.latitude.toString(),
                            'long': position.longitude.toString(),
                            'street': place.street.toString(),
                            'area': place.subLocality.toString(),
                            'city': place.locality.toString(),
                            'token': token.toString(),
                            'distance': count.toString()
                          };

                          await _firestore.doc(auth.toString()).update(d);

                          _firestore1.add({
                            'time': time,
                            'ins': ins,
                            'lat': position.latitude.toString(),
                            'long': position.longitude.toString(),
                            'street': place.street.toString(),
                            'area': place.subLocality.toString(),
                            'city': place.locality.toString(),
                          });
                        },
                        icon: const Icon(Icons.done),
                        label: const Text("Schedule Kabaria")),
                    FlatButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScheduleKabaria()),
                          );
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text("Reschedule Kabaria")),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                )
              ],
            ),

            // ------------------- Submit Button -------------- //
            // ignore: deprecated_member_use
          ]),
        )));
  }
}
