import 'package:flutter/material.dart';

class TypeWriter extends StatelessWidget {
  const TypeWriter(
      {this.text, this.weight, this.size, this.color, this.isUnderline});
  final text;
  final weight;
  final size;
  final color;
  final TextDecoration? isUnderline;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SourceSansPro',
        fontSize: size,
        fontWeight: weight,
        color: color,
        decoration: isUnderline,
      ),
    );
  }
}
