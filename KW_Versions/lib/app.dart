import 'package:flutter/material.dart';
import 'package:kw_versions/Customer/loginscreen.dart' as c;
import 'package:kw_versions/Kabaria/loginscreen.dart' as k;

class mainscreen extends StatelessWidget {
  const mainscreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raised Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Image.asset('images/1.gif'),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'W E L C O M E !',
              style: TextStyle(color: Color(0xff9B9B9B), fontSize: 18),
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonTheme(
                minWidth: 250.0,
                height: 70.0,
                padding: const EdgeInsets.all(20),
                child: RaisedButton(
                  color: Colors.green.shade900,
                  child: const Text(
                    'Customer',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  padding: const EdgeInsets.all(30),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => c.SellerLoginscreen()),
                    );
                  },
                )),
            const SizedBox(
              height: 30,
            ),
            ButtonTheme(
                minWidth: 250.0,
                height: 70.0,
                padding: const EdgeInsets.all(20),
                child: RaisedButton(
                  color: Colors.green.shade900,
                  child: const Text(
                    'KachreWala',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  padding: const EdgeInsets.all(30),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => k.BuyerLoginScreen()),
                    );
                  },
                ))
          ],
        ),
      ),
    ));
  }
}
