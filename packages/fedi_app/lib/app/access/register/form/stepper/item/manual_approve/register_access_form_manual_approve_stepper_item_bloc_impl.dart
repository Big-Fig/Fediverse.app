import 'package:fedi_app/app/access/register/form/stepper/item/manual_approve/register_access_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_bloc_impl.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_model.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';

class RegisterAccessFormStepperManualApproveItemBloc
    extends RegisterAccessFormStepperItemBloc
    implements IRegisterAccessFormStepperManualApproveItemBloc {
  @override
  // ignore: avoid-late-keyword
  late IStringValueFormFieldBloc reasonFieldBloc;

  RegisterAccessFormStepperManualApproveItemBloc()
      : super(
          isAllItemsInitialized: false,
        ) {
    reasonFieldBloc = StringValueFormFieldBloc(
      originValue: '',
      validators: [],
      maxLength: null,
    );

    onFormItemsChanged();
  }

  @override
  RegisterAccessFormStepperItemType get type =>
      RegisterAccessFormStepperItemType.manualApprove;

  @override
  List<IFormItemBloc> get currentItems => [
        reasonFieldBloc,
      ];
}
