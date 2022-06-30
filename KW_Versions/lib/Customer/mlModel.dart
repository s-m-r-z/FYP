import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:tflite/tflite.dart';

import 'mLPost.dart';

final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('plastics');
final CollectionReference collectionReference1 =
    FirebaseFirestore.instance.collection('metals');
final CollectionReference collectionReference2 =
    FirebaseFirestore.instance.collection('woods');
final CollectionReference collectionReference3 =
    FirebaseFirestore.instance.collection('papers');

FirebaseStorage storage = FirebaseStorage.instance;

class mlModel extends StatelessWidget {
  const mlModel({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trash Detection',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  File? _image;
  List? _output;
  final picker = ImagePicker();
  String? detectedElement;
  String? imageURL;
  String? label_num;
  String? item;

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  String check_material(String input) {
    String r;
    switch (input) {
      case '0':
        r = 'Glass';
        break;
      case '1':
        r = 'Metal';
        break;

      case '2':
        r = 'Paper';
        break;

      case '3':
        r = 'Plastic';
        break;

      case '4':
        r = 'Wood';
        break;

      default:
        r = 'null';
    }
    return r;
  }

  classifyImage(File image) async {
    //this function runs the model on the image
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 36, //the amount of categories our neural network can predict
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _output = output;

      detectedElement = _output![0]['label'][0];

      item = check_material(detectedElement.toString());

      print('The Detected Item Is $item');

      _loading = false;
    });
  }

  loadModel() async {
    //this function loads our model
    await Tflite.loadModel(
        model: 'assets/model_unquant(1).tflite',
        labels: 'assets/labels(1).txt');
  }

  Future<void> _upload(File? imageFile, String fileName) async {
    try {
      // Uploading the selected image with some custom meta data
      await storage.ref(fileName).putFile(
          imageFile!,
          SettableMetadata(customMetadata: {
            'uploaded_by': 'A bad guy',
            'description': 'Some description...'
          }));
      final ref1 = FirebaseStorage.instance.ref().child(fileName);

      imageURL = await ref1.getDownloadURL();
      //print("**** $imageURL");
    } on FirebaseException catch (error) {
      print(error);
    } catch (err) {
      print(err);
    }

    setState(() {});
  }

  pickImage() async {
    //this function to grab the image from camera
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;
    String? fileName;
    setState(() {
      _image = File(image.path);
      fileName = path.basename(_image!.path);
    });
    classifyImage(_image!);
    setState(() {});
    await _upload(_image!, fileName!);
  }

  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    String? fileName;
    setState(() {
      _image = File(image.path);
      fileName = path.basename(_image!.path);
    });
    classifyImage(_image!);
    setState(() {});
    await _upload(_image!, fileName!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text(
          'Scan Objects',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w200,
              fontSize: 20,
              letterSpacing: 0.8),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: _loading == true
                      ? null //show nothing if no picture selected
                      : Column(
                          children: [
                            SizedBox(
                              height: 250,
                              width: 250,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.file(
                                  _image!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Divider(
                              height: 25,
                              thickness: 1,
                            ),
                            _output != null
                                ? Text(
                                    'The Detected Object is: $item',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )
                                : Container(),
                            const Divider(
                              height: 25,
                              thickness: 1,
                            ),
                          ],
                        ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: pickImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[600],
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text(
                          'Take A Photo',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: pickGalleryImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[600],
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text(
                          'Pick From Gallery',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("The url of the image is $imageURL");

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MLpost(imageURL, item)),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[600],
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
