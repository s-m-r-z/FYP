import 'package:flutter/material.dart';

import 'Signupscreen.dart';

class homeaddetails extends StatefulWidget {
  late String avgweight,
      contactno,
      description,
      imageURL,
      material,
      noofarticles,
      price;
  homeaddetails(String avgweight, String contactno, String description,
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
  _homeaddetailsState createState() => _homeaddetailsState(avgweight, contactno,
      description, imageURL, material, noofarticles, price);
}

class _homeaddetailsState extends State<homeaddetails> {
  late String avgweight,
      contactno,
      description,
      imageURL,
      material,
      noofarticles,
      price;
  _homeaddetailsState(String avgweight, String contactno, String description,
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
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.green.shade900,
          elevation: 40,
          // leading: IconButton(onPressed: (){
          //   Navigator.pop(context);
          //   Navigator.push(
          //     context,
          //     PageTransition(
          //       type: PageTransitionType.leftToRight,
          //       child: HomePagescreen(),
          //     ),
          //   );
          //
          //
          // }, icon: Icon(Icons.arrow_back),iconSize: 35.0,),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
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
            //button(),
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
              padding: const EdgeInsets.all(5).copyWith(bottom: 0),
              child: Text(
                'PKR: ' +
                    price +
                    '\n                                                 ',
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
                name,
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
                  builder: (context) => Signupscreen(),
                ),
              );
            },
            child: const Icon(Icons.location_on),
            color: Colors.green.shade900,
            textColor: Colors.white,
          )),
          Spacer(),
          Expanded(
              child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Signupscreen(),
                ),
              );
            },
            child: const Icon(Icons.call),
            color: Colors.green.shade900,
            textColor: Colors.white,
          )),
        ],
      ),
    );
  }
}
