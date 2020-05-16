import 'package:fedi/refactored/app/ui/icon/fedi_icon.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediTransparentIcon extends StatelessWidget implements FediIcon {
  final IconData iconData;
  final Color color;

  const FediTransparentIcon(this.iconData, {this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(iconData, color: color);
  }
}
