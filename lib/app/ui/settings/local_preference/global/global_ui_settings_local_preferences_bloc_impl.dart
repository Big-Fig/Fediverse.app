import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/app/ui/settings/local_preference/global/global_ui_settings_local_preferences_bloc.dart';
import 'package:fedi/app/ui/settings/local_preference/ui_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalUiSettingsLocalPreferencesBloc
    extends UiSettingsLocalPreferencesBloc
    implements IGlobalUiSettingsLocalPreferencesBloc {
  GlobalUiSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "ui.settings.global");

  @override
  UiSettings get defaultValue => UiSettings(
        themeId: null,
        statusFontSize:
            IUiSettingsBloc.defaultStatusFontSettingsValue?.toJsonValue(),
      );
}
