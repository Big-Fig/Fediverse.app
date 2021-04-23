import 'package:fedi/form/field/value/string/password_match/password_match_string_value_form_field_validation.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';

class PasswordMatchStringValueFormFieldBloc extends StringValueFormFieldBloc {
  String? passwordValue;

  void changePasswordValue(String? passwordValue) {
    this.passwordValue = passwordValue;
    revalidate();
  }

  // override for dynamic validator replacing
  @override
  List<FormValueFieldValidation<String>> get validators => [
        (currentValue) {
          if (currentValue == passwordValue) {
            return null;
          } else {
            return PasswordMatchStringValueFormFieldValidationError();
          }
        },
      ];

  PasswordMatchStringValueFormFieldBloc({
    required int? maxLength,
  }) : super(
          originValue: "",
          validators: [],
          maxLength: maxLength,
        );
}
