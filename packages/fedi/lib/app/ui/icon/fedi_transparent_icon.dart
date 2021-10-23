import 'package:flutter/widgets.dart';

class FediTransparentIcon extends StatelessWidget {
  final IconData iconData;
  final Color? color;

  // todo: refactor
  const FediTransparentIcon(
    this.iconData, {
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Icon(iconData, color: color);
}
