import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_password_match_string_field_validation.dart';

class FormPasswordMatchStringFieldBloc extends FormStringFieldBloc {
  String passwordValue;

  void changePasswordValue(String passwordValue) {
    this.passwordValue = passwordValue;
    revalidate();
  }

  // override for dynamic validator replacing
  @override
  List<FormValueFieldValidation<String>> get validators  => [
        (currentValue) {
      if (currentValue == passwordValue) {
        return null;
      } else {
        return FormPasswordMatchStringFieldValidation();
      }
    }
  ];

  FormPasswordMatchStringFieldBloc()
      : super(
      originValue: null,
      validators: null);
}