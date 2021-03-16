import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/form/fedi_ui_theme_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';

class FediUiThemeSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<IFediUiTheme?>
    implements IFediUiThemeSingleFromListValueFormFieldBloc {
  @override
  final List<IFediUiTheme> possibleValues;

  FediUiThemeSingleFromListValueFormFieldBloc({
    bool isNullValuePossible = true,
    required this.possibleValues,
    required IFediUiTheme? originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<IFediUiTheme>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
