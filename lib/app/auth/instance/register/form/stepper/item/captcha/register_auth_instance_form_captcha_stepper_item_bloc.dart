import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/register_auth_instance_form_stepper_item_bloc.dart';
import 'package:fedi/app/captcha/pleroma/pleroma_form_captcha_string_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAuthInstanceFormStepperCaptchaItemBloc
    implements IRegisterAuthInstanceFormStepperItemBloc, IDisposable {
  static IRegisterAuthInstanceFormStepperCaptchaItemBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterAuthInstanceFormStepperCaptchaItemBloc>(
        context,
        listen: listen,
      );

  IPleromaFormCaptchaStringFieldBloc get captchaFieldBloc;

  Future reloadCaptcha();
}
