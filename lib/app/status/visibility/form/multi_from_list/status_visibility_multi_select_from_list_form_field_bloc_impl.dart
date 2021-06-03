import 'package:fedi/app/status/visibility/form/multi_from_list/status_visibility_multi_select_from_list_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';

class StatusVisibilityMultiSelectFromListFormFieldBloc
    extends MultiSelectFromListValueFormFieldBloc<PleromaApiVisibility>
    implements IStatusVisibilityMultiSelectFromListFormFieldBloc {
  @override
  final List<PleromaApiVisibility> possibleValues;

  StatusVisibilityMultiSelectFromListFormFieldBloc({
    required List<PleromaApiVisibility> originValue,
    bool isEnabled = true,
    bool isNullValuePossible = false,
    this.possibleValues = PleromaApiVisibility.values,
    required
        List<FormValueFieldValidation<List<PleromaApiVisibility>>> validators,
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          isNullValuePossible: isNullValuePossible,
          validators: validators,
        );


}
