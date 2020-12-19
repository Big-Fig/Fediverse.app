import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/app/ui/settings/local_preference/ui_settings_local_preferences_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/cupertino.dart';

class UiSettingsBloc extends DisposableOwner implements IUiSettingsBloc {
  final IUiSettingsLocalPreferencesBloc uiSettingsLocalPreferencesBloc;

  UiSettingsBloc({
    @required this.uiSettingsLocalPreferencesBloc,
  });

  @override
  UiSettings get settingsData => uiSettingsLocalPreferencesBloc.value;

  @override
  Stream<UiSettings> get settingsDataStream =>
      uiSettingsLocalPreferencesBloc.stream;

  @override
  String get themeId => settingsData?.themeId;

  @override
  Stream<String> get themeIdStream =>
      settingsDataStream.map((settings) => settings?.themeId);

  @override
  void changeThemeId(String value) {
    updateSettings(
      // copyWith don't set null values
      UiSettings(themeId: value, statusFontSize: settingsData?.statusFontSize),
    );
  }

  @override
  UiSettingsFontSize get statusFontSize =>
      settingsData?.statusFontSizeAsUiSettingsFontSize ??
      IUiSettingsBloc.defaultStatusFontSettingsValue;

  @override
  Stream<UiSettingsFontSize> get statusFontSizeStream =>
      settingsDataStream.map((settings) =>
          settings?.statusFontSizeAsUiSettingsFontSize ??
          IUiSettingsBloc.defaultStatusFontSettingsValue);

  @override
  void changeStatusFontSize(UiSettingsFontSize value) {
    updateSettings(
      // copyWith don't set null values
      UiSettings(
        themeId: settingsData.themeId,
        statusFontSize: value?.toJsonValue(),
      ),
    );
  }

  @override
  Future updateSettings(UiSettings newSettings) async {
    await uiSettingsLocalPreferencesBloc.setValue(
      newSettings,
    );
  }
}
