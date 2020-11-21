import 'package:fedi/app/settings/global/edit/edit_global_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:fedi/app/ui/theme/form/fedi_ui_theme_single_from_list_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditUiSettingsBloc
    implements IEditGlobalSettingsBloc<UiSettings> {
  static IEditUiSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditUiSettingsBloc>(context, listen: listen);

  IFediUiThemeSingleFromListValueFormFieldBloc get fediThemeFieldBloc;
}
