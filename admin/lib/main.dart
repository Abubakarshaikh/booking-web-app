// import 'package:admin/demo/demo1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/auth/signin.dart';
import './pages/home.dart';
import 'pages/checkout/checkout.dart';
import 'package:admin/demo/test1.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Main();
  }
}

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<Main> {
  String username = "";
  String password = "";

  void onSignin(String username, String password) {
    setState(() {
      this.username = username;
      this.password = password;
      Get.off(Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bravotix App',
      debugShowCheckedModeBanner: false,
      // home: Signin(onSignin: onSignin),
      home: Test1(),
      // initialRoute: '/signin',
      // initialRoute: '/Checkout',
      getPages: [
        GetPage(name: '/signin', page: () => Signin(onSignin: onSignin)),
        GetPage(name: '/', page: () => Home()), // Dynamic route
        GetPage(name: '/Checkout', page: () => CheckOut()),
      ],
    );
  }
}
