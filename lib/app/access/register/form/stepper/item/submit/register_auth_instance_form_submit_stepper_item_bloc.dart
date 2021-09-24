import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/register/form/stepper/item/register_auth_instance_form_stepper_item_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterUnifediApiAccessFormStepperSubmitItemBloc
    implements IRegisterUnifediApiAccessFormStepperItemBloc, IDisposable {
  static IRegisterUnifediApiAccessFormStepperSubmitItemBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterUnifediApiAccessFormStepperSubmitItemBloc>(
        context,
        listen: listen,
      );

  // ILocalizationLocaleSingleFromListValueFormFieldBloc get localeFieldBloc;

  IBoolValueFormFieldBloc get agreeTermsOfServiceFieldBloc;

  Uri get instanceBaseUri;
}
