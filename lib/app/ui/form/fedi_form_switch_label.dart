import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';

class FediFormSwitchLabel extends StatelessWidget {
  final String text;

  FediFormSwitchLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: 16.0, height: 1.5, color: FediColors.mediumGrey),
    );
  }
}
