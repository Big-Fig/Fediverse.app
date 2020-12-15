import 'package:fedi/form/field/value/duration/duration_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDurationDateTimeValueFormFieldBloc
    extends IDurationValueFormFieldBloc {
  static IDurationDateTimeValueFormFieldBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IDurationDateTimeValueFormFieldBloc>(context, listen: listen);
}
