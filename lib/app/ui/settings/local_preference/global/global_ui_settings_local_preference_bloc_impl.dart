import 'package:fedi/app/ui/settings/local_preference/global/global_ui_settings_local_preference_bloc.dart';
import 'package:fedi/app/ui/settings/local_preference/ui_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalUiSettingsLocalPreferenceBloc extends UiSettingsLocalPreferenceBloc
    implements IGlobalUiSettingsLocalPreferenceBloc {
  GlobalUiSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, "ui.settings.global");

  static final UiSettings defaultValue = UiSettings.fromEnum(
    themeId: null,
    statusFontSize: IUiSettingsBloc.defaultStatusFontSettingsValue,
  );

  @override
  UiSettings get defaultPreferenceValue => defaultValue;
}
