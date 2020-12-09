import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediNoteDescriptionWidget extends StatelessWidget {
  final String text;
  final EdgeInsets padding;

  FediNoteDescriptionWidget(
    this.text, {
    this.padding = FediPadding.allBigPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: IFediUiTextTheme.of(context).mediumTallMediumGrey,
      ),
    );
  }
}
