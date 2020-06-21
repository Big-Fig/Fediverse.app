import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';

class FediFormEditTextLabel extends StatelessWidget {
  final String text;

  FediFormEditTextLabel(this.text);

  @override
  Widget build(BuildContext context) => Text(
      text,
      style: TextStyle(
        fontSize: 14.0,
        height: 1.5,
        color: FediColors.grey,
      ),
    );
}
