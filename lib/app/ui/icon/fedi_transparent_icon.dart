import 'package:flutter/widgets.dart';

class FediTransparentIcon extends StatelessWidget {
  final IconData iconData;
  final Color? color;

  const FediTransparentIcon(this.iconData, {this.color});

  @override
  Widget build(BuildContext context) => Icon(iconData, color: color);
}
