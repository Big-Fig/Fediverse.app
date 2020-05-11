import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:fedi/refactored/app/ui/icon/fedi_icon.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediTransparentIcon extends FediIcon {
  final IconData iconData;
  final Color color;

  FediTransparentIcon(this.iconData, {this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(iconData, color: color);
  }
}
