import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/switch/fedi_switch.dart';
import 'package:fedi/app/ui/form/fedi_form_switch_label.dart';
import 'package:flutter/cupertino.dart';

class FediFormSwitchRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  FediFormSwitchRow({
    @required this.label,
    @required this.value,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => FediFormRow(
    child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FediFormSwitchLabel(label),
            FediSwitch(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
  );
}
