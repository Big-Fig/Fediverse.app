import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediFormColumnError extends StatelessWidget {
  final String? text;

  // todo: refactor
  const FediFormColumnError(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text!,
        style: IFediUiTextTheme.of(context).mediumTallError,
      );
}
