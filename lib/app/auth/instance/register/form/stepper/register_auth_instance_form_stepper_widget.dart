import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/instance/register/form/register_auth_instance_form_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/account/register_auth_instance_form_account_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/account/register_auth_instance_from_account_stepper_item_widget.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/captcha/register_auth_instance_form_captcha_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/captcha/register_auth_instance_form_captcha_stepper_item_widget.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/manual_approve/register_auth_instance_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/manual_approve/register_auth_instance_from_manual_approve_stepper_item_widget.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/register_auth_instance_form_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/register_auth_instance_form_stepper_item_model.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/submit/register_auth_instance_form_submit_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/submit/register_auth_instance_form_submit_stepper_item_widget.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/stepper/fedi_stepper_bloc.dart';
import 'package:fedi/ui/stepper/fedi_stepper_bloc_impl.dart';
import 'package:fedi/ui/stepper/fedi_stepper_bloc_proxy_provider.dart';
import 'package:fedi/ui/stepper/fedi_stepper_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RegisterAuthInstanceFormStepperWidget extends StatelessWidget {
  const RegisterAuthInstanceFormStepperWidget();

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IRegisterAuthInstanceFormBloc,
        IFediStepperBloc<IRegisterAuthInstanceFormStepperItemBloc>>(
      update: (context, registerAuthInstanceFormBloc, _) {
        var steps = <IRegisterAuthInstanceFormStepperItemBloc>[
          if (registerAuthInstanceFormBloc.manualApproveStepperItemBloc != null)
            registerAuthInstanceFormBloc.manualApproveStepperItemBloc!,
          registerAuthInstanceFormBloc.accountStepperItemBloc,
          if (registerAuthInstanceFormBloc.captchaStepperItemBloc != null)
            registerAuthInstanceFormBloc.captchaStepperItemBloc!,
          registerAuthInstanceFormBloc.submitStepperItemBloc,
        ];

        return FediStepperBloc<IRegisterAuthInstanceFormStepperItemBloc>(
          steps: steps,
          submitCallback: () =>
              PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context,
            asyncCode: () =>
                IRegisterAuthInstanceBloc.of(context, listen: false).submit(),
          ),
        );
      },
      child: FediStepperBlocProxyProvider(
        child: FediStepperWidget<IRegisterAuthInstanceFormStepperItemBloc>(
          titleBuilder: (
            BuildContext context,
            IRegisterAuthInstanceFormStepperItemBloc stepperItem,
          ) =>
              Provider<IRegisterAuthInstanceFormStepperItemBloc>.value(
            value: stepperItem,
            child: const _RegisterAuthInstanceFormStepperTitleWidget(),
          ),
          contentBuilder: (
            BuildContext context,
            IRegisterAuthInstanceFormStepperItemBloc stepperItem,
          ) =>
              Provider<IRegisterAuthInstanceFormStepperItemBloc>.value(
            value: stepperItem,
            child: const _RegisterAuthInstanceFormStepperContentWidget(),
          ),
        ),
      ),
    );
  }
}

class _RegisterAuthInstanceFormStepperTitleWidget extends StatelessWidget {
  const _RegisterAuthInstanceFormStepperTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text;

    var registerAuthInstanceFormStepperItemBloc =
        Provider.of<IRegisterAuthInstanceFormStepperItemBloc>(context);

    var type = registerAuthInstanceFormStepperItemBloc.type;

    switch (type) {
      case RegisterAuthInstanceFormStepperItemType.manualApprove:
        text =
            S.of(context).app_auth_instance_register_step_manualApprove_title;
        break;
      case RegisterAuthInstanceFormStepperItemType.account:
        text = S.of(context).app_auth_instance_register_step_account_title;
        break;
      case RegisterAuthInstanceFormStepperItemType.captcha:
        text = S.of(context).app_auth_instance_register_step_captcha_title;
        break;
      case RegisterAuthInstanceFormStepperItemType.submit:
        text = S.of(context).app_auth_instance_register_step_submit_title;
        break;
    }

    return Text(
      text,
      style: IFediUiTextTheme.of(context).bigTallDarkGrey,
    );
  }
}

class _RegisterAuthInstanceFormStepperContentWidget extends StatelessWidget {
  const _RegisterAuthInstanceFormStepperContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerAuthInstanceFormStepperItemBloc =
        Provider.of<IRegisterAuthInstanceFormStepperItemBloc>(context);

    var type = registerAuthInstanceFormStepperItemBloc.type;

    Widget child;

    switch (type) {
      case RegisterAuthInstanceFormStepperItemType.manualApprove:
        child = Provider<
            IRegisterAuthInstanceFormStepperManualApproveItemBloc>.value(
          value: registerAuthInstanceFormStepperItemBloc
              as IRegisterAuthInstanceFormStepperManualApproveItemBloc,
          child: RegisterAuthInstanceFormStepperManualApproveItemWidget(),
        );
        break;
      case RegisterAuthInstanceFormStepperItemType.account:
        child = Provider<IRegisterAuthInstanceFormStepperAccountItemBloc>.value(
          value: registerAuthInstanceFormStepperItemBloc
              as IRegisterAuthInstanceFormStepperAccountItemBloc,
          child: RegisterAuthInstanceFormStepperAccountItemWidget(),
        );
        break;
      case RegisterAuthInstanceFormStepperItemType.captcha:
        child = Provider<IRegisterAuthInstanceFormStepperCaptchaItemBloc>.value(
          value: registerAuthInstanceFormStepperItemBloc
              as IRegisterAuthInstanceFormStepperCaptchaItemBloc,
          child: RegisterAuthInstanceFormStepperCaptchaItemWidget(),
        );
        break;
      case RegisterAuthInstanceFormStepperItemType.submit:
        child = Provider<IRegisterAuthInstanceFormStepperSubmitItemBloc>.value(
          value: registerAuthInstanceFormStepperItemBloc
              as IRegisterAuthInstanceFormStepperSubmitItemBloc,
          child: RegisterAuthInstanceFormStepperSubmitItemWidget(),
        );
        break;
    }

    return child;
  }
}
