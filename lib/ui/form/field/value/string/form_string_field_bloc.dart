import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFormStringFieldBloc extends IFormValueFieldBloc<String> {
  static IFormStringFieldBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFormStringFieldBloc>(context, listen: listen);


  TextEditingController get textEditingController;
  FocusNode get focusNode;

  int get maxLength;

}
