import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
          constraints: BoxConstraints.expand(width: 150),
          padding: EdgeInsets.only(top: 150, left: 60, bottom: 20),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.all(
                  const Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: const Alignment(0.0, -1.0),
                  end: const Alignment(0.0, 0.6),
                  colors: <Color>[
                    const Color(0xff7020ff),
                    const Color(0xff4350ff)
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 52,
                      height: 52,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(26))),
                      child: IconButton(
                        icon: const Icon(Icons.local_activity,
                            color: Color(0xff7020ff)),
                        tooltip: 'Local Activity',
                        onPressed: () {},
                      )),
                  Container(
                      width: 52,
                      height: 52,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Color(0xff5719c4),
                          borderRadius: BorderRadius.all(Radius.circular(26))),
                      child: IconButton(
                        icon: const Icon(Icons.chrome_reader_mode,
                            color: Colors.white),
                        tooltip: 'Local Activity',
                        onPressed: () {},
                      )),
                  Container(
                      width: 52,
                      height: 52,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Color(0xff5719c4),
                          borderRadius: BorderRadius.all(Radius.circular(26))),
                      child: IconButton(
                        icon: const Icon(Icons.account_circle,
                            color: Colors.white),
                        tooltip: 'User Activity',
                        onPressed: () {},
                      )),
                  Container(
                      width: 52,
                      height: 52,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Color(0xff5719c4),
                          borderRadius: BorderRadius.all(Radius.circular(26))),
                      child: IconButton(
                        icon: const Icon(Icons.account_balance_wallet,
                            color: Colors.white),
                        tooltip: 'Account Balance',
                        onPressed: () {},
                      )),
                ],
              ))),
    );
  }
}
