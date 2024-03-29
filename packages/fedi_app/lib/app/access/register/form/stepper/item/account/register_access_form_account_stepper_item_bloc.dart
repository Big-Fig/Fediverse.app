import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAccessFormStepperAccountItemBloc
    implements IRegisterAccessFormStepperItemBloc, IDisposable {
  static IRegisterAccessFormStepperAccountItemBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterAccessFormStepperAccountItemBloc>(
        context,
        listen: listen,
      );

  IStringValueFormFieldBloc get usernameFieldBloc;

  IStringValueFormFieldBloc get emailFieldBloc;

  IStringValueFormFieldBloc get passwordFieldBloc;
}
