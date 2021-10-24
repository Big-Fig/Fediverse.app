import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/register/form/stepper/item/register_access_form_stepper_item_bloc.dart';
import 'package:fedi/app/captcha/unifedi/unifedi_form_captcha_string_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterUnifediApiAccessFormStepperCaptchaItemBloc
    implements IRegisterUnifediApiAccessFormStepperItemBloc, IDisposable {
  static IRegisterUnifediApiAccessFormStepperCaptchaItemBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterUnifediApiAccessFormStepperCaptchaItemBloc>(
        context,
        listen: listen,
      );

  IUnifediFormCaptchaStringFieldBloc get captchaFieldBloc;

  Future<void> reloadCaptcha();
}
