
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFormBoolFieldBloc extends IFormValueFieldBloc<bool> {
  static IFormBoolFieldBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFormBoolFieldBloc>(context, listen: listen);


}

