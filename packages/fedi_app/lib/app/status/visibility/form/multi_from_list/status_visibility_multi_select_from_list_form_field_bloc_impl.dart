import 'package:fedi_app/app/status/visibility/form/multi_from_list/status_visibility_multi_select_from_list_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/value_form_field_validation.dart';
import 'package:unifedi_api/unifedi_api.dart';

class StatusVisibilityMultiSelectFromListFormFieldBloc
    extends MultiSelectFromListValueFormFieldBloc<UnifediApiVisibility>
    implements IStatusVisibilityMultiSelectFromListFormFieldBloc {
  @override
  final List<UnifediApiVisibility> possibleValues;

  StatusVisibilityMultiSelectFromListFormFieldBloc({
    required List<UnifediApiVisibility> originValue,
    bool isEnabled = true,
    bool isNullValuePossible = false,
    this.possibleValues = UnifediApiVisibility.values,
    required List<FormValueFieldValidation<List<UnifediApiVisibility>>>
        validators,
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          isNullValuePossible: isNullValuePossible,
          validators: validators,
        );
}
