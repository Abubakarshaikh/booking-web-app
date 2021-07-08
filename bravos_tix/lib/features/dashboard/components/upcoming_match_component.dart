import 'package:bravos_tix/generated/l10n.dart';
import 'package:core/ui/size_config.dart';
import 'package:core/ui/theme.dart';
import 'package:flutter/material.dart';

import 'card_simple_match.dart';

class UpcomingMatchComponent extends StatefulWidget {
  const UpcomingMatchComponent({Key? key}) : super(key: key);

  @override
  _UpcomingMatchComponentState createState() => _UpcomingMatchComponentState();
}

class _UpcomingMatchComponentState extends State<UpcomingMatchComponent> {
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
                    S.of(context).dashboard_upcoming_matches,
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
                          fontFamily: "Circular Std",
                        ),
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
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) => SizedBox(
              height: getProportionateScreenHeight(index == 0 ? 0 : 16.0),
            ),
            separatorBuilder: (context, index) => CardSimpleMatch(),
            itemCount: 10,
          )
        ],
      ),
    );
  }
}
