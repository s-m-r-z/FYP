
import 'wooddetails.dart';
//import 'package:kachrewala_chat_portal/Kachra/trashpost.dart';
//import 'package:kachrewala_chat_portal/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'Homepage.dart';
class woodretrievedata extends StatefulWidget {
  woodretrievedata();
  _woodretrievedataState createState() => _woodretrievedataState();
}

class _woodretrievedataState extends State<woodretrievedata> {
  _woodretrievedataState();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


          backgroundColor: Colors.green.shade900),
      floatingActionButton:FloatingActionButton.extended(
        backgroundColor: Colors.green.shade900,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        icon: Icon(Icons.add),
        label: Text("SELL"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('woods').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document){
              return Card(
                child:new InkWell(
                  onTap: (){
                    print(document['avgweight']);
                    print(document['contactno']);
                    print(document['description']);
                    print(document['imageURL']);
                    print(document['material']);
                    print(document['noofarticles']);
                    print(document['price']);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => woodaddetails(document['avgweight'], document['contactno'], document['description'], document['imageURL'], document['material'], document['noofarticles'], document['price'])));

                  },
                  child: Container(
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(5)
                              ),
                              image: DecorationImage(image: NetworkImage(document['imageURL']),fit: BoxFit.fill)

                          ),

                        ),
                        Container(
                          height: 100,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Rs."+document['price'], style: TextStyle(fontSize: 20),),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                  child: Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.green),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Text(" No Of Articles :"+document['noofarticles'], style: TextStyle(fontSize: 17),),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                  child: Container(
                                    width: 260,
                                    child: Text("Estimate Weight :" +document['avgweight']+"KG", style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.green
                                    ),),
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),

                ),);
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