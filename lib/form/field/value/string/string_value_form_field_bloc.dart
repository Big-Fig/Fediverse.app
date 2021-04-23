import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStringValueFormFieldBloc extends IValueFormFieldBloc<String> {
  static IStringValueFormFieldBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStringValueFormFieldBloc>(context, listen: listen);

  TextEditingController get textEditingController;

  FocusNode get focusNode;

  int? get maxLength;
}
