import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Metalretrivedata.dart';
import 'Navigation Side.dart';
import 'homeaddetails.dart';
import 'paperretrievedata.dart';
import 'plasticretrivedata.dart';
import 'settings.dart';
import 'woodretrivedata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? helllo;
  String? helllo2;
  var value;
  var value1;
  var value3;
  var value4;
  var value5;
  var value6;
  var value7;
  var value8;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    var collection = FirebaseFirestore.instance.collection('metals');
    var collection1 = FirebaseFirestore.instance.collection('plastics');
    var collection2 = FirebaseFirestore.instance.collection('woods');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'KachreWala',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green.shade900,
        elevation: 40,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            ),
            icon: const Icon(Icons.settings_applications),
            iconSize: 35.0,
          ),
        ],
      ),
      drawer: Nav(),
      body: ListView(
        children: [
          const SizedBox(
            height: 2,
          ),
          // Container(
          //   width: 40,
          //   height: 50,
          //   decoration: BoxDecoration(
          //       color: Colors.grey, borderRadius: BorderRadius.circular(1)),
          //   child: Center(
          //     child: TextField(
          //       keyboardType: TextInputType.text,
          //       cursorColor: Colors.green.shade900,
          //       decoration: InputDecoration(
          //           prefixIcon: Icon(Icons.search, color: Colors.green.shade900,),
          //           suffixIcon: IconButton(
          //             icon: Icon(Icons.arrow_forward,color: Colors.green.shade900,),
          //             onPressed: () {
          //               /* Clear the search field */
          //             },
          //           ),
          //           hintText: 'Search For Products',
          //           border: InputBorder.none),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),

          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://prod-discovery.edx-cdn.org/media/course/image/e24e3507-5307-4073-8cd2-2aec2ca2e113-d03781ba3626.small.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://media.istockphoto.com/vectors/set-of-colorful-garbage-cans-with-sorted-garbage-on-white-background-vector-id934822442?s=612x612"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://p1.pxfuel.com/preview/75/389/155/garbage-waste-container-waste-waste-bins.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://cdn.openpr.com/U/b/Ub23837389_g.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 220.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 29 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "CATEGORIES",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.green.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(12.0),
            padding: const EdgeInsets.all(6.0),
            decoration: const BoxDecoration(
                //  border: Border.all(color: Colors.green.shade900),
                // color: Colors.black12
                ),
            // color: Colors.black12,
            alignment: FractionalOffset.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => paperretrievedata()),
                    );
                    print("Paper clicked");
                  },
                  child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.vectorstock.com/i/1000x1000/25/58/office-paper-icon-outline-style-vector-22692558.webp"),
                      radius: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => plasticretrievedata()),
                    );

                    print("Plastic Clicked");
                  },
                  child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/1039/1039778.png"),
                      radius: 20),
                ),
                const SizedBox(height: 20),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 20,
                ),
                InkWell(
                  onTap: () {
                    print("Wood clicked");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => woodretrievedata()),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/2933/2933661.png"),
                    radius: 20,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 20,
                ),
                InkWell(
                  onTap: () {
                    print("Metal Clicked");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => metalretrievedata()),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/2427/2427587.png"),
                    radius: 20,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: collection.doc('PENR5mh5estvUNdVemAW').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                try {
                  var output = snapshot.data?.data();
                  value = output?['adtitle'];
                  value1 = output?['avgweight'];
                  value3 = output?['imageURL'];
                  value4 = output?['price'];
                  helllo = '$value3';
                  print('Value =$value1');
                  print('Value =$value3');
                } catch (ex) {
                  var output = snapshot.data!.data();
                  value = output?['adtitle'];
                  value1 = output?['avgweight'];
                  value3 = output?['imageURL'];
                  value4 = output?['price'];
                  helllo = '$value3';
                  print('Value =$value1');
                  print('Value =$value3');
                }
              }

              return const Center();
            },
          ),
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: collection1.doc('Mtb6lSK90XYIIwHZLEEX').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var output1 = snapshot.data!.data();
                value5 = output1?['adtitle'];
                value6 = output1?['avgweight'];
                value7 = output1?['imageURL'];
                value8 = output1?['price'];
                helllo2 = '$value7';
                print('Value =$value5');
                print('Value =$value6');
              }

              return const Center();
            },
          ),
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: collection2.doc('Mtb6lSK90XYIIwHZLEEX').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var output1 = snapshot.data!.data();
                value5 = output1?['adtitle'];
                value6 = output1?['avgweight'];
                value7 = output1?['imageURL'];
                value8 = output1?['price'];
                helllo2 = '$value7';
                print('Value =$value5');
                print('Value =$value6');
              }

              return const Center();
            },
          ),

          const SizedBox(
            height: 20,
          ),
          Text(
            "FEATURED PRODUCTS",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.green.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          //leading: Image.network(''),
                          title: Image.network(
                            'https://chiefexecutive.net/wp-content/uploads/2020/11/AdobeStock_319739307.jpg',
                            height: 100,
                          ),
                          subtitle: Text(
                            'Plastic Bottles',
                            style: TextStyle(
                                color: Colors.green.shade900,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            'Average weight: 12',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            'Price: 1000',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            FlatButton(
                              textColor: const Color(0xFF6200EE),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => homeaddetails(
                                            '12',
                                            '03332773062',
                                            'Bunch Of plastic bottles',
                                            'https://chiefexecutive.net/wp-content/uploads/2020/11/AdobeStock_319739307.jpg',
                                            'Plastic',
                                            '3',
                                            '1000')));
                              },
                              child: const Text('More Details'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          //leading: Image.network(''),
                          title: Image.network(
                            'https://www.manwithoutcountry.com/wp-content/uploads/2019/01/Pile-of-wood-waste-1024x684.jpg',
                            height: 100,
                          ),
                          subtitle: Text(
                            'Wood Blocks',
                            style: TextStyle(
                                color: Colors.green.shade900,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            'Average weight: 30',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            'Price: 5000',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            FlatButton(
                              textColor: const Color(0xFF6200EE),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => homeaddetails(
                                            '30',
                                            '03332773063',
                                            'Many Wood blocks',
                                            'https://www.manwithoutcountry.com/wp-content/uploads/2019/01/Pile-of-wood-waste-1024x684.jpg',
                                            'Wood',
                                            '11',
                                            '5000')));
                              },
                              child: const Text('More Details'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          //leading: Image.network(''),
                          title: Image.network(
                            'https://cpb-us-w2.wpmucdn.com/newspaper.neisd.net/dist/e/5/files/2017/10/D05346BF-34BE-4E33-9135-7E86D6EF2AEE-2nwpjdm.jpeg',
                            height: 100,
                          ),
                          subtitle: Text(
                            'Pile Of Papers',
                            style: TextStyle(
                                color: Colors.green.shade900,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            'Average weight: 19',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            'Price: 3000',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            FlatButton(
                              textColor: const Color(0xFF6200EE),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => homeaddetails(
                                            '19',
                                            '03332773064',
                                            'Pile Of Papers',
                                            'https://cpb-us-w2.wpmucdn.com/newspaper.neisd.net/dist/e/5/files/2017/10/D05346BF-34BE-4E33-9135-7E86D6EF2AEE-2nwpjdm.jpeg',
                                            'Paper',
                                            '20',
                                            '5000')));
                              },
                              child: const Text('More Details'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          //leading: Image.network(''),
                          title: Image.network(
                            'https://www.crushpixel.com/static107/preview100/metal-tins-cans-jar-garbage-2829442.jpg',
                            height: 100,
                          ),
                          subtitle: Text(
                            'Metal Tins',
                            style: TextStyle(
                                color: Colors.green.shade900,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            'Average weight: 40',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            'Price: 2400',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            FlatButton(
                              textColor: const Color(0xFF6200EE),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => homeaddetails(
                                            '40',
                                            '03332773060',
                                            'Metals Tins',
                                            'https://www.crushpixel.com/static107/preview100/metal-tins-cans-jar-garbage-2829442.jpg',
                                            'Metal',
                                            '20',
                                            '2400')));
                              },
                              child: const Text('More Details'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
