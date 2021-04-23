import 'package:fedi/app/status/visibility/form/multi_from_list/status_visibility_multi_select_from_list_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_visibility_model.dart';

class StatusVisibilityMultiSelectFromListFormFieldBloc
    extends MultiSelectFromListValueFormFieldBloc<PleromaVisibility>
    implements IStatusVisibilityMultiSelectFromListFormFieldBloc {
  @override
  final List<PleromaVisibility> possibleValues;

  StatusVisibilityMultiSelectFromListFormFieldBloc({
    required List<PleromaVisibility> originValue,
    bool isEnabled = true,
    bool isNullValuePossible = false,
    this.possibleValues = PleromaVisibility.values,
    required
        List<FormValueFieldValidation<List<PleromaVisibility>>> validators,
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          isNullValuePossible: isNullValuePossible,
          validators: validators,
        );


}
