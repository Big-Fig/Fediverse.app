import 'package:fedi/app/ui/form/fedi_form_field_row.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/form/field/info/info_form_field_bloc.dart';
import 'package:fedi/form/field/info/info_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ValueToTextMapper<T> = String Function(BuildContext context, T value);

class InfoFormFieldRowWidget<T> extends StatelessWidget {
  final String label;
  final String description;
  final ValueToTextMapper<T> valueToTextMapper;

  InfoFormFieldRowWidget({
    @required this.label,
    @required this.description,
    @required this.valueToTextMapper,
  });

  @override
  Widget build(BuildContext context) => InfoFormFieldBlocProxyProvider<T>(
        child: SimpleFediFormFieldRow(
          label: label,
          description: description,
          descriptionOnDisabled: null,
          valueChild: _InfoFormFieldRowValueWidget<T>(
            valueToTextMapper: valueToTextMapper,
          ),
        ),
      );
}

class _InfoFormFieldRowValueWidget<T> extends StatelessWidget {
  const _InfoFormFieldRowValueWidget({
    Key key,
    @required this.valueToTextMapper,
  }) : super(key: key);

  final ValueToTextMapper<T> valueToTextMapper;

  @override
  Widget build(BuildContext context) {
    var infoFormFieldBloc = IInfoFormFieldBloc.of<T>(context);

    var fediUiTextTheme = IFediUiTextTheme.of(context);

    return StreamBuilder<T>(
      stream: infoFormFieldBloc.currentValueStream,
      builder: (context, snapshot) {
        var currentValue = snapshot.data;

        if (currentValue == null) {
          return const SizedBox.shrink();
        } else {
          return Text(
            valueToTextMapper(
              context,
              currentValue,
            ),
            style: fediUiTextTheme.bigTallLightGrey,
          );
        }
      },
    );
  }
}
