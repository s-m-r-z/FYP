import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'global.dart';

final _auth = FirebaseAuth.instance;

final _customer = FirebaseFirestore.instance;
final _kabaria = FirebaseFirestore.instance;
final _notification = FirebaseFirestore.instance.collection('notification');

Future<void> get_k() async {
  //Fetching latitude and longitude of the customer from the customer collection
  //Taking the whole Json object of each document in the list data1
  //The given list is dynamic as the data contains the data format of string as well as number(lat and long)
  List<dynamic> data1 = [];

  double b;

  //Fetching data of each customer document in data1 dynamic list
  await _kabaria.collection('customer').get().then((QuerySnapshot a) {
    a.docs.forEach((doc) {
      data1.add(doc.data());
    });
  });

  //The lat and long variables are the current location of the kabaria that are stored in the global variables in the global.dart file
  //If the distance between the customer and the current location of the kabaria is less than 2Km, then a notification would be generated to the Kabaria
  for (var i = 0; i < data1.length; i++) {
    double v = (data1[i]['lat'] - lat) ^ 2 + (data1[i]['long'] - long) ^ 2;
    double r = sqrt(v);

    if (r < 2) {
      //Add the customers details in the notification Screen
      //If and only if it qualifies the the if() criteria
      _notification.add(data1[i]);
    }
  }
}

String url = "www.goolge.com";

Future album(String token) async {
  await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Authorization':
            'key=AAAAao0yXW0:APA91bHiqyfewmcJUGPnqiLpCcN4F0FvgVeZy0YyiB65IXudI5clhKdjPB5ClBFrqekKdb1LA1wANJZkgQFTTF5NB_pHyHlIzI72WT1bskzU7oQ8LQW_3gvNqScw9TdUOPch-alXyZSt'
      },
      //"to" : "dOg8RJdQRUKbqXz-QXXXcj:APA91bGUKmAI6Dy6OUpfVhSC7LyJj14OF5YptCMD9PzMV65CBF89K8PJ8q38FJ0_fv9czSosYtai-OcPimfzfYWxsJqGyg4ILH7P_BiCZ7YcMX4vW5Lc52xei-GjViq6Ut4yPxpqokMR",
      //"dl7aMnZrTcyjDQ8GEoKTYD:APA91bGeijXt4JEcUPHgJWQB4K7PWMreoAbNqsRdaqrJU4jwJG8C2kKGzKSGXr3O5VIZIJNXaOaCpSqk3dcyuSDZ7moVyb5Ie0Dgs583Xm8_6IFXOKHwbThnfYGNUiKCF-_4SFD6kUl_"
      body: jsonEncode({
        "to": token,
        "collapse_key": "type_a",
        "notification": {
          "body":
              "A new customer has just posted the trash\nOpen the app to grab the deal",
          "title": "New Trash Posted !",
          "sound": "Default",
        },
        "android": {
          "priority": "HIGH",
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default",
            "default_sound": true,
            "default_vibrate_timings": true,
            "default_light_settings": true,
          },
        },
        "data": {"body": "Body : Data", "title": "Title : Data"}
      }),
      encoding: Encoding.getByName('utf-8'));
}

Future<void> get() async {
  List<double> lat_c = [];
  List<double> long_c = [];

  await _customer.collection('customer').get().then((QuerySnapshot a) {
    a.docs.forEach((doc) {
      double lat = double.parse(doc['lat']);
      lat_c.add(lat);
      double long = double.parse(doc['long']);
      long_c.add(long);
    });
  });

  List<double> lat_k = [];
  List<double> long_k = [];

  await _kabaria.collection('kabaria').get().then((QuerySnapshot a) {
    a.docs.forEach((doc) {
      double lat = double.parse(doc['lat']);
      lat_k.add(lat);
      double long = double.parse(doc['long']);
      long_k.add(long);
    });
  });

  List<double> x = [];
  List<double> y = [];
  int i = 0;

  for (double e in lat_c) {
    for (double k in lat_k) {
      x[i] = e - k;
      print(x[i]);
      i++;
    }
  }
  i = 0;
  for (double e in long_c) {
    for (double k in long_k) {
      x[i] = e - k;
      print(y[i]);
      i++;
    }
  }
}
