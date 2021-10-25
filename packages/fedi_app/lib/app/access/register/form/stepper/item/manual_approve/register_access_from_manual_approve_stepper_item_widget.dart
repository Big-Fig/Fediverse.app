import 'package:fedi_app/app/access/register/form/stepper/item/manual_approve/register_access_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_description_widget.dart';
import 'package:fedi_app/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/ui/stepper/fedi_stepper_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterAccessFormStepperManualApproveItemWidget extends StatelessWidget {
  const RegisterAccessFormStepperManualApproveItemWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          RegisterAccessFormStepperItemDescriptionWidget(
            text: S
                .of(context)
                .app_auth_instance_register_step_manualApprove_description,
          ),
          const _RegisterUnifediApiAccessFormReasonFieldWidget(),
        ],
      );
}

class _RegisterUnifediApiAccessFormReasonFieldWidget extends StatelessWidget {
  const _RegisterUnifediApiAccessFormReasonFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemBloc = IRegisterAccessFormStepperManualApproveItemBloc.of(context);

    return StreamBuilder<bool>(
      stream: itemBloc.isEditingStartedStream,
      initialData: itemBloc.isEditingStarted,
      builder: (context, snapshot) {
        final isEditingStarted = snapshot.data!;

        return ProxyProvider<IRegisterAccessFormStepperManualApproveItemBloc,
            IStringValueFormFieldBloc>(
          update: (context, itemBloc, _) => itemBloc.reasonFieldBloc,
          child: StringValueFormFieldRowWidget(
            label: S.of(context).app_auth_instance_register_field_reason_label,
            hint: S.of(context).app_auth_instance_register_field_reason_hint,
            autocorrect: false,
            onSubmitted: null,
            displayErrors: isEditingStarted,
            textInputAction: TextInputAction.done,
          ),
        );
      },
    );
  }
}
