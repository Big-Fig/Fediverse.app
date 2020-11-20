import 'package:fedi/app/settings/global/edit/edit_global_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditUiSettingsBloc
    implements IEditGlobalSettingsBloc<UiSettings> {
  static IEditUiSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditUiSettingsBloc>(context, listen: listen);

  IFormStringFieldBloc get themeIdFieldBloc;
}
