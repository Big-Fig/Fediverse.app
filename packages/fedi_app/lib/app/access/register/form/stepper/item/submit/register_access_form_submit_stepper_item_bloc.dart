import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAccessFormStepperSubmitItemBloc
    implements IRegisterAccessFormStepperItemBloc, IDisposable {
  static IRegisterAccessFormStepperSubmitItemBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterAccessFormStepperSubmitItemBloc>(
        context,
        listen: listen,
      );

  // ILocalizationLocaleSingleFromListValueFormFieldBloc get localeFieldBloc;

  IBoolValueFormFieldBloc get agreeTermsOfServiceFieldBloc;

  Uri get instanceBaseUri;
}
