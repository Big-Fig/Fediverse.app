import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';

class FediFormColumnError extends StatelessWidget {
  final String text;

  FediFormColumnError(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: FediTextStyles.mediumTallError,
      );
}
