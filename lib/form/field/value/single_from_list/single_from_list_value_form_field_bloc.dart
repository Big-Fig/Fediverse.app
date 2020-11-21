import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISingleFromListValueFormFieldBloc<T>
    implements IValueFormFieldBloc<T> {
  static ISingleFromListValueFormFieldBloc<T> of<T>(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ISingleFromListValueFormFieldBloc<T>>(context,
          listen: listen);

  List<T> get possibleValues;
  bool get isNullValuePossible;
}
