import 'package:fedi/app/ui/settings/font_size/form/ui_settings_font_size_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';

class UiSettingsFontSizeSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<UiSettingsFontSize?>
    implements IUiSettingsFontSizeSingleFromListValueFormFieldBloc {
  @override
  final List<UiSettingsFontSize> possibleValues;

  UiSettingsFontSizeSingleFromListValueFormFieldBloc({
    bool isNullValuePossible = false,
    this.possibleValues = UiSettingsFontSize.values,
    required UiSettingsFontSize originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<UiSettingsFontSize>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );

  @override
  UiSettingsFontSize get defaultValue =>
      IUiSettingsFontSizeSingleFromListValueFormFieldBloc.defaultValue;
}
