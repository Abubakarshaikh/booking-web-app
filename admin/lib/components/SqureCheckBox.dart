import 'package:flutter/material.dart';

class SqureCheckBox extends StatelessWidget {
  const SqureCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17,
      width: 17,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: Color(0xffE3E3E3),
        ),
      ),
      child: Checkbox(
        side: BorderSide.none,
        value: false,
        onChanged: (value) {},
      ),
    );
  }
}
