import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Signupscreen.dart';
import 'google_maps.dart';
import 'plasticretrivedata.dart';

class plasticaddetails extends StatefulWidget {
  late String avgweight,
      contactno,
      description,
      imageURL,
      material,
      noofarticles,
      price;
  plasticaddetails(String avgweight, String contactno, String description,
      String imageURL, String material, String noofarticles, String price,
      {Key? key})
      : super(key: key) {
    this.avgweight = avgweight;
    this.contactno = contactno;
    this.description = description;
    this.imageURL = imageURL;
    this.material = material;
    this.noofarticles = noofarticles;
    this.price = price;
  }

  @override
  _plasticaddetailsState createState() => _plasticaddetailsState(avgweight,
      contactno, description, imageURL, material, noofarticles, price);
}

class _plasticaddetailsState extends State<plasticaddetails> {
  late String avgweight,
      contactno,
      description,
      imageURL,
      material,
      noofarticles,
      price;
  _plasticaddetailsState(String avgweight, String contactno, String description,
      String imageURL, String material, String noofarticles, String price) {
    this.avgweight = avgweight;
    this.contactno = contactno;
    this.description = description;
    this.imageURL = imageURL;
    this.material = material;
    this.noofarticles = noofarticles;
    this.price = price;
  }
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'AD Details',
            style: const TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.green.shade900,
          elevation: 40,
          actions: [],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => plasticretrievedata()),
              );
            },
            icon: const Icon(Icons.arrow_back),
            iconSize: 35.0,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildimagecard(),
            buildColoredCard('Material :' + material),
            buildColoredCard('Avg Weight :' + avgweight + "KG"),
            buildColoredCard('No Of Articles:' + noofarticles),
            buildColoredCard('Contact No :' + contactno),
            buildColoredCard('Description :' + description),
            const SizedBox(
              height: 40,
            ),
            button(),
          ],
        ),
      );
  Widget buildimagecard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    imageURL,
                  ),
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'PKR :' +
                    price +
                    '\n                                                 '
                        '                 CardBoard,'
                        '\nDHA Defence Phase V,Karachi',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [],
            )
          ],
        ),
      );
  Widget buildColoredCard(String name) => Card(
        shadowColor: Colors.green.shade900,
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade900, Colors.green.shade900],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$name',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 1),
            ],
          ),
        ),
      );

  Widget button() {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
              child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Maps(),
                ),
              );
            },
            child: const Text(
              "Location",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.green.shade900,
            textColor: Colors.white,
          )),
          const Spacer(),
          Expanded(
              child: RaisedButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 2), () {});
              launch('tel://$contactno');
            },
            child: const Text(
              "Call",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.green.shade900,
            textColor: Colors.white,
          )),
        ],
      ),
    );
  }
}
