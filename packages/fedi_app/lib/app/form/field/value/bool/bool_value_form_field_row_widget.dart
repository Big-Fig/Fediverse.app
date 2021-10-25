import 'package:fedi_app/app/ui/form/fedi_form_field_row.dart';
import 'package:fedi_app/app/ui/switch/fedi_switch.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';

class BoolValueFormFieldRowWidget extends StatelessWidget {
  final String label;
  final String? description;
  final String? descriptionOnDisabled;

  const BoolValueFormFieldRowWidget({
    Key? key,
    required this.label,
    this.description,
    this.descriptionOnDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BoolValueFormFieldBlocProxyProvider(
        child: SimpleFediFormFieldRow(
          label: label,
          description: description,
          descriptionOnDisabled: descriptionOnDisabled,
          valueChild: const BoolValueFormFieldRowValueWidget(),
        ),
      );
}

class BoolValueFormFieldRowValueWidget extends StatelessWidget {
  const BoolValueFormFieldRowValueWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IBoolValueFormFieldBloc.of(context);

    return StreamBuilder<bool?>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data ?? false;

        return StreamBuilder<bool?>(
          stream: fieldBloc.currentValueStream,
          initialData: fieldBloc.currentValue,
          builder: (context, snapshot) {
            var currentValue = snapshot.data ?? false;

            return FediSwitch(
              value: currentValue,
              onChanged: (newValue) {
                fieldBloc.changeCurrentValue(newValue);
              },
              enabled: isEnabled,
            );
          },
        );
      },
    );
  }
}
