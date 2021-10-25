import 'package:fedi_app/app/access/register/form/stepper/item/captcha/register_access_form_captcha_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_description_widget.dart';
import 'package:fedi_app/app/captcha/captcha_string_value_form_field_bloc.dart';
import 'package:fedi_app/app/captcha/captcha_string_value_form_field_row_widget.dart';
import 'package:fedi_app/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/ui/stepper/fedi_stepper_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RegisterAccessFormStepperCaptchaItemWidget extends StatelessWidget {
  const RegisterAccessFormStepperCaptchaItemWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemBloc = IRegisterAccessFormStepperCaptchaItemBloc.of(context);

    return StreamBuilder<bool?>(
      stream: itemBloc.captchaFieldBloc.isDisabledOnServerSideStream,
      initialData: itemBloc.captchaFieldBloc.isDisabledOnServerSide,
      builder: (context, snapshot) {
        final isDisabledOnServerSide = snapshot.data;

        if (isDisabledOnServerSide == true) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RegisterAccessFormStepperItemDescriptionWidget(
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
              RegisterAccessFormStepperItemDescriptionWidget(
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
    var itemBloc = IRegisterAccessFormStepperCaptchaItemBloc.of(context);

    return StreamBuilder<bool>(
      stream: itemBloc.isEditingStartedStream,
      initialData: itemBloc.isEditingStarted,
      builder: (context, snapshot) {
        final isEditingStarted = snapshot.data!;

        return ProxyProvider<IRegisterAccessFormStepperCaptchaItemBloc,
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
