import 'package:fedi/app/ui/form/fedi_form_switch_row.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

var _logger = Logger("form_field_form_bool_field_row_widget.dart");

class FormFieldFormBoolFieldRowWidget extends StatelessWidget {
  final String label;
  final String desc;
  final FormBoolFieldBloc field;

  FormFieldFormBoolFieldRowWidget(
      {@required this.label, this.desc, @required this.field});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: field.currentValueStream.distinct(),
        initialData: field.currentValue,
        builder: (context, snapshot) {
          var currentValue = snapshot.data;

          _logger.finest(() => "currentValue $currentValue");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FediFormSwitchRow(
                label: label,
                onChanged: field.changeCurrentValue,
                value: currentValue,
              ),
              if (desc != null) Text(desc),
            ],
          );
        });
  }
}
