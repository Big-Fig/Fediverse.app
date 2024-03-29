import 'package:fedi_app/app/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi_app/app/status/visibility/form/multi_from_list/status_visibility_multi_select_from_list_form_field_bloc.dart';
import 'package:fedi_app/app/status/visibility/status_visibility_title_widget.dart';
import 'package:fedi_app/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class StatusVisibilityMultiSelectFromListFormFieldWidget
    extends StatelessWidget {
  final String label;
  final String? description;
  final String? descriptionOnDisabled;

  const StatusVisibilityMultiSelectFromListFormFieldWidget({
    Key? key,
    required this.label,
    this.description,
    this.descriptionOnDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IStatusVisibilityMultiSelectFromListFormFieldBloc,
          IMultiSelectFromListValueFormFieldBloc<UnifediApiVisibility>>(
        update: (context, value, _) => value,
        child: MultiSelectFromListValueFormFieldBlocProxyProvider<
            UnifediApiVisibility>(
          child: MultiSelectFromListValueFormFieldRowWidget(
            label: label,
            description: description,
            descriptionOnDisabled: descriptionOnDisabled,
            valueTitleMapper: mapValueToTitle,
            valueIconMapper: null,
            valueKeyMapper: null,
            displayIconInDialog: false,
            displayIconInRow: false,
          ),
        ),
      );

  String mapValueToTitle(
    BuildContext context,
    UnifediApiVisibility visibility,
  ) =>
      StatusVisibilityTitleWidget.mapVisibilityToTitle(
        context,
        visibility,
      );
}
