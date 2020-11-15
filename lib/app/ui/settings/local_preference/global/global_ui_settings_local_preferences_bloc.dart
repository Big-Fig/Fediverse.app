import 'package:fedi/app/ui/settings/local_preference/ui_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalUiSettingsLocalPreferencesBloc
    implements IUiSettingsLocalPreferencesBloc {
  static IGlobalUiSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IGlobalUiSettingsLocalPreferencesBloc>(context,
          listen: listen);
}
