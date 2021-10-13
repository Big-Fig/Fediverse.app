import 'package:fedi/app/access/register/form/register_access_form_bloc.dart';
import 'package:fedi/app/access/register/form/stepper/item/account/register_access_form_account_stepper_item_bloc.dart';
import 'package:fedi/app/access/register/form/stepper/item/account/register_access_from_account_stepper_item_widget.dart';
import 'package:fedi/app/access/register/form/stepper/item/captcha/register_access_form_captcha_stepper_item_bloc.dart';
import 'package:fedi/app/access/register/form/stepper/item/captcha/register_access_form_captcha_stepper_item_widget.dart';
import 'package:fedi/app/access/register/form/stepper/item/manual_approve/register_access_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi/app/access/register/form/stepper/item/manual_approve/register_access_from_manual_approve_stepper_item_widget.dart';
import 'package:fedi/app/access/register/form/stepper/item/register_access_form_stepper_item_bloc.dart';
import 'package:fedi/app/access/register/form/stepper/item/register_access_form_stepper_item_model.dart';
import 'package:fedi/app/access/register/form/stepper/item/submit/register_access_form_submit_stepper_item_bloc.dart';
import 'package:fedi/app/access/register/form/stepper/item/submit/register_access_form_submit_stepper_item_widget.dart';
import 'package:fedi/app/access/register/register_access_bloc.dart';
import 'package:fedi/app/access/register/response/register_response_model.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/stepper/fedi_stepper_bloc.dart';
import 'package:fedi/ui/stepper/fedi_stepper_bloc_impl.dart';
import 'package:fedi/ui/stepper/fedi_stepper_bloc_proxy_provider.dart';
import 'package:fedi/ui/stepper/fedi_stepper_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

typedef RegisterCallback = Function(
  BuildContext context,
  RegisterResponse registerResponse,
);

class RegisterUnifediApiAccessFormStepperWidget extends StatelessWidget {
  final RegisterCallback onRegister;

  const RegisterUnifediApiAccessFormStepperWidget({
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IRegisterUnifediApiAccessFormBloc,
          IFediStepperBloc<IRegisterUnifediApiAccessFormStepperItemBloc>>(
        update: (context, registerUnifediApiAccessFormBloc, _) {
          var steps = <IRegisterUnifediApiAccessFormStepperItemBloc>[
            if (registerUnifediApiAccessFormBloc.manualApproveStepperItemBloc !=
                null)
              registerUnifediApiAccessFormBloc.manualApproveStepperItemBloc!,
            registerUnifediApiAccessFormBloc.accountStepperItemBloc,
            if (registerUnifediApiAccessFormBloc.captchaStepperItemBloc != null)
              registerUnifediApiAccessFormBloc.captchaStepperItemBloc!,
            registerUnifediApiAccessFormBloc.submitStepperItemBloc,
          ];

          return FediStepperBloc<IRegisterUnifediApiAccessFormStepperItemBloc>(
            steps: steps,
            submitCallback: () async {
              var dialogResult = await PleromaAsyncOperationHelper
                  .performPleromaAsyncOperation(
                context: context,
                asyncCode: () =>
                    IRegisterUnifediApiAccessBloc.of(context, listen: false)
                        .register(),
              );
              var registrationResponse = dialogResult.result;
              if (registrationResponse != null) {
                onRegister(context, registrationResponse);
              }
            },
          );
        },
        child: FediStepperBlocProxyProvider(
          child:
              FediStepperWidget<IRegisterUnifediApiAccessFormStepperItemBloc>(
            titleBuilder: (
              BuildContext context,
              IRegisterUnifediApiAccessFormStepperItemBloc stepperItem,
            ) =>
                Provider<IRegisterUnifediApiAccessFormStepperItemBloc>.value(
              value: stepperItem,
              child: const _RegisterUnifediApiAccessFormStepperTitleWidget(),
            ),
            contentBuilder: (
              BuildContext context,
              IRegisterUnifediApiAccessFormStepperItemBloc stepperItem,
            ) =>
                Provider<IRegisterUnifediApiAccessFormStepperItemBloc>.value(
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
        Provider.of<IRegisterUnifediApiAccessFormStepperItemBloc>(context);

    var type = registerUnifediApiAccessFormStepperItemBloc.type;

    switch (type) {
      case RegisterUnifediApiAccessFormStepperItemType.manualApprove:
        text =
            S.of(context).app_auth_instance_register_step_manualApprove_title;
        break;
      case RegisterUnifediApiAccessFormStepperItemType.account:
        text = S.of(context).app_auth_instance_register_step_account_title;
        break;
      case RegisterUnifediApiAccessFormStepperItemType.captcha:
        text = S.of(context).app_auth_instance_register_step_captcha_title;
        break;
      case RegisterUnifediApiAccessFormStepperItemType.submit:
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
        Provider.of<IRegisterUnifediApiAccessFormStepperItemBloc>(context);

    var type = registerUnifediApiAccessFormStepperItemBloc.type;

    Widget child;

    switch (type) {
      case RegisterUnifediApiAccessFormStepperItemType.manualApprove:
        child = Provider<
            IRegisterUnifediApiAccessFormStepperManualApproveItemBloc>.value(
          value: registerUnifediApiAccessFormStepperItemBloc
              as IRegisterUnifediApiAccessFormStepperManualApproveItemBloc,
          child: RegisterUnifediApiAccessFormStepperManualApproveItemWidget(),
        );
        break;
      case RegisterUnifediApiAccessFormStepperItemType.account:
        child =
            Provider<IRegisterUnifediApiAccessFormStepperAccountItemBloc>.value(
          value: registerUnifediApiAccessFormStepperItemBloc
              as IRegisterUnifediApiAccessFormStepperAccountItemBloc,
          child: RegisterUnifediApiAccessFormStepperAccountItemWidget(),
        );
        break;
      case RegisterUnifediApiAccessFormStepperItemType.captcha:
        child =
            Provider<IRegisterUnifediApiAccessFormStepperCaptchaItemBloc>.value(
          value: registerUnifediApiAccessFormStepperItemBloc
              as IRegisterUnifediApiAccessFormStepperCaptchaItemBloc,
          child: RegisterUnifediApiAccessFormStepperCaptchaItemWidget(),
        );
        break;
      case RegisterUnifediApiAccessFormStepperItemType.submit:
        child =
            Provider<IRegisterUnifediApiAccessFormStepperSubmitItemBloc>.value(
          value: registerUnifediApiAccessFormStepperItemBloc
              as IRegisterUnifediApiAccessFormStepperSubmitItemBloc,
          child: RegisterUnifediApiAccessFormStepperSubmitItemWidget(),
        );
        break;
    }

    return child;
  }
}
