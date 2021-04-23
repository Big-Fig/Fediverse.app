import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISelectFromListValueFormFieldBloc<T>
    implements IValueFormFieldBloc<T> {
  static ISelectFromListValueFormFieldBloc<T> of<T>(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ISelectFromListValueFormFieldBloc<T>>(
        context,
        listen: listen,
      );
}
