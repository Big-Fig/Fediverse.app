import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediFormRowLabel extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  // todo: refactor
  const FediFormRowLabel(
    this.text, {
    Key? key,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: textStyle ?? IFediUiTextTheme.of(context).bigTallMediumGrey,
      );
}
