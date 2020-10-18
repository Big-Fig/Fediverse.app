import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediFormColumnDesc extends StatelessWidget {
  final String text;

  FediFormColumnDesc(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: IFediUiTextTheme.of(context).mediumTallLightGrey,
      );
}
