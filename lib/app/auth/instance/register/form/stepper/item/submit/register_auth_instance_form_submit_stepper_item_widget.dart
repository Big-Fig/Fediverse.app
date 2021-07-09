import 'package:fedi/app/auth/instance/register/form/accept_terms_of_service/register_auth_instance_accept_terms_of_service_bool_value_form_field_row_widget.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/submit/register_auth_instance_form_submit_stepper_item_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/ui/stepper/fedi_stepper_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RegisterAuthInstanceFormStepperSubmitItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          // const _RegisterAuthInstanceFormLocaleFieldWidget(),
          const _RegisterAuthInstanceFormAcceptTermsOfServiceFieldWidget(),
        ],
      );
}

//
// class _RegisterAuthInstanceFormLocaleFieldWidget extends StatelessWidget {
//   const _RegisterAuthInstanceFormLocaleFieldWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ProxyProvider<IRegisterAuthInstanceFormBloc,
//         ILocalizationLocaleSingleFromListValueFormFieldBloc>(
//       update: (context, value, previous) => value.localeFieldBloc,
//       builder: (context, snapshot) =>
//           LocalizationLocaleSingleFromListValueFormFieldRowWidget(
//             customNullLocalizationValue:
//             S.of(context).localization_locale_notSpecified,
//             customLabel: S
//                 .of(context)
//                 .app_localization_settings_field_localizationLocale_yourStatuses_label,
//           ),
//     );
//   }
// }
//

class _RegisterAuthInstanceFormAcceptTermsOfServiceFieldWidget
    extends StatelessWidget {
  const _RegisterAuthInstanceFormAcceptTermsOfServiceFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemBloc = IRegisterAuthInstanceFormStepperSubmitItemBloc.of(context);

    return StreamBuilder<bool>(
      stream: itemBloc.isEditingStartedStream,
      initialData: itemBloc.isEditingStarted,
      builder: (context, snapshot) {
        final isEditingStarted = snapshot.data!;

        return ProxyProvider<IRegisterAuthInstanceFormStepperSubmitItemBloc,
            IBoolValueFormFieldBloc>(
          update: (context, itemBloc, _) =>
              itemBloc.agreeTermsOfServiceFieldBloc,
          child:
              RegisterAuthInstanceAcceptTermsOfServiceBoolValueFormFieldRowWidget(
            displayErrors: isEditingStarted,
            instanceBaseUri: itemBloc.instanceBaseUri,
          ),
        );
      },
    );
  }
}
