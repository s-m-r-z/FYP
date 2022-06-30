import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import 'Homepage.dart';

// ignore: camel_case_types
class post extends StatefulWidget {
  post({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<post> {
  FirebaseStorage storage = FirebaseStorage.instance;
  late String imageURL;

  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    PickedFile? pickedImage;
    try {
      pickedImage = await picker.getImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }));
        final ref1 = FirebaseStorage.instance.ref().child(fileName);

        imageURL = await ref1.getDownloadURL();

        // Refresh the UI

      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (err) {
      print(err);
    }

    const snackBar = SnackBar(
      content: Text('Image has been uploaded'),
      duration: Duration(seconds: 10),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }

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
    String? price, material, description, articles, weight, contact, category;
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
                color: Colors.black38,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _upload('camera'),
                      icon: const Icon(Icons.add_a_photo),
                      label: const Text('camera'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade900,
                        fixedSize: const Size(120, 80),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _upload('gallery'),
                      icon: const Icon(Icons.library_add),
                      label: const Text('Gallery'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade900,
                        fixedSize: const Size(120, 80),
                      ),
                    ),
                  ],
                ),
              ),
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
                  onChanged: (value) => category = value,
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
                      'imageURL': imageURL,
                      'price': price!,
                      'material': category!,
                      'noofarticles': articles!,
                      'avgweight': weight!,
                      'contactno': contact!,
                    };

                    if (plasticname == _category.text) {
                      await collectionReference
                          .doc(id.toString())
                          .set(a)
                          .then((value) => _price.clear());
                    } else if (metalname == _category.text) {
                      await collectionReference1
                          .doc(id.toString())
                          .set(a)
                          .then((value) => _price.clear());
                    } else if (woodname == _category.text) {
                      await collectionReference2
                          .doc(id.toString())
                          .set(a)
                          .then((value) => _price.clear());
                    } else if (papername == _category.text) {
                      await collectionReference3
                          .doc(id.toString())
                          .set(a)
                          .then((value) => _price.clear());
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
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
