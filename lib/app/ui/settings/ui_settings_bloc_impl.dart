import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/app/ui/settings/local_preference/ui_settings_local_preference_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';

class UiSettingsBloc extends DisposableOwner implements IUiSettingsBloc {
  final IUiSettingsLocalPreferenceBloc uiSettingsLocalPreferencesBloc;

  UiSettingsBloc({
    required this.uiSettingsLocalPreferencesBloc,
  });

  @override
  UiSettings get settingsData => uiSettingsLocalPreferencesBloc.value;

  @override
  Stream<UiSettings> get settingsDataStream =>
      uiSettingsLocalPreferencesBloc.stream;

  @override
  String? get themeId => settingsData.themeId;

  @override
  Stream<String?> get themeIdStream =>
      settingsDataStream.map((settings) => settings.themeId);

  @override
  Future changeThemeId(String? value) => updateSettings(
        // copyWith dont set null values
        UiSettings.fromEnum(
          themeId: value,
          statusFontSize: settingsData.statusFontSize,
        ),
      );

  @override
  UiSettingsFontSize get statusFontSize => settingsData.statusFontSize;

  @override
  Stream<UiSettingsFontSize> get statusFontSizeStream => settingsDataStream.map(
        (settings) => settings.statusFontSize,
      );

  @override
  Future changeStatusFontSize(UiSettingsFontSize value) => updateSettings(
        // copyWith dont set null values
        UiSettings.fromEnum(
          themeId: settingsData.themeId,
          statusFontSize: value,
        ),
      );

  @override
  Future updateSettings(UiSettings newSettings) async {
    await uiSettingsLocalPreferencesBloc.setValue(
      newSettings,
    );
  }
}
