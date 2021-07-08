
import 'package:bravos_tix/generated/l10n.dart';
import 'package:core/ui/size_config.dart';
import 'package:core/ui/theme.dart';
import 'package:flutter/material.dart';

class CardSimpleMatch extends StatefulWidget {
  CardSimpleMatch({Key? key}) : super(key: key);

  @override
  _CardSimpleMatchState createState() => _CardSimpleMatchState();
}

class _CardSimpleMatchState extends State<CardSimpleMatch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16.0)),
        child: Row(
          children: [
            Image.asset(
              "assets/images/sample_upcoming.png",
              width: getProportionateScreenWidth(72.0),
            ),
            SizedBox(
              width: getProportionateScreenWidth(8.0),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: "MEXICO",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Circular Std",
                                fontSize: 18),
                            children: [
                              TextSpan(
                                text: " Vs ",
                                style: TextStyle(
                                    color: TEXT_SECONDARY,
                                    fontFamily: "Circular Std",
                                    fontSize: 18),
                              ),
                              TextSpan(
                                text: "NIGERIA",
                              ),
                            ],
                          ),
                        ),
                      ),
                      Icon(
                        Icons.star_border_outlined,
                        color: ICON_UNSELECTED,
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(4.0),),
                  Text(
                    "Estadio Caliente, Club Tijuana",
                    style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontFamily: "Circular Std",
                        fontSize: 16),
                  ),
                  SizedBox(height: getProportionateScreenHeight(4.0),),
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "11 Jul, 7:30 am",
                          style: TextStyle(
                            color: TEXT_SECONDARY,
                            fontFamily: "Circular Std",
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(

                          onTap: (){

                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                S.of(context).book_now,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Circular Std",
                                  height: 0.9,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: ORANGE_ALERT,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}