import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IBoolValueFormFieldBloc extends IValueFormFieldBloc<bool> {
  static IBoolValueFormFieldBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IBoolValueFormFieldBloc>(context, listen: listen);
}
