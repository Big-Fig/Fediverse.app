import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediRemoveIconInCircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;

  const FediRemoveIconInCircleButton({
    Key? key,
    required this.onPressed,
    // ignore: no-magic-number
    this.size = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size),
          child: Container(
            width: size,
            // ignore: no-equal-arguments
            height: size,
            // ignore: no-magic-number
            color: IFediUiColorTheme.of(context).darkGrey.withOpacity(0.8),
            child: Icon(
              FediIcons.remove,
              color: IFediUiColorTheme.of(context).white,
              // ignore: no-magic-number
              size: size * 0.6,
            ),
          ),
        ),
      );
}
