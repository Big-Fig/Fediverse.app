import 'package:fedi_app/app/status/visibility/form/single_from_list/status_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/value_form_field_validation.dart';
import 'package:unifedi_api/unifedi_api.dart';

class StatusVisibilitySelectSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<UnifediApiVisibility>
    implements IStatusVisibilitySelectSingleFromListValueFormFieldBloc {
  @override
  final List<UnifediApiVisibility> possibleValues;

  StatusVisibilitySelectSingleFromListValueFormFieldBloc({
    required this.possibleValues,
    required UnifediApiVisibility originValue,
    bool isEnabled = true,
    bool isNullValuePossible = false,
    List<FormValueFieldValidation<UnifediApiVisibility>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
