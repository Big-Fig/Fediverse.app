import 'package:fedi/app/auth/instance/register/form/stepper/item/account/register_auth_instance_form_account_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/captcha/register_auth_instance_form_captcha_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/manual_approve/register_auth_instance_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/submit/register_auth_instance_form_submit_stepper_item_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAuthInstanceFormBloc implements IFormBloc {
  static IRegisterAuthInstanceFormBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterAuthInstanceFormBloc>(context, listen: listen);

  IRegisterAuthInstanceFormStepperManualApproveItemBloc?
      get manualApproveStepperItemBloc;

  IRegisterAuthInstanceFormStepperAccountItemBloc get accountStepperItemBloc;

  IRegisterAuthInstanceFormStepperCaptchaItemBloc? get captchaStepperItemBloc;

  IRegisterAuthInstanceFormStepperSubmitItemBloc get submitStepperItemBloc;

  UnifediApiAccountPublicRegisterRequest calculateRegisterFormData();

  void onRegisterFailed();
}
