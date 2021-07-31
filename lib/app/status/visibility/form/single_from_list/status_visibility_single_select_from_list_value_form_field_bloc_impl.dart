import 'package:fedi/app/status/visibility/form/single_from_list/status_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class StatusVisibilitySelectSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<PleromaApiVisibility>
    implements IStatusVisibilitySelectSingleFromListValueFormFieldBloc {
  @override
  final List<PleromaApiVisibility> possibleValues;

  StatusVisibilitySelectSingleFromListValueFormFieldBloc({
    required this.possibleValues,
    required PleromaApiVisibility originValue,
    bool isEnabled = true,
    bool isNullValuePossible = false,
    List<FormValueFieldValidation<PleromaApiVisibility>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
