import 'package:fedi/app/auth/instance/register/form/stepper/item/captcha/register_auth_instance_form_captcha_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/register_auth_instance_form_stepper_item_description_widget.dart';
import 'package:fedi/app/captcha/captcha_string_value_form_field_bloc.dart';
import 'package:fedi/app/captcha/captcha_string_value_form_field_row_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/stepper/fedi_stepper_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RegisterUnifediApiAccessFormStepperCaptchaItemWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemBloc =
        IRegisterUnifediApiAccessFormStepperCaptchaItemBloc.of(context);

    return StreamBuilder<bool?>(
      stream: itemBloc.captchaFieldBloc.isDisabledOnServerSideStream,
      initialData: itemBloc.captchaFieldBloc.isDisabledOnServerSide,
      builder: (context, snapshot) {
        final isDisabledOnServerSide = snapshot.data;

        if (isDisabledOnServerSide == true) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RegisterUnifediApiAccessFormStepperItemDescriptionWidget(
                text: S
                    .of(context)
                    .app_auth_instance_register_step_captcha_description_disabledOnServer,
              ),
              const FediBigVerticalSpacer(),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterUnifediApiAccessFormStepperItemDescriptionWidget(
                text: S
                    .of(context)
                    .app_auth_instance_register_step_captcha_description,
              ),
              const _RegisterUnifediApiAccessFormCaptchaFieldWidget(),
            ],
          );
        }
      },
    );
  }
}

class _RegisterUnifediApiAccessFormCaptchaFieldWidget extends StatelessWidget {
  const _RegisterUnifediApiAccessFormCaptchaFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemBloc =
        IRegisterUnifediApiAccessFormStepperCaptchaItemBloc.of(context);

    return StreamBuilder<bool>(
      stream: itemBloc.isEditingStartedStream,
      initialData: itemBloc.isEditingStarted,
      builder: (context, snapshot) {
        final isEditingStarted = snapshot.data!;

        return ProxyProvider<
            IRegisterUnifediApiAccessFormStepperCaptchaItemBloc,
            ICaptchaStringValueFormFieldBloc>(
          update: (context, value, previous) => value.captchaFieldBloc,
          child: FormCaptchaStringFormFieldRowWidget(
            label: S.of(context).app_auth_instance_register_field_captcha_label,
            hint: S.of(context).app_auth_instance_register_field_captcha_hint,
            displayErrors: isEditingStarted,
            autocorrect: false,
            onSubmitted: null,
            textInputAction: TextInputAction.done,
          ),
        );
      },
    );
  }
}
