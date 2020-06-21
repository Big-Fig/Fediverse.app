import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  FediIconButton(this.iconData, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(iconData),
    );
  }
}
