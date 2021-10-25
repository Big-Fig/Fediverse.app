import 'package:fedi_app/app/access/register/form/stepper/item/account/register_access_form_account_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/captcha/register_access_form_captcha_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/manual_approve/register_access_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/submit/register_access_form_submit_stepper_item_bloc.dart';
import 'package:fedi_app/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IRegisterAccessFormBloc implements IFormBloc {
  static IRegisterAccessFormBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterAccessFormBloc>(context, listen: listen);

  IRegisterAccessFormStepperManualApproveItemBloc?
      get manualApproveStepperItemBloc;

  IRegisterAccessFormStepperAccountItemBloc get accountStepperItemBloc;

  IRegisterAccessFormStepperCaptchaItemBloc? get captchaStepperItemBloc;

  IRegisterAccessFormStepperSubmitItemBloc get submitStepperItemBloc;

  UnifediApiRegisterAccount calculateRegisterFormData();

  void onRegisterFailed();
}
