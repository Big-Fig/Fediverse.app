import 'package:fedi_app/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/value_form_field_validation.dart';
import 'package:unifedi_api/unifedi_api.dart';

class FilterContextMultiSelectFromListValueFormFieldBloc
    extends MultiSelectFromListValueFormFieldBloc<UnifediApiFilterContextType>
    implements IFilterContextMultiSelectFromListValueFormFieldBloc {
  final UnifediApiAccess? currentInstance;

  @override
  List<UnifediApiFilterContextType> get possibleValues {
    if (currentInstance!.instance!.typeAsUnifediApi.isMastodon) {
      return [
        UnifediApiFilterContextType.homeValue,
        UnifediApiFilterContextType.notificationsValue,
        UnifediApiFilterContextType.publicValue,
        UnifediApiFilterContextType.threadValue,
        UnifediApiFilterContextType.accountValue,
      ];
    } else {
      return [
        UnifediApiFilterContextType.homeValue,
        UnifediApiFilterContextType.notificationsValue,
        UnifediApiFilterContextType.publicValue,
        UnifediApiFilterContextType.threadValue,
      ];
    }
  }

  FilterContextMultiSelectFromListValueFormFieldBloc({
    required this.currentInstance,
    required List<UnifediApiFilterContextType> originValue,
    bool isEnabled = true,
    bool isNullValuePossible = false,
    required List<FormValueFieldValidation<List<UnifediApiFilterContextType>>>
        validators,
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          isNullValuePossible: isNullValuePossible,
          validators: validators,
        );
}
