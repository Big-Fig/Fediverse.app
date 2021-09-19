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
import 'package:unifedi_api/unifedi_api.dart';

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

  final String localeName;

  RegisterAuthInstanceFormBloc({
    required IUnifediApiInstance unifediApiInstance,
    required IUnifediApiInstanceService? unifediApiInstanceService,
    required this.instanceBaseUri,
    required this.localeName,
    required this.manualApprovalRequired,
  }) : super(isAllItemsInitialized: false) {
    if (manualApprovalRequired) {
      manualApproveStepperItemBloc =
          RegisterAuthInstanceFormStepperManualApproveItemBloc()
            ..disposeWith(this);
    }

    if (unifediApiInstanceService != null &&
        unifediApiInstance.typeAsUnifediApi.isPleroma) {
      captchaStepperItemBloc = RegisterAuthInstanceFormStepperCaptchaItemBloc(
        unifediApiInstanceService: unifediApiInstanceService,
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
  UnifediApiRegisterAccount calculateRegisterFormData() {
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

    var request = UnifediApiRegisterAccount(
      agreement: agreeTermsOfService!,
      email: validEmail,
      locale: localeName,
      inviteToken: null,
      // locale: locale?.localeString,
      password: validPassword,
      username: validUsername,
      captchaSolution: captchaSolution,
      captchaAnswerData: captcha?.answerData,
      captchaToken: captcha?.token,
      reason: reason,
      bio: null,
      fullName: null,
    );

    return request;
  }

  @override
  void onRegisterFailed() {
    captchaStepperItemBloc?.reloadCaptcha();
  }
}
