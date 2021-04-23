import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/mastodon/api/filter/mastodon_filter_model.dart';

class FilterContextMultiSelectFromListValueFormFieldBloc
    extends MultiSelectFromListValueFormFieldBloc<MastodonFilterContextType>
    implements IFilterContextMultiSelectFromListValueFormFieldBloc {

  final AuthInstance? currentInstance;

  @override
  List<MastodonFilterContextType> get possibleValues {

    if(currentInstance!.isMastodon) {
      return [
        MastodonFilterContextType.homeAndCustomLists,
        MastodonFilterContextType.notifications,
        MastodonFilterContextType.public,
        MastodonFilterContextType.thread,
        MastodonFilterContextType.account,
      ];
    } else {
      return [
        MastodonFilterContextType.homeAndCustomLists,
        MastodonFilterContextType.notifications,
        MastodonFilterContextType.public,
        MastodonFilterContextType.thread,
      ];
    }

  }

  FilterContextMultiSelectFromListValueFormFieldBloc({
    required this.currentInstance,
    required List<MastodonFilterContextType> originValue,
    bool isEnabled = true,
    bool isNullValuePossible = false,
    required
        List<FormValueFieldValidation<List<MastodonFilterContextType>>>
            validators,
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          isNullValuePossible: isNullValuePossible,
          validators: validators,
        );
}
