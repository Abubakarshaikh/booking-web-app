import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
          height: 110,
          padding: EdgeInsets.only(top: 30, left: 60, right: 60),
          child: Container(
            padding: EdgeInsets.only(left: 27),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                const Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x00333333),
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Image(image: AssetImage('images/logo.png')),
                  Padding(
                      padding: EdgeInsets.only(left: 17),
                      child: Text('Booking.',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ))),
                ]),
                Row(children: [
                  Container(
                      width: 247,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Color(0xfff4f9ff),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(left: 19),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  child: Text("Cliente no Seleccionado",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'SourceSansPro',
                                      )),
                                )
                              ]),
                              Row(
                                children: <Widget>[
                                  // Icon(Icons.search,
                                  //     color: Color(0xff1297d6)),
                                  Expanded(
                                      child: SizedBox(
                                    height: 15,
                                    child: TextFormField(
                                      maxLines: 1,
                                      controller: _searchTextController,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: Color(0xff1297d6),
                                        ),
                                        hintText: 'Seleccionar Cliente',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ))
                                ],
                              )
                            ],
                          ))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Image(image: AssetImage('images/login_btn.png')),
                  ),
                  Container(
                      width: 83,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xff7020ff),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.shopping_cart,
                            color: Colors.white),
                        tooltip: 'Shopping Cart',
                        onPressed: () {},
                      )),
                ]),
              ],
            ),
          )),
    );
  }
}
