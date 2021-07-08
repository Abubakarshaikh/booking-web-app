import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../components/MainContainer.dart';
import '../components/TextFieldX.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
        child: Center(
            child: SizedBox(
      width: 671,
      child: Card(
          child: Form(
              child: Padding(
        padding: EdgeInsets.symmetric(vertical: 27, horizontal: 36),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ResponsiveGridRow(
            children: [
            ResponsiveGridCol(
              lg: 12,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text('Create a New Customer',
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ))),
            ),
            ResponsiveGridCol(
              lg: 12,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Text('To Look For',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[900],
                      ))),
            ),
            ResponsiveGridCol(
              lg: 12,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Text("Customer Info",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    )),
              ),
            ),
            ResponsiveGridCol(
                md: 6,
                child: TextFieldX(
                    label: 'Cliente #',
                    textColor: Color(0xffff7a50),
                    callback: (text) => {})),
            ResponsiveGridCol(
                md: 6,
                child: TextFieldX(
                    label: 'Customer Type',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
                md: 12,
                child: TextFieldX(
                    label: 'Company',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
                md: 6,
                child: TextFieldX(
                    label: 'Name',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
                md: 6,
                child: TextFieldX(
                    label: 'Surname',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
                md: 12,
                child: TextFieldX(
                    label: 'Email',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
                md: 6,
                child: TextFieldX(
                    label: 'Phone Number',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
                md: 6,
                child: TextFieldX(
                    label: 'Postal Code',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
              lg: 12,
              child: Padding(
                padding: EdgeInsets.only(top: 24, bottom: 8, left: 4, right: 4),
                child: Text("Created",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    )),
              ),
            ),
            ResponsiveGridCol(
                md: 6,
                child: TextFieldX(
                    label: 'Today',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
                md: 6,
                child: TextFieldX(
                    label: 'You time',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
              lg: 12,
              child: Padding(
                padding: EdgeInsets.only(top: 24, bottom: 8, left: 4, right: 4),
                child: Text("Created by",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    )),
              ),
            ),
            ResponsiveGridCol(
                md: 12,
                child: TextFieldX(
                    label: '',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
              lg: 12,
              child: Padding(
                padding: EdgeInsets.only(top: 24, bottom: 8, left: 4, right: 4),
                child: Text("Last Update",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    )),
              ),
            ),
            ResponsiveGridCol(
                md: 6,
                child: TextFieldX(
                    label: 'Today',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
                md: 6,
                child: TextFieldX(
                    label: 'You time',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
                md: 12,
                child: TextFieldX(
                    label: 'Updated by',
                    textColor: Color(0xff767f8A),
                    callback: (text) => {})),
            ResponsiveGridCol(
              md: 6,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
                  child: TextButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(20.0)),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF7020FF)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {},
                    child: const Text('SEARCH', style: TextStyle(fontSize: 14)),
                  )),
            ),
            ResponsiveGridCol(
              md: 6,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
                  child: TextButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            BorderSide(color: Color(0xFF7020FF))),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(20.0)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Color(0xFF7020FF))),
                    onPressed: () {},
                    child: const Text('CLEAN FORM',
                        style: TextStyle(fontSize: 14)),
                  )),
            ),
          ])
        ]),
      ))),
    )));
  }
}
