import 'package:fedi/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi/app/ui/form/fedi_form_switch_row.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

var _logger = Logger("form_bool_field_form_row_widget.dart");

class FormBoolFieldFormRowWidget extends StatelessWidget {
  final String label;
  final String desc;
  final IFormBoolFieldBloc field;
  final bool enabled;

  FormBoolFieldFormRowWidget({
    @required this.label,
    this.desc,
    @required this.field,
    this.enabled = true,
  });

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
                value: currentValue == true,
                enabled: enabled,
              ),
              if (desc != null)
                FediFormColumnDesc(desc),
            ],
          );
        });
  }
}
