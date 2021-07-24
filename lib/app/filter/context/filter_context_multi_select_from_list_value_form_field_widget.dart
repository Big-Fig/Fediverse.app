import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/mastodon/api/filter/mastodon_api_filter_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
        IMultiSelectFromListValueFormFieldBloc<MastodonApiFilterContextType>>(
      update: (context, value, _) => value,
      child: MultiSelectFromListValueFormFieldBlocProxyProvider<
          MastodonApiFilterContextType>(
        child: MultiSelectFromListValueFormFieldRowWidget(
          label: label,
          description: description,
          descriptionOnDisabled: descriptionOnDisabled,
          valueTitleMapper: mapValueToTitle,
          valueIconMapper: null,
          displayIconInDialog: false,
          displayIconInRow: false, valueKeyMapper: null,
        ),
      ),
    );
  }

  String mapValueToTitle(
    BuildContext context,
    MastodonApiFilterContextType contextType,
  ) {
    switch (contextType) {
      case MastodonApiFilterContextType.homeAndCustomLists:
        return S.of(context).app_filter_context_type_home_and_lists;
      case MastodonApiFilterContextType.notifications:
        return S.of(context).app_filter_context_type_notifications;
      case MastodonApiFilterContextType.public:
        return S.of(context).app_filter_context_type_public;
      case MastodonApiFilterContextType.thread:
        return S.of(context).app_filter_context_type_threads;
      case MastodonApiFilterContextType.account:
        return S.of(context).app_filter_context_type_account;
      case MastodonApiFilterContextType.unknown:
        return S.of(context).app_filter_context_type_unknown;
    }
  }
}
