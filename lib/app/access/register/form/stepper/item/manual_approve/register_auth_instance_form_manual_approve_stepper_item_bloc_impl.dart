import 'package:fedi/app/access/register/form/stepper/item/manual_approve/register_auth_instance_form_manual_approve_stepper_item_bloc.dart';
import 'package:fedi/app/access/register/form/stepper/item/register_auth_instance_form_stepper_item_bloc_impl.dart';
import 'package:fedi/app/access/register/form/stepper/item/register_auth_instance_form_stepper_item_model.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';

class RegisterUnifediApiAccessFormStepperManualApproveItemBloc
    extends RegisterUnifediApiAccessFormStepperItemBloc
    implements IRegisterUnifediApiAccessFormStepperManualApproveItemBloc {
  @override
  // ignore: avoid-late-keyword
  late IStringValueFormFieldBloc reasonFieldBloc;

  RegisterUnifediApiAccessFormStepperManualApproveItemBloc()
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
  RegisterUnifediApiAccessFormStepperItemType get type =>
      RegisterUnifediApiAccessFormStepperItemType.manualApprove;

  @override
  List<IFormItemBloc> get currentItems => [
        reasonFieldBloc,
      ];
}
