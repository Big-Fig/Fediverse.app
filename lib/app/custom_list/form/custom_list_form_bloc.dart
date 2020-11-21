import 'package:fedi/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICustomListFormBloc extends IFormBloc {
  static ICustomListFormBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICustomListFormBloc>(context, listen: listen);

  IFormStringFieldBloc get titleField;
}
