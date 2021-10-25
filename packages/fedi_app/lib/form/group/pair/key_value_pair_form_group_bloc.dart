import 'package:fedi_app/form/field/value/value_form_field_bloc.dart';
import 'package:fedi_app/form/group/form_group_bloc.dart';

abstract class IKeyValuePairFormGroupBloc<
    K extends IValueFormFieldBloc<dynamic>,
    V extends IValueFormFieldBloc<dynamic>> extends IFormGroupBloc {
  K get keyField;

  V get valueField;
}
