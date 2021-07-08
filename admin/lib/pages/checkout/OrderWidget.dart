import 'package:flutter/material.dart';
import 'package:admin/components/TextFieldX.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        // padding: EdgeInsets.only(top: 54, left: 41),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 1st column
            Container(
              padding:
                  EdgeInsets.only(top: 54, bottom: 71, left: 41, right: 32),
              width: 308,
              height: 778,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [Color(0xffFFFFFF), Color(0xffF7F7F7)],
                  begin: Alignment.center,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choice",
                    textAlign: TextAlign.left,
                    style: titleStyle,
                  ),
                  SizedBox(height: 13),
                  Text(
                    "To",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(288, 45)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffFFF0F0)),
                    ),
                    onPressed: () {},
                    child: Text(
                      "< Cancel an Order",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SourceSansPro',
                        color: Color(0xffF44343),
                      ),
                    ),
                  ),
                  SizedBox(height: 13),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(288, 45)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffEEF4F6)),
                    ),
                    onPressed: () {},
                    child: Text(
                      "< Empty Card",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SourceSansPro',
                        color: Color(0xff1297D6),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // // // 2nd coumn
            Container(
              padding:
                  EdgeInsets.only(top: 54, bottom: 71, left: 47, right: 51),
              // height: 778,
              width: 642,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffFFFFFF), Color(0xffF7F7F7)],
                  begin: Alignment.center,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Anonymous Payment Process",
                    style: titleStyle,
                  ),
                  SizedBox(height: 13),
                  Text(
                    "Page Method",
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Color(0xff495059),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextFieldX(
                    label: "Page Method",
                    callback: (value) {},
                    textColor: Color(0xff767F8A),
                  ),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      Flexible(
                        child: TextFieldX(
                          label: "Apellido",
                          // icon: Icons.arrow_drop_down,
                          callback: (value) {},
                          textColor: Color(0xff767F8A),
                        ),
                      ),
                      SizedBox(width: 14),
                      Flexible(
                        child: TextFieldX(
                          label: "Surname",
                          // icon: Icons.arrow_drop_down,
                          callback: (value) {},
                          textColor: Color(0xff767F8A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  TextFieldX(
                    label: "Email",
                    // icon: Icons.arrow_drop_down,
                    callback: (value) {},
                    textColor: Color(0xff767F8A),
                  ),
                  SizedBox(height: 14),
                  TextFieldX(
                    label: "Postal Code",
                    // icon: Icons.arrow_drop_down,
                    callback: (value) {},
                    textColor: Color(0xff767F8A),
                  ),
                  SizedBox(height: 14),
                  TextFieldX(
                    label: "Amount Payable",
                    // icon: Icons.arrow_drop_down,
                    callback: (value) {},
                    textColor: Color(0xff767F8A),
                  ),
                  SizedBox(height: 17),
                  Text(
                    "Amount Received",
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Color(0xff495059),
                    ),
                  ),
                  SizedBox(height: 14),
                  TextFieldX(
                    label: " ",
                    // icon: Icons.arrow_drop_down,
                    callback: (value) {},
                    textColor: Color(0xff767F8A),
                  ),
                  SizedBox(height: 11),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "(Para Calcular Cambio)",
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: 31),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(598, 45)),
                            // padding: MaterialStateProperty.all(EdgeInsets.only(
                            //     left: 239, top: 12, bottom: 12, right: 239)),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff7020FF)),
                          ),
                          onPressed: () {},
                          child: Text(
                            "FINISH ORDER",
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // // // // 3rd column
            Container(
              // height: 778,
              padding: EdgeInsets.only(left: 47, top: 54),
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: [Color(0xffFFFFFF), Color(0xffF7F7F7)],
              //     begin: Alignment.center,
              //     end: Alignment.centerRight,
              //   ),
              child: Row(
                children: [
                  // 3.1 column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Using Client Data",
                        textAlign: TextAlign.left,
                        style: titleStyle,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(243, 45)),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffE7FAEF)),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Verification",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'SourceSansPro',
                            color: Color(0xff3DBA73),
                          ),
                        ),
                      ),
                      SizedBox(height: 57),
                      Text(
                        "Info. De Reservacion",
                        textAlign: TextAlign.left,
                        style: titleStyle,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(243, 45)),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff3DBA73)),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Add Reservation",
                          style: buttonStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  // // 3.1 column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reservas",
                        textAlign: TextAlign.left,
                        style: titleStyle,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(243, 45)),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffF1A91B)),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Bookings",
                          style: buttonStyle,
                        ),
                      ),
                      SizedBox(height: 105),
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(243, 45)),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffFFF6E5)),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Walker A Reserve",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'SourceSansPro',
                            color: Color(0xffF1A91B),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const titleStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontWeight: FontWeight.w600,
  fontSize: 22.0,
);

const buttonStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
);
