import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediNoteDescriptionWidget extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final TextStyle? style;

  const FediNoteDescriptionWidget(
    this.text, {
    this.padding = FediPadding.allBigPadding,
    this.style,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: style ?? IFediUiTextTheme.of(context).mediumTallMediumGrey,
        ),
      );
}
