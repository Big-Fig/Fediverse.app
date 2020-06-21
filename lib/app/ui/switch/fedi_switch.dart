import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/ui/switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';

class FediSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  FediSwitch({
    @required this.value,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => CustomSwitch(
        value: value,
        width: 43.0,
        height: 19.0,
        indicatorSize: 11.0,
        backgroundBorderRadius: 19.0,
        indicatorPadding: EdgeInsets.all(4.0),
        indicatorActiveColor: FediColors.primaryColor,
        indicatorInactiveColor: FediColors.lightGrey,

        onChanged: onChanged,
      );
}
