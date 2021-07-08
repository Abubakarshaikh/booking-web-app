import 'package:core/ui/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splashScreen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container();
  }
}
