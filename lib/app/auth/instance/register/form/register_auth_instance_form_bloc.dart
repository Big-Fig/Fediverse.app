import 'package:fedi/app/captcha/pleroma/pleroma_form_captcha_string_field_bloc.dart';
import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAuthInstanceFormBloc implements IFormBloc {
  static IRegisterAuthInstanceFormBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterAuthInstanceFormBloc>(context, listen: listen);

  Uri get instanceBaseUri;

  bool? get approvalRequired;

  ILocalizationLocaleSingleFromListValueFormFieldBloc get localeFieldBloc;

  IBoolValueFormFieldBloc get agreeTermsOfServiceFieldBloc;

  IStringValueFormFieldBloc get usernameFieldBloc;

  IStringValueFormFieldBloc get emailFieldBloc;

  IStringValueFormFieldBloc get passwordFieldBloc;

  IStringValueFormFieldBloc get confirmPasswordFieldBloc;

  IStringValueFormFieldBloc get reasonFieldBloc;

  IPleromaFormCaptchaStringFieldBloc get captchaFieldBloc;

  PleromaApiAccountPublicRegisterRequest calculateRegisterFormData();
}
