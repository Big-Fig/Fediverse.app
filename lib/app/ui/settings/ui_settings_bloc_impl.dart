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
  void changeThemeId(String value) {
    updateSettings(
      UiSettings(
        themeId: value,
      ),
      // copyWith don't set null values
      // settingsData.copyWith(
      //   themeId: value,
      // ),
    );
  }

  @override
  String get themeId => settingsData?.themeId;

  @override
  Stream<String> get themeIdStream =>
      settingsDataStream.map((settings) => settings?.themeId);

  @override
  Future updateSettings(UiSettings newSettings) async {
    await uiSettingsLocalPreferencesBloc.setValue(
      newSettings,
    );
  }
}
