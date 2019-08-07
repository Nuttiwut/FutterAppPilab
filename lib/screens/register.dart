import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// explicit

// Method

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.account_box,
          size: 36.0,
          color: Colors.green,
        ),
        labelText: 'Name :',
        labelStyle: TextStyle(color: Colors.green),
        helperText: 'Type your name',
        helperStyle: TextStyle(color: Colors.yellow[700]),
        hintText: 'English only',
      ),
    );
  }

  Widget email() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: Colors.blue,
        ),
        labelText: 'E-mail :',
        labelStyle: TextStyle(color: Colors.blue),
        helperText: 'Type your e-mail',
        helperStyle: TextStyle(color: Colors.yellow[700]),
        hintText: 'you@email.com',
      ),
    );
  }

  Widget password() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.red,
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(color: Colors.red),
        helperText: 'Type your password',
        helperStyle: TextStyle(color: Colors.yellow[700]),
        hintText: 'More 6 charactor',
      ),
    );
  }

  Widget groupText() {
    return ListView(
      padding: EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
      children: <Widget>[
        nameText(),
        email(),
        password(),
      ],
    );
  }

  Widget registerButton() {
    return IconButton(
      tooltip: 'Register Firebase',
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[registerButton()],
        backgroundColor: Color.fromARGB(255, 255, 111, 0),
        title: Text('Register'),
      ),
      body: groupText(),
    );
  }
}
