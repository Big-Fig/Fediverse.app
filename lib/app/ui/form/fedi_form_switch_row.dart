import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/switch/fedi_switch.dart';
import 'package:fedi/app/ui/form/fedi_form_row_label.dart';
import 'package:flutter/cupertino.dart';

class FediFormSwitchRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool enabled;

  FediFormSwitchRow({
    @required this.label,
    @required this.value,
    @required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => FediFormRow(
    child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FediFormRowLabel(label),
            FediSwitch(
              value: value,
              onChanged: onChanged,
              enabled: enabled,
            ),
          ],
        ),
  );
}
