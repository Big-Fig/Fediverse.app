import 'package:fedi/app/form/captcha/pleroma_form_captcha_string_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAuthInstanceBloc implements IFormBloc {
  static IRegisterAuthInstanceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IRegisterAuthInstanceBloc>(context, listen: listen);

  IFormStringFieldBloc get usernameFieldBloc;

  IFormStringFieldBloc get emailFieldBloc;

  IFormStringFieldBloc get passwordFieldBloc;

  IFormStringFieldBloc get confirmPasswordFieldBloc;

  bool get isCaptchaRequired;

  IPleromaFormCaptchaStringFieldBloc get captchaFieldBloc;
}
