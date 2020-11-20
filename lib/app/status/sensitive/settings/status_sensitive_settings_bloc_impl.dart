import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:flutter/widgets.dart';

class StatusSensitiveSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<
        StatusSensitiveSettings> implements IStatusSensitiveSettingsBloc {
  StatusSensitiveSettingsBloc({
    @required
        IStatusSensitiveSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    @required
        IStatusSensitiveSettingsLocalPreferencesBloc
            instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,

        );

  @override
  void changeIsAlwaysShowNsfw(bool value) {
    updateInstanceSettings(
      settingsData.copyWith(
        isAlwaysShowNsfw: value,
      ),
    );
  }

  @override
  void changeIsAlwaysShowSpoiler(bool value) {
    updateInstanceSettings(
      settingsData.copyWith(
        isAlwaysShowSpoiler: value,
      ),
    );
  }

  @override
  void changeNsfwDisplayDelayDuration(Duration value) {
    updateInstanceSettings(
      settingsData.copyWith(
        nsfwDisplayDelayDurationMicrosecondsTotal: value.inMicroseconds,
      ),
    );
  }

  @override
  bool get isAlwaysShowNsfw => settingsData.isAlwaysShowNsfw;

  @override
  Stream<bool> get isAlwaysShowNsfwStream =>
      settingsDataStream.map((settings) => settings.isAlwaysShowNsfw);

  @override
  bool get isAlwaysShowSpoiler => settingsData.isAlwaysShowSpoiler;

  @override
  Stream<bool> get isAlwaysShowSpoilerStream =>
      settingsDataStream.map((settings) => settings.isAlwaysShowSpoiler);

  @override
  Duration get nsfwDisplayDelayDuration =>
      settingsData.nsfwDisplayDelayDuration;

  @override
  Stream<Duration> get nsfwDisplayDelayDurationStream =>
      settingsDataStream.map((settings) => settings.nsfwDisplayDelayDuration);
}
