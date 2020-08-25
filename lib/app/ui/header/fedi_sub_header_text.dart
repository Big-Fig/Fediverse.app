import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';

class FediSubHeaderText extends StatelessWidget {
  final String text;

  const FediSubHeaderText(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: FediTextStyles.bigShortBoldDarkGrey,
      );
}
