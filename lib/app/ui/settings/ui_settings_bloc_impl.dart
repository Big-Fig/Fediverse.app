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

  UiSettings get settingsData => uiSettingsLocalPreferencesBloc.value;

  Stream<UiSettings> get settingsDataStream =>
      uiSettingsLocalPreferencesBloc.stream;

  @override
  void changeThemeId(String value) {
    uiSettingsLocalPreferencesBloc.setValue(
      settingsData.copyWith(
        themeId: value,
      ),
    );
  }

  @override
  String get themeId => settingsData.themeId;

  @override
  Stream<String> get themeIdStream =>
      settingsDataStream.map((settings) => settings.themeId);
}
