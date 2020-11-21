import 'package:fedi/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi/app/ui/form/fedi_form_switch_row.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/cupertino.dart';

class FormBoolFieldFormRowWidget extends StatelessWidget {
  final String label;
  final String description;
  final IBoolValueFormFieldBloc field;
  final bool enabled;

  FormBoolFieldFormRowWidget({
    @required this.label,
    this.description,
    @required this.field,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder<bool>(
        stream: field.currentValueStream.distinct(),
        initialData: field.currentValue,
        builder: (context, snapshot) {
          var currentValue = snapshot.data;

          // _logger.finest(() => "currentValue $currentValue");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FediFormSwitchRow(
                label: label,
                onChanged: field.changeCurrentValue,
                value: currentValue == true,
                enabled: enabled,
              ),
              if (description != null) FediFormColumnDesc(description),
            ],
          );
        },
      );
}
