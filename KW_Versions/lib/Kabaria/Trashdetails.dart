//import 'addetails.dart';
import 'package:flutter/material.dart';

class trashdetails extends StatefulWidget {
  @override
  _trashdetailsState createState() => _trashdetailsState();
}

class _trashdetailsState extends State<trashdetails> {
  var product_list = [
    {
      "name": "CardBoard",
      "picture": "images/cardboard.jpeg",
      "price": 10,
    },
    {
      "name": "Plastic",
      "picture": "images/plastic.jpeg",
      "price": 40,
    },
    {
      "name": "Metal",
      "picture": "images/metal.jpeg",
      "price": 100,
    },
    {
      "name": "Paper",
      "picture": "images/paper.jpeg",
      "price": 50,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return trashpro(
            trashname: product_list[index]['name'],
            trashpicture: product_list[index]['picture'],
            trashprice: product_list[index]['price'],
          );
        });
  }
}

class trashpro extends StatelessWidget {
  final trashname;
  final trashpicture;
  final trashprice;

  trashpro({
    this.trashname,
    this.trashpicture,
    this.trashprice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: trashname,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                footer: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(
                      trashname,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    title: Text(
                      "\nPrice :\n\$$trashprice",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          /*Navigator.pop(context);
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                //child: addetails(),
                              ),
                            );*/
                        },
                        child: Image.asset(
                          trashpicture,
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
                /*Image.asset(
                    trashpicture,
                    fit: BoxFit.cover,
                  )*/
              ),
            ),
          )),
    );
  }
}
