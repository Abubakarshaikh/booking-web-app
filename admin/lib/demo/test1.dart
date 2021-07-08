import 'package:flutter/material.dart';
import 'package:core/network/api_client.dart';
import 'dart:convert';

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  ApiBaseHelper obj = ApiBaseHelper();
  @override
  Widget build(BuildContext context) {
    var data = "";
    return Scaffold(
      body: ElevatedButton(
        child: Text("Press"),
        onPressed: () {
          obj.getHTTP("/cart/9");
        },
      ),
    );
  }
}
