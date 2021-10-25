import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_model.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:fedi_app/ui/stepper/fedi_stepper_model.dart';

abstract class IRegisterAccessFormStepperItemBloc
    implements IFediStepperItem, IFormItemBloc {
  RegisterAccessFormStepperItemType get type;
}
