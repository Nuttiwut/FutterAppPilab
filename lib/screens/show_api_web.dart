import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tod_pilab/models/profile_model.dart';

class ShowApiWeb extends StatefulWidget {
  @override
  _ShowApiWebState createState() => _ShowApiWebState();
}

class _ShowApiWebState extends State<ShowApiWeb> {
  // explicit
  String urlAPI = 'https://jsonplaceholder.typicode.com/photos';
  List<ProfileModel> profileModels = [];

  // Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAPIweb();
  }

  Future<void> readAPIweb() async {
    var response = await http.get(urlAPI);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      print('Result = $result');

      for (var myModel in result) {
        ProfileModel profileModel = ProfileModel.fromAPI(myModel);
        setState(() {
          profileModels.add(profileModel);
        });
      }
    }
  }

  Widget myLayoutListView(int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.network(profileModels[index].url),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(profileModels[index].title),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profileModels.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: myLayoutListView(index),
          onTap: () {
            print('You click ${profileModels[index].title}');
          },
        );
      },
    );
  }
}
