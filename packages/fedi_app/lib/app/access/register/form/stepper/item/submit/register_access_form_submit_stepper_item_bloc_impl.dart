import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_bloc_impl.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_model.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/submit/register_access_form_submit_stepper_item_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/bool/validation/bool_value_form_field_only_true_validation.dart';
import 'package:fedi_app/form/form_item_bloc.dart';

class RegisterAccessFormStepperSubmitItemBloc
    extends RegisterAccessFormStepperItemBloc
    implements IRegisterAccessFormStepperSubmitItemBloc {
  @override
  final Uri instanceBaseUri;

  @override
  final BoolValueFormFieldBloc agreeTermsOfServiceFieldBloc =
      BoolValueFormFieldBloc(
    originValue: false,
    validators: [
      BoolValueFormFieldOnlyTrueValidationError.createValidator(),
    ],
  );

  // final ILocalizationSettingsBloc localizationSettingsBloc;

  // @override
  // // ignore: avoid-late-keyword
  // late LocalizationLocaleSingleFromListValueFormFieldBloc localeFieldBloc;

  RegisterAccessFormStepperSubmitItemBloc({
    required this.instanceBaseUri,
  }) : super(
          isAllItemsInitialized: false,
        ) {
    // localeFieldBloc = LocalizationLocaleSingleFromListValueFormFieldBloc(
    //   originValue: localizationSettingsBloc.localizationLocale,
    //   isEnabled: true,
    //   possibleValues: supportedLocalizationLocaleList,
    // );

    // localeFieldBloc.disposeWith(this);
    agreeTermsOfServiceFieldBloc.disposeWith(this);

    onFormItemsChanged();
  }

  @override
  RegisterAccessFormStepperItemType get type =>
      RegisterAccessFormStepperItemType.submit;

  @override
  List<IFormItemBloc> get currentItems => [
        agreeTermsOfServiceFieldBloc,
        // localeFieldBloc,
      ];
}
