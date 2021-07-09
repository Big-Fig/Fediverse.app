import 'package:fedi/app/auth/instance/register/form/stepper/item/account/register_auth_instance_form_account_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/register_auth_instance_form_stepper_item_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/register_auth_instance_form_stepper_item_model.dart';
import 'package:fedi/form/field/value/string/email/email_string_value_form_field_validation.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_length_validation.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';

class RegisterAuthInstanceFormStepperAccountItemBloc
    extends RegisterAuthInstanceFormStepperItemBloc
    implements IRegisterAuthInstanceFormStepperAccountItemBloc {
  @override
  final IStringValueFormFieldBloc usernameFieldBloc = StringValueFormFieldBloc(
    originValue: '',
    validators: [StringValueFormFieldNonEmptyValidationError.createValidator()],
    maxLength: null,
  );

  @override
  final IStringValueFormFieldBloc emailFieldBloc = StringValueFormFieldBloc(
    originValue: '',
    validators: [EmailStringValueFormFieldValidationError.createValidator()],
    maxLength: null,
  );

  @override
  final IStringValueFormFieldBloc passwordFieldBloc = StringValueFormFieldBloc(
    originValue: '',
    validators: [
      StringValueFormFieldLengthValidationError.createValidator(
        // todo: refactor
        // ignore: no-magic-number
        minLength: 4,
        maxLength: null,
      ),
    ],
    maxLength: null,
  );

  RegisterAuthInstanceFormStepperAccountItemBloc()
      : super(
          isAllItemsInitialized: true,
        ) {
    usernameFieldBloc.disposeWith(this);
    emailFieldBloc.disposeWith(this);
    passwordFieldBloc.disposeWith(this);
  }

  @override
  RegisterAuthInstanceFormStepperItemType get type =>
      RegisterAuthInstanceFormStepperItemType.account;

  @override
  List<IFormItemBloc> get currentItems => [
        usernameFieldBloc,
        emailFieldBloc,
        passwordFieldBloc,
      ];
}
