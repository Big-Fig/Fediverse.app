import 'package:fedi/ui/form/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';

abstract class IFormStringFieldBloc extends IFormValueFieldBloc<String> {
  TextEditingController get textEditingController;
}
