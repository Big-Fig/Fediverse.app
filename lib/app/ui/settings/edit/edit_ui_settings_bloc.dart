import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditUiSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc {
  static IEditUiSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditUiSettingsBloc>(context, listen: listen);

  IFormStringFieldBloc get themeIdFieldBloc;
}
