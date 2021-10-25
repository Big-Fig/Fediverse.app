import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICustomListFormBloc extends IFormBloc {
  static ICustomListFormBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICustomListFormBloc>(context, listen: listen);

  IStringValueFormFieldBloc get titleField;
}
