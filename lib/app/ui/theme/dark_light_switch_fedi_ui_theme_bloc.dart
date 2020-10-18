import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDarkLightSwitchFediUiThemeBloc implements IFormBoolFieldBloc {
  static IDarkLightSwitchFediUiThemeBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IDarkLightSwitchFediUiThemeBloc>(context, listen: listen);
}
