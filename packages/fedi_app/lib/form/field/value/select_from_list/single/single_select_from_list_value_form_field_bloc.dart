import 'package:fedi_app/form/field/value/select_from_list/select_from_list_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISingleSelectFromListValueFormFieldBloc<T>
    implements ISelectFromListValueFormFieldBloc<T> {
  List<T> get possibleValues;

  static ISingleSelectFromListValueFormFieldBloc<T> of<T>(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ISingleSelectFromListValueFormFieldBloc<T>>(
        context,
        listen: listen,
      );
}
