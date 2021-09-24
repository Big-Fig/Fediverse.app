import 'package:fedi/app/access/register/form/stepper/item/register_access_form_stepper_item_model.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/ui/stepper/fedi_stepper_model.dart';

abstract class IRegisterUnifediApiAccessFormStepperItemBloc
    implements IFediStepperItem, IFormItemBloc {
  RegisterUnifediApiAccessFormStepperItemType get type;
}
