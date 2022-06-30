/*import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'Homepage.dart';
//import 'Chat Screen.dart';
//import 'Call Popup Screen.dart';
//import 'Inside Category Screen.dart';
class addetails extends StatefulWidget {

  @override
  _addetailsState createState() => _addetailsState();
}

class _addetailsState extends State<addetails> {
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title: Text(
          'AD Details',
        style: TextStyle(fontSize: 20),
      ),
      backgroundColor: Colors.green.shade900,
      elevation: 40,
      actions: [

      ],
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
        Navigator.push(
        context,
          PageTransition(
            type: PageTransitionType.leftToRight,
            child: HomePage(),
          ),
        );


        }, icon: Icon(Icons.arrow_back),iconSize: 35.0,),
    ),
    body: ListView(
      padding: EdgeInsets.all(16),
      children: [
        buildimagecard(),
        buildColoredCard('Seller Name :XYZ'),
        buildColoredCard('AD ID :123XXX'),
        buildColoredCard('Avaliability'),
        buildColoredCard('Number Of Articles :10'),
        buildColoredCard('Maximum Weight :10kg'),
        SizedBox(height: 40,),
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
                'https://news.northwestern.edu/assets/Stories/2019/10/plastics-web.jpg',
              ),
              height: 200,
              fit: BoxFit.cover,
            ),
            Positioned(
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
          padding: EdgeInsets.all(16).copyWith(bottom: 0),
          child: Text(
            'PKR.500\n                                                 '
            '                 CardBoard,'
            '\nDHA Defence Phase V,Karachi',
            style: TextStyle(
                fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [

          ],
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
      padding: EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$name',
            style: TextStyle(
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
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => chat(),
                  ),
                  );*/
                },
                child: Text(
                  "Chat",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,

                  ),

                ),
                color: Colors.green.shade900,
                textColor: Colors.white,
              )
          ),
          Spacer(),
          Expanded(
              child: RaisedButton(
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => popup(),
                    ),
                  );*/
                },

                child: Text(
                    "Call",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,

                  ),

                ),

                color: Colors.green.shade900,
                textColor: Colors.white,
              )
          ),
        ],
      ),
    );

  }




}

*/