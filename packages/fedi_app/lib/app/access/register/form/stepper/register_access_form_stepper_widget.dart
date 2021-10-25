import 'dart:async';

import 'package:fedi_app/app/access/register/form/register_access_form_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/account/register_access_form_account_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/account/register_access_from_account_stepper_item_widget.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/captcha/register_access_form_captcha_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/captcha/register_access_form_captcha_stepper_item_widget.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/manual_approve/register_access_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/manual_approve/register_access_from_manual_approve_stepper_item_widget.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_model.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/submit/register_access_form_submit_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/submit/register_access_form_submit_stepper_item_widget.dart';
import 'package:fedi_app/app/access/register/register_access_bloc.dart';
import 'package:fedi_app/app/access/register/response/register_access_response_model.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/ui/stepper/fedi_stepper_bloc.dart';
import 'package:fedi_app/ui/stepper/fedi_stepper_bloc_impl.dart';
import 'package:fedi_app/ui/stepper/fedi_stepper_bloc_proxy_provider.dart';
import 'package:fedi_app/ui/stepper/fedi_stepper_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

typedef RegisterAccessCallback = FutureOr<void> Function(
  BuildContext context,
  RegisterAccessResponse registerResponse,
);

class RegisterAccessFormStepperWidget extends StatelessWidget {
  final RegisterAccessCallback onRegister;

  const RegisterAccessFormStepperWidget({
    Key? key,
    required this.onRegister,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<IRegisterAccessFormBloc,
          IFediStepperBloc<IRegisterAccessFormStepperItemBloc>>(
        update: (context, registerUnifediApiAccessFormBloc, _) {
          var steps = <IRegisterAccessFormStepperItemBloc>[
            if (registerUnifediApiAccessFormBloc.manualApproveStepperItemBloc !=
                null)
              registerUnifediApiAccessFormBloc.manualApproveStepperItemBloc!,
            registerUnifediApiAccessFormBloc.accountStepperItemBloc,
            if (registerUnifediApiAccessFormBloc.captchaStepperItemBloc != null)
              registerUnifediApiAccessFormBloc.captchaStepperItemBloc!,
            registerUnifediApiAccessFormBloc.submitStepperItemBloc,
          ];

          return FediStepperBloc<IRegisterAccessFormStepperItemBloc>(
            steps: steps,
            submitCallback: () async {
              var dialogResult = await UnifediAsyncOperationHelper
                  .performUnifediAsyncOperation(
                context: context,
                asyncCode: () =>
                    IRegisterAccessBloc.of(context, listen: false).register(),
              );
              var registrationResponse = dialogResult.result;
              if (registrationResponse != null) {
                onRegister(context, registrationResponse);
              }
            },
          );
        },
        child: FediStepperBlocProxyProvider(
          child: FediStepperWidget<IRegisterAccessFormStepperItemBloc>(
            titleBuilder: (
              BuildContext context,
              IRegisterAccessFormStepperItemBloc stepperItem,
            ) =>
                Provider<IRegisterAccessFormStepperItemBloc>.value(
              value: stepperItem,
              child: const _RegisterUnifediApiAccessFormStepperTitleWidget(),
            ),
            contentBuilder: (
              BuildContext context,
              IRegisterAccessFormStepperItemBloc stepperItem,
            ) =>
                Provider<IRegisterAccessFormStepperItemBloc>.value(
              value: stepperItem,
              child: const _RegisterUnifediApiAccessFormStepperContentWidget(),
            ),
          ),
        ),
      );
}

class _RegisterUnifediApiAccessFormStepperTitleWidget extends StatelessWidget {
  const _RegisterUnifediApiAccessFormStepperTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text;

    var registerUnifediApiAccessFormStepperItemBloc =
        Provider.of<IRegisterAccessFormStepperItemBloc>(context);

    var type = registerUnifediApiAccessFormStepperItemBloc.type;

    switch (type) {
      case RegisterAccessFormStepperItemType.manualApprove:
        text =
            S.of(context).app_auth_instance_register_step_manualApprove_title;
        break;
      case RegisterAccessFormStepperItemType.account:
        text = S.of(context).app_auth_instance_register_step_account_title;
        break;
      case RegisterAccessFormStepperItemType.captcha:
        text = S.of(context).app_auth_instance_register_step_captcha_title;
        break;
      case RegisterAccessFormStepperItemType.submit:
        text = S.of(context).app_auth_instance_register_step_submit_title;
        break;
    }

    return Text(
      text,
      style: IFediUiTextTheme.of(context).bigTallDarkGrey,
    );
  }
}

class _RegisterUnifediApiAccessFormStepperContentWidget
    extends StatelessWidget {
  const _RegisterUnifediApiAccessFormStepperContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerUnifediApiAccessFormStepperItemBloc =
        Provider.of<IRegisterAccessFormStepperItemBloc>(context);

    var type = registerUnifediApiAccessFormStepperItemBloc.type;

    Widget child;

    switch (type) {
      case RegisterAccessFormStepperItemType.manualApprove:
        child = Provider<IRegisterAccessFormStepperManualApproveItemBloc>.value(
          value: registerUnifediApiAccessFormStepperItemBloc
              as IRegisterAccessFormStepperManualApproveItemBloc,
          child: const RegisterAccessFormStepperManualApproveItemWidget(),
        );
        break;
      case RegisterAccessFormStepperItemType.account:
        child = Provider<IRegisterAccessFormStepperAccountItemBloc>.value(
          value: registerUnifediApiAccessFormStepperItemBloc
              as IRegisterAccessFormStepperAccountItemBloc,
          child: const RegisterAccessFormStepperAccountItemWidget(),
        );
        break;
      case RegisterAccessFormStepperItemType.captcha:
        child = Provider<IRegisterAccessFormStepperCaptchaItemBloc>.value(
          value: registerUnifediApiAccessFormStepperItemBloc
              as IRegisterAccessFormStepperCaptchaItemBloc,
          child: const RegisterAccessFormStepperCaptchaItemWidget(),
        );
        break;
      case RegisterAccessFormStepperItemType.submit:
        child = Provider<IRegisterAccessFormStepperSubmitItemBloc>.value(
          value: registerUnifediApiAccessFormStepperItemBloc
              as IRegisterAccessFormStepperSubmitItemBloc,
          child: const RegisterAccessFormStepperSubmitItemWidget(),
        );
        break;
    }

    return child;
  }
}
