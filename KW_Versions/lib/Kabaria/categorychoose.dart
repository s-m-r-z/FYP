import 'package:flutter/material.dart';

import 'Metalretrivedata.dart';
import 'paperretrievedata.dart';
import 'plasticretrivedata.dart';
import 'woodretrivedata.dart';

class categorychoose extends StatefulWidget {
  @override
  _categorychoosestate createState() => _categorychoosestate();
}

class _categorychoosestate extends State<categorychoose> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green.shade900,
            title: const Text('Choose From Category'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            const SizedBox(
              height: 45,
            ),
            ButtonTheme(
              minWidth: 250.0,
              height: 70.0,
              padding: const EdgeInsets.all(20),
              child: RaisedButton(
                color: Colors.green.shade900,
                child: const Text(
                  'Plastic',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                padding: const EdgeInsets.all(30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => plasticretrievedata()),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            ButtonTheme(
              minWidth: 250.0,
              height: 70.0,
              padding: const EdgeInsets.all(20),
              child: RaisedButton(
                color: Colors.green.shade900,
                child: const Text(
                  'Paper',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                padding: const EdgeInsets.all(30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => paperretrievedata()),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            ButtonTheme(
              minWidth: 250.0,
              height: 70.0,
              padding: const EdgeInsets.all(20),
              child: RaisedButton(
                color: Colors.green.shade900,
                child: const Text(
                  'Wood',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                padding: const EdgeInsets.all(30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => woodretrievedata()),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            ButtonTheme(
              minWidth: 250.0,
              height: 70.0,
              padding: const EdgeInsets.all(20),
              child: RaisedButton(
                color: Colors.green.shade900,
                child: const Text(
                  'Metal',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                padding: const EdgeInsets.all(30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => metalretrievedata()),
                  );
                },
              ),
            ),
          ]))),
    );
  }
}
