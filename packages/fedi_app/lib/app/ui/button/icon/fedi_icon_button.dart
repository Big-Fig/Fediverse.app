import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;
  final Color? color;
  final double iconSize;
  final String? tooltip;
  final EdgeInsets padding;

  const FediIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.padding = FediPadding.allSmallPadding,
    // ignore: no-magic-number
    this.iconSize = 24.0,
    this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        padding: padding,
        icon: icon,
        color: color,
        iconSize: iconSize,
        tooltip: tooltip,
      );
}
