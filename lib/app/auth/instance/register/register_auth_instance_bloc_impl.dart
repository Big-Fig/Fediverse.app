import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/ui/form/form_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_password_match_string_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_email_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_length_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_non_empty_string_field_validation.dart';

class JoinAuthInstanceRegisterBloc extends FormBloc
    implements IRegisterAuthInstanceBloc {
  @override
  final FormStringFieldBloc usernameFieldBloc = FormStringFieldBloc(
      originValue: "",
      validators: [NonEmptyStringFieldValidationError.createValidator()]);

  @override
  final FormStringFieldBloc emailFieldBloc = FormStringFieldBloc(
      originValue: "",
      validators: [FormEmailStringFieldValidationError.createValidator()]);

  @override
  final FormStringFieldBloc passwordFieldBloc =
      FormStringFieldBloc(originValue: "", validators: [
    FormLengthStringFieldValidationError.createValidator(
        minLength: 4, maxLength: null)
  ]);

  @override
  final FormPasswordMatchStringFieldBloc confirmPasswordFieldBloc =
      FormPasswordMatchStringFieldBloc();

  @override
  List<FormStringFieldBloc> get items => [
        usernameFieldBloc,
        emailFieldBloc,
        passwordFieldBloc,
        confirmPasswordFieldBloc,
      ];

  JoinAuthInstanceRegisterBloc() {
    addDisposable(disposable: usernameFieldBloc);
    addDisposable(disposable: emailFieldBloc);
    addDisposable(disposable: passwordFieldBloc);
    addDisposable(disposable: confirmPasswordFieldBloc);
    addDisposable(streamSubscription:
        passwordFieldBloc.currentValueStream.listen((currentValue) {
      confirmPasswordFieldBloc.changePasswordValue(currentValue);
    }));
  }
}
