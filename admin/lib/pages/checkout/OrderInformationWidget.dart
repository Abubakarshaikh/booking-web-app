import 'package:admin/components/TextFieldX.dart';
import 'package:admin/components/SqureCheckBox.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class OrderInformationWidget extends StatelessWidget {
  const OrderInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size(211, 36)),
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () {},
          child: Text(
            "Reset Cart Expiraction",
            style: TextStyle(
              color: Color(0xff7020FF),
              fontSize: 15,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(310, 36)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {},
              child: Text(
                "Apply Price Type to Selected Items",
                style: TextStyle(
                    color: Color(0xff7020FF),
                    fontSize: 15,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(width: 20),
            MyTable(),
          ],
        ),
      ],
    );
  }
}

class MyTable extends StatelessWidget {
  const MyTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 610,
      height: 360,
      padding: EdgeInsets.only(right: 62, left: 22, top: 27, bottom: 27),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Table(
        // defaultColumnWidth: const FlexColumnWidth(1.5),
        textDirection: TextDirection.ltr,
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              BillTitle(
                label: "Subtotal",
                textColor: Color(0xff767F8A),
              ),
              BillTitle(
                label: "\$ 0.00",
                textColor: Color(0xff767F8A),
              ),
              Text(" "),
            ],
          ),
          TableRow(
            children: [
              BillTitle(
                label: "C. x Serv. Total",
                textColor: Color(0xff767F8A),
              ),
              BillTitle(
                label: "\$ 0.00",
                textColor: Color(0xff767F8A),
              ),
              Row(
                children: [
                  SizedBox(width: 19),
                  SqureCheckBox(),
                  SizedBox(width: 19),
                  BillTitle(
                    label: "Discard",
                    textColor: Color(0xff767F8A),
                  ),
                ],
              ),
            ],
          ),
          TableRow(
            children: [
              BillTitle(
                label: "Partial Total",
                textColor: Color(0xff767F8A),
              ),
              BillTitle(
                label: "\$ 0.00",
                textColor: Color(0xff767F8A),
              ),
              Row(
                children: [
                  SizedBox(width: 19),
                  SqureCheckBox(),
                  SizedBox(width: 19),
                  BillTitle(
                    label: "Discard",
                    textColor: Color(0xff767F8A),
                  ),
                ],
              ),
            ],
          ),
          TableRow(
            children: [
              BillTitle(
                label: "Charge Per Order",
                textColor: Color(0xff767F8A),
              ),
              BillTitle(
                label: "\$ 0.00 Order Fee",
                textColor: Color(0xff767F8A),
              ),
              Text(""),
            ],
          ),
          TableRow(
            children: [
              BillTitle(
                label: "Shipping Charge",
                textColor: Color(0xff767F8A),
              ),
              BillTitle(
                label: "To define",
                textWeight: FontWeight.w700,
                textColor: Color(0xff767F8A),
              ),
              Row(
                children: [
                  SizedBox(width: 19),
                  SqureCheckBox(),
                  SizedBox(width: 19),
                  BillTitle(
                    label: "Discard",
                    textColor: Color(0xff767F8A),
                  ),
                ],
              ),
            ],
          ),
          TableRow(
            children: [
              BillTitle(
                label: "Total",
                textColor: Color(0xff7020FF),
              ),
              BillTitle(
                label: "\$ 0.00",
                textColor: Color(0xff7020FF),
              ),
              Text(""),
            ],
          ),
        ],
      ),
    );
  }
}

class BillTitle extends StatelessWidget {
  BillTitle(
      {this.label,
      this.textPosition = TextAlign.right,
      this.textColor,
      this.textWeight = FontWeight.w400,
      this.textSize = 22});
  final label;
  final TextAlign? textPosition;
  final Color? textColor;
  final FontWeight? textWeight;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Text(
        label,
        textAlign: textPosition,
        style: TextStyle(
          fontFamily: 'SourceSansPro',
          fontSize: textSize,
          fontWeight: textWeight,
          color: textColor,
        ),
      ),
    );
  }
}
