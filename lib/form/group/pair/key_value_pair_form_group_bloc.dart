import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/group/form_group_bloc.dart';

abstract class IKeyValuePairFormGroupBloc<K extends IValueFormFieldBloc,
    V extends IValueFormFieldBloc> extends IFormGroupBloc {
  K get keyField;

  V get valueField;
}
