import 'package:bravos_tix/generated/l10n.dart';
import 'package:core/ui/size_config.dart';
import 'package:core/ui/theme.dart';
import 'package:flutter/material.dart';

class CardTodayMatch extends StatefulWidget {
  const CardTodayMatch({Key? key}) : super(key: key);

  @override
  _CardTodayMatchState createState() => _CardTodayMatchState();
}

class _CardTodayMatchState extends State<CardTodayMatch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
              getProportionateScreenWidth(24.0),
            ),
            child: Container(
              height: getProportionateScreenHeight(172.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/sample_game.png",
                      height:
                      getProportionateScreenHeight(
                          164.0),
                    ),
                  ),
                  Positioned(
                    top: getProportionateScreenHeight(
                        120.0),
                    left:
                    getProportionateScreenWidth(16.0),
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                        CrossAxisAlignment.end,
                        children: [
                          Container(
                            width:
                            getProportionateScreenWidth(
                                40.0),
                            height:
                            getProportionateScreenHeight(
                                40.0),
                            decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                borderRadius:
                                BorderRadius.all(
                                    Radius.circular(
                                        8.0))),
                            child: Center(
                              child: Column(
                                mainAxisSize:
                                MainAxisSize.min,
                                children: [
                                  Text(
                                    "10",
                                    style: TextStyle(
                                        fontFamily:
                                        "Circular Std",
                                        color:
                                        Colors.white,
                                        fontWeight:
                                        FontWeight
                                            .bold,
                                        fontSize: 22,
                                        height: 0.9),
                                  ),
                                  Text(
                                    "Jan",
                                    style: TextStyle(
                                        fontFamily:
                                        "Circular Std",
                                        color:
                                        Colors.white,
                                        fontSize: 12,
                                        height: 0.97),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                getProportionateScreenHeight(
                                    4.0)),
                            child: Icon(
                              Icons.access_time,
                              color: Colors.white60,
                              size:
                              getProportionateScreenWidth(
                                  16.0),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "7:35",
                              style: TextStyle(
                                fontFamily:
                                "Circular Std",
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: " AM",
                                  style: TextStyle(
                                    fontFamily:
                                    "Circular Std",
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right:
                          getProportionateScreenWidth(
                              24.0)),
                      child: Container(
                        width:
                        getProportionateScreenWidth(
                            28),
                        height:
                        getProportionateScreenHeight(
                            44),
                        decoration: BoxDecoration(
                            color: ORANGE_ALERT,
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(
                                    8.0))),
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(8.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
              getProportionateScreenWidth(40.0),
            ),
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FC Juarez vs Tuzos",
                        style: TextStyle(
                          fontFamily: "Circular Std",
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "Estadio Olímpico Universitario, México",
                        style: TextStyle(
                          fontFamily: "Circular Std",
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: TEXT_SECONDARY,
                        ),
                      )
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      side: BorderSide(
                          color: BORDER_BUTTON,
                          width: 1.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    S.of(context).book_ticket,
                    style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontFamily: 'Circular Std',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
