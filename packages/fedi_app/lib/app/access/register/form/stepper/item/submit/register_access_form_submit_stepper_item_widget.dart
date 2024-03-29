import 'package:fedi_app/app/access/register/form/accept_terms_of_service/register_access_accept_terms_of_service_bool_value_form_field_row_widget.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/submit/register_access_form_submit_stepper_item_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/ui/stepper/fedi_stepper_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RegisterAccessFormStepperSubmitItemWidget extends StatelessWidget {
  const RegisterAccessFormStepperSubmitItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: const [
          // const _RegisterUnifediApiAccessFormLocaleFieldWidget(),
          _RegisterUnifediApiAccessFormAcceptTermsOfServiceFieldWidget(),
        ],
      );
}

//
// class _RegisterUnifediApiAccessFormLocaleFieldWidget extends StatelessWidget {
//   const _RegisterUnifediApiAccessFormLocaleFieldWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ProxyProvider<IRegisterUnifediApiAccessFormBloc,
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

class _RegisterUnifediApiAccessFormAcceptTermsOfServiceFieldWidget
    extends StatelessWidget {
  const _RegisterUnifediApiAccessFormAcceptTermsOfServiceFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemBloc = IRegisterAccessFormStepperSubmitItemBloc.of(context);

    return StreamBuilder<bool>(
      stream: itemBloc.isEditingStartedStream,
      initialData: itemBloc.isEditingStarted,
      builder: (context, snapshot) {
        final isEditingStarted = snapshot.data!;

        return ProxyProvider<IRegisterAccessFormStepperSubmitItemBloc,
            IBoolValueFormFieldBloc>(
          update: (context, itemBloc, _) =>
              itemBloc.agreeTermsOfServiceFieldBloc,
          child: RegisterAccessAcceptTermsOfServiceBoolValueFormFieldRowWidget(
            displayErrors: isEditingStarted,
            instanceBaseUri: itemBloc.instanceBaseUri,
          ),
        );
      },
    );
  }
}
