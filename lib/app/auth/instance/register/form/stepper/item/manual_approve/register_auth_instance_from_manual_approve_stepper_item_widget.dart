import 'package:fedi/app/auth/instance/register/form/stepper/item/manual_approve/register_auth_instance_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/register_auth_instance_form_stepper_item_description_widget.dart';
import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/stepper/fedi_stepper_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUnifediApiAccessFormStepperManualApproveItemWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          RegisterUnifediApiAccessFormStepperItemDescriptionWidget(
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
    var itemBloc =
        IRegisterUnifediApiAccessFormStepperManualApproveItemBloc.of(context);

    return StreamBuilder<bool>(
      stream: itemBloc.isEditingStartedStream,
      initialData: itemBloc.isEditingStarted,
      builder: (context, snapshot) {
        final isEditingStarted = snapshot.data!;

        return ProxyProvider<
            IRegisterUnifediApiAccessFormStepperManualApproveItemBloc,
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
