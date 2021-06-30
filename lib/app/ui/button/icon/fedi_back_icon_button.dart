import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediBackIconButton extends StatelessWidget {
  const FediBackIconButton({this.customOnPressed});

  final VoidCallback? customOnPressed;

  @override
  Widget build(BuildContext context) {
    return FediIconButton(
      icon: Icon(
        FediIcons.chevron_left,
        color: IFediUiColorTheme.of(context, listen: true).darkGrey,
        size: FediSizes.appBarIconSize,
      ),
      onPressed: () {
        if (customOnPressed != null) {
          customOnPressed!();
        } else {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
