import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';

abstract class IFormStringFieldBloc extends IFormValueFieldBloc<String> {
  TextEditingController get textEditingController;
  FocusNode get focusNode;

  int get maxLength;

}
