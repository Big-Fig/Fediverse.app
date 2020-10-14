import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';

class FediFormColumnDesc extends StatelessWidget {
  final String text;

  FediFormColumnDesc(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: FediTextStyles.mediumTallLightGrey,
      );
}
