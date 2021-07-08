
import 'package:flutter/material.dart';

import '../theme.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final Function? onTap;
  final bool enabled;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.enabled = true,
    this.onTap,
  }) : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: PRIMARY_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
      onPressed: widget.enabled ? null : () {
        widget.onTap?.call();
      },
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 26.0,
            color: Colors.white,
            fontFamily: "Circular Std",
          ),
        ),
      ),
    );
  }
}
