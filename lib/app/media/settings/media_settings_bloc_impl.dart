import 'package:fedi/app/media/settings/local_preferences/media_settings_local_preference_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/local_preferences/global_or_instance_settings_bloc_local_preference_impl.dart';

class MediaSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferenceBloc<MediaSettings>
    implements IMediaSettingsBloc {
  MediaSettingsBloc({
    required IMediaSettingsLocalPreferenceBloc<MediaSettings>
        globalLocalPreferencesBloc,
    required IMediaSettingsLocalPreferenceBloc<MediaSettings?>
        instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  Future<void> changeAutoPlay(bool value) => updateInstanceSettings(
        settingsData.copyWith(
          autoPlay: value,
        ),
      );

  @override
  Future<void> changeAutoInit(bool value) => updateInstanceSettings(
        settingsData.copyWith(
          autoInit: value,
        ),
      );

  @override
  bool get autoPlay => settingsData.autoPlay;

  @override
  Stream<bool> get autoPlayStream =>
      settingsDataStream.map((settings) => settings.autoPlay);

  @override
  bool get autoInit => settingsData.autoInit;

  @override
  Stream<bool> get autoInitStream =>
      settingsDataStream.map((settings) => settings.autoInit);
}
