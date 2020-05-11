import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';

class FediHeaderText extends StatelessWidget {
  final String text;

  FediHeaderText(this.text);

  @override
  Widget build(BuildContext context) => Text(
      text,
      style: TextStyle(
        color: FediColors.white,
        fontSize: 24.0,
        fontFamily: "Rubik",
        fontWeight: FontWeight.w500
      ),
    );
}
