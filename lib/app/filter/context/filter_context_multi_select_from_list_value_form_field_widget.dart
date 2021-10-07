import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class FilterContextMultiSelectFromListValueFormFieldWidget
    extends StatelessWidget {
  final String label;
  final String? description;
  final String? descriptionOnDisabled;

  const FilterContextMultiSelectFromListValueFormFieldWidget({
    required this.label,
    this.description,
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IFilterContextMultiSelectFromListValueFormFieldBloc,
        IMultiSelectFromListValueFormFieldBloc<UnifediApiFilterContextType>>(
      update: (context, value, _) => value,
      child: MultiSelectFromListValueFormFieldBlocProxyProvider<
          UnifediApiFilterContextType>(
        child: MultiSelectFromListValueFormFieldRowWidget(
          label: label,
          description: description,
          descriptionOnDisabled: descriptionOnDisabled,
          valueTitleMapper: mapValueToTitle,
          valueIconMapper: null,
          displayIconInDialog: false,
          displayIconInRow: false,
          valueKeyMapper: null,
        ),
      ),
    );
  }

  String mapValueToTitle(
    BuildContext context,
    UnifediApiFilterContextType contextType,
  ) {
    return contextType.map(
      home: (_) => S.of(context).app_filter_context_type_home_and_lists,
      notifications: (_) => S.of(context).app_filter_context_type_notifications,
      public: (_) => S.of(context).app_filter_context_type_public,
      thread: (_) => S.of(context).app_filter_context_type_threads,
      account: (_) => S.of(context).app_filter_context_type_account,
      unknown: (_) => S.of(context).app_filter_context_type_unknown,
    );
  }
}
