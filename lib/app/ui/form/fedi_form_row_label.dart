import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediFormRowLabel extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  FediFormRowLabel(
    this.text, {
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: textStyle ?? IFediUiTextTheme.of(context).bigTallMediumGrey,
      );
}
