import 'package:fedi/app/ui/button/icon/fedi_back_icon_button_keys.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediBackIconButton extends StatelessWidget {
  const FediBackIconButton({
    Key? key,
    this.customOnPressed,
  }) : super(key: key);

  final VoidCallback? customOnPressed;

  @override
  Widget build(BuildContext context) => FediIconButton(
        key: const Key(FediBackIconButtonKeys.button),
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
