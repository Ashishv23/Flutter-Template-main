import 'package:flutter/material.dart';
import 'package:flutter_template/src/utils/colors.dart';

class CustomAppBarIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  CustomAppBarIconButton({
    this.icon = Icons.exit_to_app,
    required this.onPressed,
  });

  @override
  _CustomAppBarIconButtonState createState() => _CustomAppBarIconButtonState();
}

class _CustomAppBarIconButtonState extends State<CustomAppBarIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
      icon: Icon(widget.icon),
      color: purple,
      onPressed: widget.onPressed,
      iconSize: 25,
    ));
  }
}
