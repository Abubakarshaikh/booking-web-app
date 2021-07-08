import 'package:bravos_tix/features/dashboard/components/bravos_bottom_bar.dart';
import 'package:bravos_tix/features/dashboard/controller/dashboard_controller.dart';
import 'package:bravos_tix/features/dashboard/models/tab_option.dart';
import 'package:bravos_tix/features/dashboard/screens/home_screen.dart';
import 'package:bravos_tix/generated/l10n.dart';
import 'package:core/ui/size_config.dart';
import 'package:core/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = "/dashboardScreen";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardController controller = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16.0)),
          child: SvgPicture.asset(
            "assets/images/ic_menu.svg",
            height: getProportionateScreenHeight(24.0),
            width: getProportionateScreenWidth(24.0),
          ),
        ),
        title: Text(
          S.of(context).dashboard_toolbar_welcome("Lisa"),
          style: TextStyle(
            fontFamily: "Circular Std",
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(CupertinoIcons.bell),
          SizedBox(
            width: getProportionateScreenWidth(8.0),
          ),
          Icon(Icons.shopping_cart),
          SizedBox(
            width: getProportionateScreenWidth(8.0),
          ),
          Image.asset(
            "assets/images/sample_avatar.png",
            width: getProportionateScreenWidth(40.0),
          )
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: TabOption.values.indexOf(controller.tabIndex.value),
          children: [
            HomeScreen(),
            Container(),
            Container(),
            Container()
          ],
        ),
      ),
      bottomNavigationBar: BravosBottomBar(),
    );
  }
}
