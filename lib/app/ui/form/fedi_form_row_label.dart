import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';

class FediFormRowLabel extends StatelessWidget {
  final String text;

  FediFormRowLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FediTextStyles.bigTallMediumGrey,
    );
  }
}
