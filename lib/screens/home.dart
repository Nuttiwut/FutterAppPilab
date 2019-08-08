import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tod_pilab/screens/authen.dart';
import 'package:tod_pilab/screens/my_service.dart';
import 'package:tod_pilab/screens/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  double myWidth = 200.0;
  double myH1 = 36.0;
  Color myColor = Colors.orange[900];

  // Method

  

  @override
  void initState(){
    super.initState();
    checkStatus();
    print('Work');
  }

  Future<void> checkStatus()async{

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();

    if (firebaseUser != null) {

      print('SignIN');

      var myServiceRoute = MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);
      
    }else{
      print('SignOut');
    }

  }

  Widget signUpButton() {
    return Container(
      width: 200.0,
      child: OutlineButton(
        borderSide: BorderSide(color: myColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(color: myColor),
        ),
        onPressed: () {
          var registerRoute =
              MaterialPageRoute(builder: (BuildContext context) => Register());
              Navigator.of(context).push(registerRoute);
        },
      ),
    );
  }

  Widget signInButton() {
    return Container(
      width: 200.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: myColor,
        child: Text(
          'Sign IN',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          print('Click Sign In');

          var authenRoute =
              MaterialPageRoute(builder: (BuildContext context) => Authen());
          Navigator.of(context).push(authenRoute);
        },
      ),
    );
  }

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
      style: TextStyle(
          fontSize: myH1,
          color: Colors.brown[800],
          fontWeight: FontWeight.bold,
          fontFamily: 'Chonburi'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blue],
            radius: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            showAppName(),
            signInButton(),
            signUpButton(),
          ],
        ),
      ),
    );
  }
}
