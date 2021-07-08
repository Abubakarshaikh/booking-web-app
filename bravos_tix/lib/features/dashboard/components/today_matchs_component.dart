import 'package:bravos_tix/generated/l10n.dart';
import 'package:core/ui/size_config.dart';
import 'package:core/ui/theme.dart';
import 'package:flutter/material.dart';

import 'card_today_match.dart';

class TodayMatchsComponent extends StatefulWidget {
  const TodayMatchsComponent({Key? key}) : super(key: key);

  @override
  _TodayMatchsComponentState createState() => _TodayMatchsComponentState();
}

class _TodayMatchsComponentState extends State<TodayMatchsComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24.0)),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    S.of(context).dashboard_today_matches_title,
                    style: TextStyle(
                      fontFamily: "Circular Std",
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).see_all,
                        style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontFamily: "Circular Std"),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: TEXT_SECONDARY,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: getProportionateScreenHeight(248.0),
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: PageController(
                initialPage: 0,
              ),
              onPageChanged: (page) {},
              children: [
                CardTodayMatch(),
                CardTodayMatch(),
                CardTodayMatch(),
                CardTodayMatch(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
