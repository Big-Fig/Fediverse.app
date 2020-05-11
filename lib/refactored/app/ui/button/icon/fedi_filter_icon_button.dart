import 'package:fedi/refactored/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/refactored/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';

class FediFilterIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  FediFilterIconButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FediIconInCircleTransparentButton(FediIcons.filter,
        onPressed: onPressed);
  }
}
