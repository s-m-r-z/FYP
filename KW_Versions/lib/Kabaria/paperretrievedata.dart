import 'paperdetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class paperretrievedata extends StatefulWidget {
  paperretrievedata();
  _paperretrievedataState createState() => _paperretrievedataState();
}

class _paperretrievedataState extends State<paperretrievedata> {
  _paperretrievedataState();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green.shade900),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('papers').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Card(
                child: InkWell(
                  onTap: () {
                    print(document['avgweight']);
                    print(document['contactno']);
                    print(document['description']);
                    print(document['imageURL']);
                    print(document['material']);
                    print(document['noofarticles']);
                    print(document['price']);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => paperaddetails(
                                document['avgweight'],
                                document['contactno'],
                                document['description'],
                                document['imageURL'],
                                document['material'],
                                document['noofarticles'],
                                document['price'])));
                  },
                  child: SizedBox(
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(5)),
                              image: DecorationImage(
                                  image: NetworkImage(document['imageURL']),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Rs." + document['price'],
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 3, 0, 3),
                                  child: Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.green),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(10))),
                                    child: Text(
                                      " No Of Articles :" +
                                          document['noofarticles'],
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 2),
                                  child: Container(
                                    width: 260,
                                    child: Text(
                                      "Estimate Weight :" +
                                          document['avgweight'] +
                                          "KG",
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.green),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              /*return Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,

                          child: Image.network(document['imageURL'], fit: BoxFit.fill,),
                        ),
                        SizedBox(height: 5,),
                        Text(
                           "Category :" +document['Category'],
                          style: TextStyle(color: Colors.green,fontSize: 22,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Description :" +document['Description'],
                          style: TextStyle(color: Colors.black),textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "ESTweight :" +document['ESTweight'],
                          style: TextStyle(color: Colors.black),textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "No Of Articles :" +document['Noofarticles'],
                          style: TextStyle(color: Colors.black),textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Phone Number :" +document['Phoneno'],
                          style: TextStyle(color: Colors.black),textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Price :" +document['Price'],
                          style: TextStyle(color: Colors.black),textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                  ),
                );*/
              /*return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/6,
                      child: Text('CATEGORY :' +document['Category'])

                    ),
                  );*/
            }).toList(),
          );
        },
      ),
    );
  }
}
