import 'package:flutter/material.dart';

class CustomRaisedButton extends StatefulWidget {
  final String? text;
  final Color? buttonColor;
  final Color? disabledButtonColor;
  final Color? disabledTextColor;
  final Color? textColor;
  final double? borderRadius;
  final double? fontSize;
  final VoidCallback? onCustomButtonPressed;
  final BuildContext? context;
  final double? padding = 8.0;

  CustomRaisedButton(
      {this.text,
      this.buttonColor,
      this.disabledButtonColor,
      this.disabledTextColor,
      this.borderRadius,
      this.fontSize,
      this.textColor,
      this.onCustomButtonPressed,
      this.context});

  @override
  _CustomRaisedButton createState() => _CustomRaisedButton();
}

class _CustomRaisedButton extends State<CustomRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onCustomButtonPressed,
        style: ButtonStyle(

        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.text ?? '',
            style: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.bold,
              fontSize: widget.fontSize,
              // fontFamily: 'Roboto',
            ),
          ),
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
        // ),
        // padding: EdgeInsets.all(widget.padding),
      ),
    );
  }
}
