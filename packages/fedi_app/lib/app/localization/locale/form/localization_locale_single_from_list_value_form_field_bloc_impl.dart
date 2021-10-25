import 'package:fedi_app/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/value_form_field_validation.dart';
import 'package:fedi_app/localization/localization_model.dart';

class LocalizationLocaleSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<LocalizationLocale?>
    implements ILocalizationLocaleSingleFromListValueFormFieldBloc {
  @override
  final List<LocalizationLocale> possibleValues;

  LocalizationLocaleSingleFromListValueFormFieldBloc({
    bool isNullValuePossible = true,
    required this.possibleValues,
    required LocalizationLocale? originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<LocalizationLocale>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
