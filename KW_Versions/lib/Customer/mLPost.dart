import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';

// ignore: camel_case_types
class MLpost extends StatefulWidget {
  MLpost(this.imageURL, this.labelNum, {Key? key}) : super(key: key);
  String? imageURL;
  String? labelNum;

  @override
  _HomePageState createState() => _HomePageState(imageURL, labelNum);
}

class _HomePageState extends State<MLpost> {
  _HomePageState(this.imageURL, this.label_num);
  String? imageURL;
  String? label_num;

  @override
  Widget build(BuildContext context) {
    String plasticname = "Plastic";
    String woodname = "Wood";
    String metalname = "Metal";
    String papername = "Paper";
    final TextEditingController _price = TextEditingController();
    final TextEditingController _category = TextEditingController();
    final TextEditingController _description = TextEditingController();
    final TextEditingController _noofarticles = TextEditingController();
    final TextEditingController _estweight = TextEditingController();
    final TextEditingController _phoneno = TextEditingController();
    String? price, material, description, articles, weight, contact;
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('plastics');
    final CollectionReference collectionReference1 =
        FirebaseFirestore.instance.collection('metals');
    final CollectionReference collectionReference2 =
        FirebaseFirestore.instance.collection('woods');
    final CollectionReference collectionReference3 =
        FirebaseFirestore.instance.collection('papers');
    var width = 400.0;

    final id = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Post An Ad'),
          backgroundColor: Colors.green.shade900),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: width,
                child: TextField(
                  controller: _price,
                  onChanged: (value) => price = value,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    icon: Icon(Icons.attach_money_sharp, color: Colors.black),
                    labelText: "Expected Price",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: width,
                child: TextField(
                  controller: _category,
                  onChanged: (value) => material = value,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    icon: Icon(Icons.document_scanner, color: Colors.black),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    labelText: "Material",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: width,
                child: TextField(
                  controller: _description,
                  onChanged: (value) => description = value,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    icon: Icon(Icons.description, color: Colors.black),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    labelText: "Add Description",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: width,
                child: TextField(
                  controller: _noofarticles,
                  onChanged: (value) => articles = value,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    icon: Icon(Icons.production_quantity_limits,
                        color: Colors.black),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    labelText: "Total Number of Articles",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Title(
                      color: Colors.grey.shade900,
                      child: const Text(
                        'OR',
                        style: TextStyle(fontSize: 20),
                      ))),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: width,
                child: TextField(
                  controller: _estweight,
                  onChanged: (value) => weight = value,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    icon: Icon(Icons.speed, color: Colors.black),
                    labelText: "Est. Average Weight",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: width,
                child: TextField(
                  controller: _phoneno,
                  onChanged: (value) => contact = value,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    icon: Icon(Icons.phone, color: Colors.black),
                    labelText: "Contact Number",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 350,
                child: RaisedButton(
                  color: Colors.green.shade900,
                  padding: const EdgeInsets.all(8.0),
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.green)),
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    const snackBar = SnackBar(
                      content:
                          Text('Congratulations Your Trash has been posted'),
                      duration: Duration(seconds: 10),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    Map<String, String> a = {
                      'imageURL': imageURL!,
                      'price': price!,
                      'material': label_num!,
                      'noofarticles': articles!,
                      'avgweight': weight!,
                      'contactno': contact!
                    };

                    if (plasticname == label_num) {
                      await collectionReference
                          .doc(id.toString())
                          .set(a)
                          .then((value) => _price.clear());
                    } else if (metalname == label_num) {
                      await collectionReference1
                          .doc(id.toString())
                          .set(a)
                          .then((value) => _price.clear());
                    } else if (woodname == label_num) {
                      await collectionReference2
                          .doc(id.toString())
                          .set(a)
                          .then((value) => _price.clear());
                    } else if (papername == label_num) {
                      await collectionReference3
                          .doc(id.toString())
                          .set(a)
                          .then((value) => _price.clear());
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
