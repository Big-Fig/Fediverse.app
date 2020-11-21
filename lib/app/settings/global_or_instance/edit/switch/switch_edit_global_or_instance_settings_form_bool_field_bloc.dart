import 'package:fedi/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IIsUseGlobalSettingsFormBoolFieldBloc
    implements IFormBoolFieldBloc {
  static IIsUseGlobalSettingsFormBoolFieldBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IIsUseGlobalSettingsFormBoolFieldBloc>(context,
          listen: listen);

}
