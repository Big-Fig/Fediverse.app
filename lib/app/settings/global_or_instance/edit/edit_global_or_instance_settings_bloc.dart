import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditGlobalOrInstanceSettingsBloc extends IDisposable {
  static IEditGlobalOrInstanceSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditGlobalOrInstanceSettingsBloc>(context, listen: listen);

  IFormBoolFieldBloc get isUseGlobalSettingsFormBoolField;
}
