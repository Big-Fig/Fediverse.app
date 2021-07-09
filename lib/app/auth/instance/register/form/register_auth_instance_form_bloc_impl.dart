import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/auth/instance/register/form/register_auth_instance_form_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/account/register_auth_instance_form_account_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/account/register_auth_instance_form_account_stepper_item_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/captcha/register_auth_instance_form_captcha_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/captcha/register_auth_instance_form_captcha_stepper_item_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/manual_approve/register_auth_instance_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/manual_approve/register_auth_instance_form_manual_approve_stepper_item_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/submit/register_auth_instance_form_submit_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/submit/register_auth_instance_form_submit_stepper_item_bloc_impl.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_model.dart';
import 'package:fedi/pleroma/api/captcha/pleroma_api_captcha_service.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';

class RegisterAuthInstanceFormBloc extends FormBloc
    implements IRegisterAuthInstanceFormBloc {
  @override
  // ignore: avoid-late-keyword
  late IRegisterAuthInstanceFormStepperAccountItemBloc accountStepperItemBloc;

  @override
  // ignore: avoid-late-keyword
  IRegisterAuthInstanceFormStepperCaptchaItemBloc? captchaStepperItemBloc;

  @override
  // ignore: avoid-late-keyword
  IRegisterAuthInstanceFormStepperManualApproveItemBloc?
      manualApproveStepperItemBloc;

  @override
  // ignore: avoid-late-keyword
  late IRegisterAuthInstanceFormStepperSubmitItemBloc submitStepperItemBloc;

  final bool manualApprovalRequired;
  final Uri instanceBaseUri;

  RegisterAuthInstanceFormBloc({
    required IPleromaApiInstance pleromaApiInstance,
    required IPleromaApiCaptchaService? pleromaApiCaptchaService,
    required this.instanceBaseUri,
    required this.manualApprovalRequired,
  }) : super(isAllItemsInitialized: false) {
    if (manualApprovalRequired) {
      manualApproveStepperItemBloc =
          RegisterAuthInstanceFormStepperManualApproveItemBloc()
            ..disposeWith(this);
    }

    if (pleromaApiCaptchaService != null && pleromaApiInstance.isPleroma) {
      captchaStepperItemBloc = RegisterAuthInstanceFormStepperCaptchaItemBloc(
        pleromaApiCaptchaService: pleromaApiCaptchaService,
      )..disposeWith(this);
    }

    accountStepperItemBloc = RegisterAuthInstanceFormStepperAccountItemBloc()
      ..disposeWith(this);
    submitStepperItemBloc = RegisterAuthInstanceFormStepperSubmitItemBloc(
      instanceBaseUri: instanceBaseUri,
    )..disposeWith(this);

    onFormItemsChanged();
  }

  @override
  List<IFormItemBloc> get currentItems => [
        if (manualApproveStepperItemBloc != null) manualApproveStepperItemBloc!,
        accountStepperItemBloc,
        if (captchaStepperItemBloc != null) captchaStepperItemBloc!,
        submitStepperItemBloc,
      ];

  @override
  PleromaApiAccountPublicRegisterRequest calculateRegisterFormData() {
    final validUsername = accountStepperItemBloc.usernameFieldBloc.currentValue;
    final validEmail = accountStepperItemBloc.emailFieldBloc.currentValue;
    final validPassword = accountStepperItemBloc.passwordFieldBloc.currentValue;

    final captcha = captchaStepperItemBloc?.captchaFieldBloc.captcha;
    final captchaSolution =
        captchaStepperItemBloc?.captchaFieldBloc.currentValue;
    final agreeTermsOfService =
        submitStepperItemBloc.agreeTermsOfServiceFieldBloc.currentValue;

    // var locale = localeFieldBloc.currentValue;

    final reason = manualApproveStepperItemBloc?.reasonFieldBloc.currentValue;

    var request = PleromaApiAccountPublicRegisterRequest(
      agreement: agreeTermsOfService,
      email: validEmail,
      locale: null,
      // locale: locale?.localeString,
      password: validPassword,
      username: validUsername,
      captchaSolution: captchaSolution,
      captchaAnswerData: captcha?.answerData,
      captchaToken: captcha?.token,
      reason: reason,
    );

    return request;
  }

  @override
  void onRegisterFailed() {
    captchaStepperItemBloc?.reloadCaptcha();
  }
}
