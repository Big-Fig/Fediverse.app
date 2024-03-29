import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/register/form/register_access_form_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/account/register_access_form_account_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/account/register_access_form_account_stepper_item_bloc_impl.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/captcha/register_access_form_captcha_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/captcha/register_access_form_captcha_stepper_item_bloc_impl.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/manual_approve/register_access_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/manual_approve/register_access_form_manual_approve_stepper_item_bloc_impl.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/submit/register_access_form_submit_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/submit/register_access_form_submit_stepper_item_bloc_impl.dart';
import 'package:fedi_app/form/form_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RegisterAccessFormBloc extends FormBloc
    implements IRegisterAccessFormBloc {
  @override
  // ignore: avoid-late-keyword
  late IRegisterAccessFormStepperAccountItemBloc accountStepperItemBloc;

  @override
  // ignore: avoid-late-keyword
  IRegisterAccessFormStepperCaptchaItemBloc? captchaStepperItemBloc;

  @override
  // ignore: avoid-late-keyword
  IRegisterAccessFormStepperManualApproveItemBloc? manualApproveStepperItemBloc;

  @override
  // ignore: avoid-late-keyword
  late IRegisterAccessFormStepperSubmitItemBloc submitStepperItemBloc;

  final bool manualApprovalRequired;
  final Uri instanceBaseUri;

  final String localeName;

  RegisterAccessFormBloc({
    required IUnifediApiInstance unifediApiInstance,
    required IUnifediApiInstanceService? unifediApiInstanceService,
    required this.instanceBaseUri,
    required this.localeName,
    required this.manualApprovalRequired,
  }) : super(isAllItemsInitialized: false) {
    if (manualApprovalRequired) {
      manualApproveStepperItemBloc =
          RegisterAccessFormStepperManualApproveItemBloc()..disposeWith(this);
    }

    if (unifediApiInstanceService != null &&
        unifediApiInstance.typeAsUnifediApi.isPleroma) {
      captchaStepperItemBloc = RegisterAccessFormStepperCaptchaItemBloc(
        unifediApiInstanceService: unifediApiInstanceService,
      )..disposeWith(this);
    }

    accountStepperItemBloc = RegisterAccessFormStepperAccountItemBloc()
      ..disposeWith(this);
    submitStepperItemBloc = RegisterAccessFormStepperSubmitItemBloc(
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
