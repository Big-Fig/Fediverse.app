import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final EdgeInsets padding;

  const FediTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.padding = FediPadding.allBigPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    var style = onPressed != null
        ? color != null
            ? fediUiTextTheme.bigPrimary.copyWith(color: color)
            : fediUiTextTheme.bigPrimary
        : fediUiTextTheme.bigGrey;

    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onPressed,
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
