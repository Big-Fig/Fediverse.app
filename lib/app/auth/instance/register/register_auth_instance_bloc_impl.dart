import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/captcha/pleroma/pleroma_form_captcha_string_field_bloc.dart';
import 'package:fedi/form/field/value/string/email/email_string_value_form_field_validation.dart';
import 'package:fedi/form/field/value/string/password_match/password_match_string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_length_validation.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class JoinAuthInstanceRegisterBloc extends FormBloc
    implements IRegisterAuthInstanceBloc {
  @override
  final StringValueFormFieldBloc usernameFieldBloc = StringValueFormFieldBloc(
    originValue: "",
    validators: [StringValueFormFieldNonEmptyValidationError.createValidator()],
    maxLength: null,
  );

  @override
  final StringValueFormFieldBloc emailFieldBloc = StringValueFormFieldBloc(
    originValue: "",
    validators: [EmailStringValueFormFieldValidationError.createValidator()],
    maxLength: null,
  );

  @override
  final StringValueFormFieldBloc passwordFieldBloc = StringValueFormFieldBloc(
      originValue: "",
      validators: [
        StringValueFormFieldLengthValidationError.createValidator(
            minLength: 4, maxLength: null)
      ],
      maxLength: null);

  @override
  final PasswordMatchStringValueFormFieldBloc confirmPasswordFieldBloc =
      PasswordMatchStringValueFormFieldBloc(
    maxLength: null,
  );

  @override
  bool get isCaptchaRequired => captchaFieldBloc != null;

  @override
  final IPleromaFormCaptchaStringFieldBloc captchaFieldBloc;

  @override
  List<IStringValueFormFieldBloc> get currentItems => [
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
