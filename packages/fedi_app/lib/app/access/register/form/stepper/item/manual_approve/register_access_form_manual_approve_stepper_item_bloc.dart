import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAccessFormStepperManualApproveItemBloc
    implements IRegisterAccessFormStepperItemBloc, IDisposable {
  static IRegisterAccessFormStepperManualApproveItemBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterAccessFormStepperManualApproveItemBloc>(
        context,
        listen: listen,
      );

  IStringValueFormFieldBloc get reasonFieldBloc;
}
