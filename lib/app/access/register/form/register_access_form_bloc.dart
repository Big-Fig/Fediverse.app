import 'package:fedi/app/access/register/form/stepper/item/account/register_access_form_account_stepper_item_bloc.dart';
import 'package:fedi/app/access/register/form/stepper/item/captcha/register_access_form_captcha_stepper_item_bloc.dart';
import 'package:fedi/app/access/register/form/stepper/item/manual_approve/register_access_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi/app/access/register/form/stepper/item/submit/register_access_form_submit_stepper_item_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IRegisterUnifediApiAccessFormBloc implements IFormBloc {
  static IRegisterUnifediApiAccessFormBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterUnifediApiAccessFormBloc>(context, listen: listen);

  IRegisterUnifediApiAccessFormStepperManualApproveItemBloc?
      get manualApproveStepperItemBloc;

  IRegisterUnifediApiAccessFormStepperAccountItemBloc
      get accountStepperItemBloc;

  IRegisterUnifediApiAccessFormStepperCaptchaItemBloc?
      get captchaStepperItemBloc;

  IRegisterUnifediApiAccessFormStepperSubmitItemBloc get submitStepperItemBloc;

  UnifediApiRegisterAccount calculateRegisterFormData();

  void onRegisterFailed();
}
