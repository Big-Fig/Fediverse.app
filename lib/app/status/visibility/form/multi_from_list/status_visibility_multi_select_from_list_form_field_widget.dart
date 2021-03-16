import 'package:fedi/app/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/status/visibility/form/multi_from_list/status_visibility_multi_select_from_list_form_field_bloc.dart';
import 'package:fedi/app/status/visibility/status_visibility_title_widget.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusVisibilityMultiSelectFromListFormFieldWidget
    extends StatelessWidget {
  final String label;
  final String? description;
  final String? descriptionOnDisabled;

  const StatusVisibilityMultiSelectFromListFormFieldWidget({
    required this.label,
    this.description,
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<IStatusVisibilityMultiSelectFromListFormFieldBloc,
        IMultiSelectFromListValueFormFieldBloc<PleromaVisibility>>(
      update: (context, value, _) => value,
      child:
          MultiSelectFromListValueFormFieldBlocProxyProvider<PleromaVisibility>(
        child: MultiSelectFromListValueFormFieldRowWidget(
          label: label,
          description: description,
          descriptionOnDisabled: descriptionOnDisabled,
          valueTitleMapper: mapValueToTitle,
          valueIconMapper: null,
          displayIconInDialog: false,
          displayIconInRow: false,
        ),
      ),
    );

  String mapValueToTitle(
    BuildContext context,
    PleromaVisibility visibility,
  ) =>
      StatusVisibilityTitleWidget.mapVisibilityToTitle(
        context,
        visibility,
      );
}
