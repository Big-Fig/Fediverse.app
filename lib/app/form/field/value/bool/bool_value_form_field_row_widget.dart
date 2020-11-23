import 'package:fedi/app/ui/form/fedi_form_field_row.dart';
import 'package:fedi/app/ui/switch/fedi_switch.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';

class BoolValueFormFieldRowWidget extends StatelessWidget {
  final String label;
  final String description;
  final String descriptionOnDisabled;

  BoolValueFormFieldRowWidget({
    @required this.label,
    this.description,
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return BoolValueFormFieldBlocProxyProvider(
      child: SimpleFediFormFieldRow(
        label: label,
        description: description,
        descriptionOnDisabled: descriptionOnDisabled,
        valueChild: const _BoolValueFormFieldRowValueWidget(),
      ),
    );
  }
}

class _BoolValueFormFieldRowValueWidget extends StatelessWidget {
  const _BoolValueFormFieldRowValueWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IBoolValueFormFieldBloc.of(context);

    return StreamBuilder<bool>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data;
        return StreamBuilder<bool>(
          stream: fieldBloc.currentValueStream,
          initialData: fieldBloc.currentValue,
          builder: (context, snapshot) {
            var currentValue = snapshot.data;
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
