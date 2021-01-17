import 'package:fedi/app/auth/instance/register/form/register_auth_instance_form_bloc.dart';
import 'package:fedi/app/captcha/pleroma/pleroma_form_captcha_string_field_bloc.dart';
import 'package:fedi/app/captcha/pleroma/pleroma_form_captcha_string_field_bloc_impl.dart';
import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/localization/locale/supported_localization_locale_list.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/bool/validation/bool_value_form_field_onlyTrue_validation.dart';
import 'package:fedi/form/field/value/string/email/email_string_value_form_field_validation.dart';
import 'package:fedi/form/field/value/string/password_match/password_match_string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_length_validation.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_service.dart';
import 'package:flutter/widgets.dart';

class RegisterAuthInstanceFormBloc extends FormBloc
    implements IRegisterAuthInstanceFormBloc {
  @override
  IPleromaFormCaptchaStringFieldBloc captchaFieldBloc;

  final ILocalizationSettingsBloc localizationSettingsBloc;

  @override
  final Uri instanceBaseUrl;

  @override
  final bool approvalRequired;

  RegisterAuthInstanceFormBloc({
    @required IPleromaCaptchaService pleromaCaptchaService,
    @required this.instanceBaseUrl,
    @required this.approvalRequired,
    @required this.localizationSettingsBloc,
  }) : super(isAllItemsInitialized: false) {
    localeFieldBloc = LocalizationLocaleSingleFromListValueFormFieldBloc(
      originValue: localizationSettingsBloc.localizationLocale,
      isEnabled: true,
      possibleValues: supportedLocalizationLocaleList,
    );

    captchaFieldBloc = PleromaFormCaptchaStringFieldBloc(
      pleromaCaptchaService: pleromaCaptchaService,
      originValue: null,
      validators: [
        StringValueFormFieldNonEmptyValidationError.createValidator()
      ],
    );

    addDisposable(disposable: usernameFieldBloc);
    addDisposable(disposable: emailFieldBloc);
    addDisposable(disposable: passwordFieldBloc);
    addDisposable(disposable: captchaFieldBloc);
    addDisposable(disposable: confirmPasswordFieldBloc);
    addDisposable(disposable: localeFieldBloc);
    addDisposable(disposable: agreeTermsOfServiceFieldBloc);
    addDisposable(disposable: reasonFieldBloc);

    addDisposable(
      streamSubscription: passwordFieldBloc.currentValueStream.listen(
        (currentValue) {
          confirmPasswordFieldBloc.changePasswordValue(currentValue);
        },
      ),
    );
    onFormItemsChanged();
  }

  @override
  final StringValueFormFieldBloc usernameFieldBloc = StringValueFormFieldBloc(
    originValue: "",
    validators: [StringValueFormFieldNonEmptyValidationError.createValidator()],
    maxLength: null,
  );
  @override
  final BoolValueFormFieldBloc agreeTermsOfServiceFieldBloc =
      BoolValueFormFieldBloc(originValue: false, validators: [
    BoolValueFormFieldOnlyTrueValidationError.createValidator()
  ]);

  @override
  LocalizationLocaleSingleFromListValueFormFieldBloc localeFieldBloc;

  @override
  final StringValueFormFieldBloc emailFieldBloc = StringValueFormFieldBloc(
    originValue: "",
    validators: [EmailStringValueFormFieldValidationError.createValidator()],
    maxLength: null,
  );

  @override
  final StringValueFormFieldBloc reasonFieldBloc = StringValueFormFieldBloc(
    originValue: "",
    validators: [],
    maxLength: null,
  );

  @override
  final StringValueFormFieldBloc passwordFieldBloc = StringValueFormFieldBloc(
    originValue: "",
    validators: [
      StringValueFormFieldLengthValidationError.createValidator(
          minLength: 4, maxLength: null)
    ],
    maxLength: null,
  );

  @override
  final PasswordMatchStringValueFormFieldBloc confirmPasswordFieldBloc =
      PasswordMatchStringValueFormFieldBloc(
    maxLength: null,
  );

  @override
  List<IFormItemBloc> get currentItems => [
        usernameFieldBloc,
        emailFieldBloc,
        passwordFieldBloc,
        confirmPasswordFieldBloc,
        agreeTermsOfServiceFieldBloc,
        localeFieldBloc,
        captchaFieldBloc,
        reasonFieldBloc,
      ];

  @override
  PleromaAccountRegisterRequest calculateRegisterFormData() {
    final validUsername = usernameFieldBloc.currentValue;
    final validEmail = emailFieldBloc.currentValue;
    final validPassword = passwordFieldBloc.currentValue;

    final captcha = captchaFieldBloc?.captcha;
    final captchaSolution = captchaFieldBloc?.currentValue;
    final agreeTermsOfService = agreeTermsOfServiceFieldBloc?.currentValue;
    LocalizationLocale locale = localeFieldBloc?.currentValue;

    final reason = reasonFieldBloc.currentValue;

    var request = PleromaAccountRegisterRequest(
      agreement: agreeTermsOfService,
      email: validEmail,
      locale: locale?.localeString,
      password: validPassword,
      username: validUsername,
      captchaSolution: captchaSolution,
      captchaAnswerData: captcha?.answerData,
      captchaToken: captcha?.token,
      reason: approvalRequired ? reason : null,
    );

    return request;
  }
}
