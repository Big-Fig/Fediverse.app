import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/form/captcha/pleroma_form_captcha_string_field_bloc.dart';
import 'package:fedi/form/field/value/string/form_email_string_field_validation.dart';
import 'package:fedi/form/field/value/string/form_length_string_field_validation.dart';
import 'package:fedi/form/field/value/string/form_non_empty_string_field_validation.dart';
import 'package:fedi/form/field/value/string/form_password_match_string_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class JoinAuthInstanceRegisterBloc extends FormBloc
    implements IRegisterAuthInstanceBloc {
  @override
  final FormStringFieldBloc usernameFieldBloc = FormStringFieldBloc(
    originValue: "",
    validators: [FormNonEmptyStringFieldValidationError.createValidator()],
    maxLength: null,
  );

  @override
  final FormStringFieldBloc emailFieldBloc = FormStringFieldBloc(
    originValue: "",
    validators: [FormEmailStringFieldValidationError.createValidator()],
    maxLength: null,
  );

  @override
  final FormStringFieldBloc passwordFieldBloc = FormStringFieldBloc(
      originValue: "",
      validators: [
        FormLengthStringFieldValidationError.createValidator(
            minLength: 4, maxLength: null)
      ],
      maxLength: null);

  @override
  final FormPasswordMatchStringFieldBloc confirmPasswordFieldBloc =
      FormPasswordMatchStringFieldBloc(
    maxLength: null,
  );

  @override
  bool get isCaptchaRequired => captchaFieldBloc != null;

  @override
  final IPleromaFormCaptchaStringFieldBloc captchaFieldBloc;

  @override
  List<IFormStringFieldBloc> get currentItems => [
        usernameFieldBloc,
        emailFieldBloc,
        passwordFieldBloc,
        confirmPasswordFieldBloc,
        if (isCaptchaRequired) captchaFieldBloc,
      ];

  JoinAuthInstanceRegisterBloc({@required this.captchaFieldBloc}) {
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
