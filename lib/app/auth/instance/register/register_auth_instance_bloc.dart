import 'package:fedi/app/captcha/pleroma/pleroma_form_captcha_string_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAuthInstanceBloc implements IFormBloc {
  static IRegisterAuthInstanceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IRegisterAuthInstanceBloc>(context, listen: listen);

  IStringValueFormFieldBloc get usernameFieldBloc;

  IStringValueFormFieldBloc get emailFieldBloc;

  IStringValueFormFieldBloc get passwordFieldBloc;

  IStringValueFormFieldBloc get confirmPasswordFieldBloc;

  bool get isCaptchaRequired;

  IPleromaFormCaptchaStringFieldBloc get captchaFieldBloc;
}
