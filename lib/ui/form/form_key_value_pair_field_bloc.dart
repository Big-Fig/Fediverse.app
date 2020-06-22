import 'package:fedi/ui/form/form_field_bloc.dart';
import 'package:fedi/ui/form/form_value_field_bloc.dart';

abstract class IFormKeyValuePairFieldBloc<K extends IFormValueFieldBloc,
    V extends IFormValueFieldBloc> extends IFormFieldBloc {
  K get keyField;

  V get valueField;
}
