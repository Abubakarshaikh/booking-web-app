import 'package:bravos_tix/features/dashboard/components/today_matchs_component.dart';
import 'package:bravos_tix/features/dashboard/components/upcoming_match_component.dart';
import 'package:bravos_tix/generated/l10n.dart';
import 'package:core/ui/size_config.dart';
import 'package:core/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).dashboard_toolbar_welcome_message,
                style: TextStyle(
                  fontFamily: "Circular Std",
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(8.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: getProportionateScreenWidth(248.0),
                    height: getProportionateScreenHeight(64.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(8.0))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(4.0),
                          horizontal: getProportionateScreenWidth(12.0)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: TEXT_SECONDARY,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontFamily: "Circular Std",
                                  color: TEXT_SECONDARY,
                                ),
                                hintText: "Search",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: getProportionateScreenHeight(64.0),
                    height: getProportionateScreenHeight(64.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(4.0),
                          horizontal: getProportionateScreenWidth(12.0)),
                      child: SvgPicture.asset(
                        "assets/images/ic_filter.svg",
                        color: TEXT_SECONDARY,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(16.0),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(16.0),
                ),
                TodayMatchsComponent(),
                UpcomingMatchComponent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
