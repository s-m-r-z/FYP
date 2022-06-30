import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import 'Homepage.dart';

FirebaseStorage storage = FirebaseStorage.instance;

final curr = FirebaseAuth.instance.currentUser!.uid;

late String imageURL;

final fire = FirebaseFirestore.instance.collection('user');
PickedFile? _imageFile;
final ImagePicker _picker = ImagePicker();

TextEditingController nameeditcontroller = TextEditingController();
TextEditingController emaileditcontroller = TextEditingController();
TextEditingController phonennoditcontroller = TextEditingController();
TextEditingController passwordeditcontroller = TextEditingController();

Future<void> upload(String fileName, File imageFile) async {
  try {
    // Uploading the selected image with some custom meta data
    await storage.ref(fileName).putFile(
          imageFile,
        );
    final ref1 = FirebaseStorage.instance.ref().child(fileName);

    imageURL = await ref1.getDownloadURL();
  } on FirebaseException catch (error) {
    print(error);
  } catch (err) {
    print(err);
  }

  Map<String, String> a = {'imageURL': imageURL};
  await fire.doc(curr.toString()).update(a);
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String? contact, n;
  bool showPassword = false;
  bool loading = true;

  getdetails() async {
    final retreiveData =
        await fire.where('uid', isEqualTo: curr.toString()).get();

    if (retreiveData.docs.isEmpty) {
      throw Exception("User Not Found!");
    }

    final contactNo = await retreiveData.docs[0].data()['phone'];
    final name = await retreiveData.docs[0].data()['Name'];

    setState(() {
      contact = contactNo.toString();
      n = name.toString();
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    //getdetails();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void photodetails(ImageSource source) async {
    final file = await _picker.getImage(source: source);

    _imageFile = file;

    final String fileName = path.basename(_imageFile!.path);
    File imageFile = File(_imageFile!.path);
    upload(fileName, imageFile);

    setState(() {});
  }

  Widget bottomsheet() {
    return Container(
      height: 100,
      width: 50,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Photo",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    photodetails(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Camera")),
              FlatButton.icon(
                  onPressed: () {
                    photodetails(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Gallery"))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getdetails();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green.shade900,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100.0,
                        backgroundImage: _imageFile == null
                            ? const AssetImage('images/Edit.png')
                                as ImageProvider
                            : FileImage(File(_imageFile!.path)),
                        //image: DecorationImage( image: true ? NetworkImage('someNetWorkLocation.com') : AssetImage('assets/images/noImageAvailable.png') as ImageProvider ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Colors.grey,
                              ),
                              color: Colors.green.shade900,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: ((builder) => bottomsheet()));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
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
                        keyboardType: TextInputType.name,
                        controller: nameeditcontroller,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 14.0),
                          prefixIcon: const Icon(
                            Icons.account_box_rounded,
                            color: Colors.black,
                          ),
                          hintText: n,
                        ),
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 14.0),
                          prefixIcon: const Icon(
                            Icons.wifi_calling,
                            color: Colors.black,
                          ),
                          hintText: contact,
                        ),
                        maxLength: 50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (nameeditcontroller.text.isNotEmpty ||
                            passwordeditcontroller.text.isNotEmpty) {
                          final snackBar = SnackBar(
                            content: const Text('Profile Edited'),
                            duration: Duration(seconds: 10),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          await fire.doc(curr.toString()).update({
                            'Name': nameeditcontroller.text,
                            'phone': phonennoditcontroller.text,
                          });
                        } else {
                          final snackBar = SnackBar(
                            content: Text('Enter Valid Name and Phone Details'),
                            duration: Duration(seconds: 5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      color: Colors.green.shade900,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
