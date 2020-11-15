import 'package:fedi/app/ui/settings/local_preference/global/global_ui_settings_local_preferences_bloc.dart';
import 'package:fedi/app/ui/settings/local_preference/ui_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalUiSettingsLocalPreferencesBloc
    extends UiSettingsLocalPreferencesBloc
    implements IGlobalUiSettingsLocalPreferencesBloc {
  GlobalUiSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "ui.settings.global");
}
