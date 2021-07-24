import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/mastodon/api/filter/mastodon_api_filter_model.dart';

class FilterContextMultiSelectFromListValueFormFieldBloc
    extends MultiSelectFromListValueFormFieldBloc<MastodonApiFilterContextType>
    implements IFilterContextMultiSelectFromListValueFormFieldBloc {
  final AuthInstance? currentInstance;

  @override
  List<MastodonApiFilterContextType> get possibleValues {
    if (currentInstance!.isMastodon) {
      return [
        MastodonApiFilterContextType.homeAndCustomLists,
        MastodonApiFilterContextType.notifications,
        MastodonApiFilterContextType.public,
        MastodonApiFilterContextType.thread,
        MastodonApiFilterContextType.account,
      ];
    } else {
      return [
        MastodonApiFilterContextType.homeAndCustomLists,
        MastodonApiFilterContextType.notifications,
        MastodonApiFilterContextType.public,
        MastodonApiFilterContextType.thread,
      ];
    }
  }

  FilterContextMultiSelectFromListValueFormFieldBloc({
    required this.currentInstance,
    required List<MastodonApiFilterContextType> originValue,
    bool isEnabled = true,
    bool isNullValuePossible = false,
    required List<FormValueFieldValidation<List<MastodonApiFilterContextType>>>
        validators,
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          isNullValuePossible: isNullValuePossible,
          validators: validators,
        );
}
