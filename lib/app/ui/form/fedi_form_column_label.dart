import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediFormColumnLabel extends StatelessWidget {
  final String? text;

  const FediFormColumnLabel(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text!,
        style: IFediUiTextTheme.of(context).mediumTallGrey,
      );
}
