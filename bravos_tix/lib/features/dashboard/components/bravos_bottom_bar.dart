import 'package:bravos_tix/features/dashboard/controller/dashboard_controller.dart';
import 'package:bravos_tix/features/dashboard/models/tab_option.dart';
import 'package:bravos_tix/generated/l10n.dart';
import 'package:core/ui/size_config.dart';
import 'package:core/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BravosBottomBar extends StatelessWidget {
  DashboardController controller = Get.find();

  BravosBottomBar({Key? key}) : super(key: key);

  static const BRAVOS_BOTTOM_BAR = "bravos_bottom_bar";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        boxShadow: kElevationToShadow[8],
      ),
      child: Obx(
        () => BottomNavigationBar(
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: TabOption.values.indexOf(controller.tabIndex.value),
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: ICON_UNSELECTED,
          onTap: (index) {
            controller.changeTabIndex(TabOption.values[index]);
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/ic_home.svg",
                  color: controller.tabIndex.value == TabOption.HOME
                      ? PRIMARY_COLOR
                      : ICON_UNSELECTED,
                  width: getProportionateScreenWidth(24.0),
                ),
                label: S.of(context).home),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/ic_tickets.svg",
                  color: controller.tabIndex.value == TabOption.TICKET
                      ? PRIMARY_COLOR
                      : ICON_UNSELECTED,
                  width: getProportionateScreenWidth(24.0),
                ),
                label: S.of(context).tickets),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/ic_fav.svg",
                  color: controller.tabIndex.value == TabOption.FAVOURITES
                      ? PRIMARY_COLOR
                      : ICON_UNSELECTED,
                  width: getProportionateScreenWidth(24.0),
                ),
                label: S.of(context).favorites),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/ic_account.svg",
                  color: controller.tabIndex.value == TabOption.ACCOUNT
                      ? PRIMARY_COLOR
                      : ICON_UNSELECTED,
                  width: getProportionateScreenWidth(24.0),
                ),
                label: S.of(context).account),
          ],
        ),
      ),
    );
  }
}
