import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  double myWidth = 200.0;
  double myH1 = 36.0;

  // Method
  Widget showLogo() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        child: Image.asset(
          'images/logo.png',
        ),
        width: myWidth,
        height: myWidth,
      ),
    );
  }

  Widget showAppName() {
    return Text(
      'Tod Pilab',
      style: TextStyle(fontSize: myH1,color: Colors.brown[900],fontWeight: FontWeight.bold,fontFamily: 'Chonburi'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[showLogo(), showAppName()],
      ),
    );
  }
}
