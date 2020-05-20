import 'package:fedi/refactored/app/ui/button/icon/fedi_icon_in_circle_button.dart';
import 'package:fedi/refactored/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediBackIconInCircleTransparentButton extends StatelessWidget
    implements FediIconInCircleButton {
  const FediBackIconInCircleTransparentButton();

  @override
  Widget build(BuildContext context) {
    return FediIconInCircleTransparentButton(Icons.chevron_left, onPressed: () {
      Navigator.pop(context);
    });
  }
}
