import 'package:flutter/material.dart';

typedef void StringCallback(String val);

class TextFieldX extends StatelessWidget {
  final StringCallback callback;
  final String label;
  final Color textColor;

  TextFieldX(
      {required this.callback, required this.label, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
        child: TextField(
            decoration: InputDecoration(
                labelStyle: TextStyle(color: textColor),
                contentPadding: EdgeInsets.only(
                    top: 2.0, bottom: 2.0, left: 10.0, right: 10.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Color(0xffE3E3E3))),
                focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.blue)),
                labelText: label),
            style: TextStyle(color: textColor),
            onChanged: (text) {
              callback(text);
            }));
  }
}
