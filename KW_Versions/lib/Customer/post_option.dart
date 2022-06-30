import 'package:flutter/material.dart';

import 'mlModel.dart';
import 'trashpost.dart';

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
          child: Column(
            children: <Widget>[
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
                    'Add Trash',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  padding: const EdgeInsets.all(30),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => post()),
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
                    'Scan Trash',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  padding: const EdgeInsets.all(30),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const mlModel()),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
