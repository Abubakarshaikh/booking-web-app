import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Header.dart';
import 'Sidebar.dart';

class MainContainer extends StatelessWidget {
  final child;

  MainContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(children: [
          Padding(
              padding: EdgeInsets.only(top: 0, left: 0),
              child: Center(
                  child: Stack(
                    children: [
                SingleChildScrollView(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(),
                        child: Padding(
                          padding: EdgeInsets.only(top: 110, left: 150),
                          child: child,
                        )))
              ]))),
          Header(),
          Sidebar(),
        ]));
  }
}
