import 'package:fedi/app/settings/global_or_instance/local_preferences/global_or_instance_settings_bloc_local_preference_impl.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';

class StatusSensitiveSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferenceBloc<
        StatusSensitiveSettings> implements IStatusSensitiveSettingsBloc {
  StatusSensitiveSettingsBloc({
    required IStatusSensitiveSettingsLocalPreferenceBloc<
            StatusSensitiveSettings>
        globalLocalPreferencesBloc,
    required IStatusSensitiveSettingsLocalPreferenceBloc<
            StatusSensitiveSettings?>
        instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  Future changeIsAlwaysShowNsfw(bool value) {
    return updateInstanceSettings(
      settingsData.copyWith(
        isAlwaysShowNsfw: value,
      ),
    );
  }

  @override
  Future changeIsAlwaysShowSpoiler(bool value) {
    return updateInstanceSettings(
      settingsData.copyWith(
        isAlwaysShowSpoiler: value,
      ),
    );
  }

  @override
  Future changeNsfwDisplayDelayDuration(Duration? value) {
    return updateInstanceSettings(
      StatusSensitiveSettings(
        isAlwaysShowNsfw: isAlwaysShowNsfw,
        isAlwaysShowSpoiler: isAlwaysShowSpoiler,
        nsfwDisplayDelayDurationMicrosecondsTotal: value?.inMicroseconds,
      ),
      // settingsData.copyWith(
      //   nsfwDisplayDelayDurationMicrosecondsTotal: value.inMicroseconds,
      // ),
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
  Duration? get nsfwDisplayDelayDuration =>
      settingsData.nsfwDisplayDelayDuration;

  @override
  Stream<Duration?> get nsfwDisplayDelayDurationStream =>
      settingsDataStream.map((settings) => settings.nsfwDisplayDelayDuration);
}
