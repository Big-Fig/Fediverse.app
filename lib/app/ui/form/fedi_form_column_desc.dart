import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediFormColumnDesc extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;

  FediFormColumnDesc(
    this.text, {
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) => Text(
        text!,
        style: textStyle ?? IFediUiTextTheme.of(context).smallShortGrey,
      );
}
