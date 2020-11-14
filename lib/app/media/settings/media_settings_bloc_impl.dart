import 'package:fedi/app/media/settings/local_preferences/media_settings_local_preferences_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';

class MediaSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<MediaSettings>
    implements IMediaSettingsBloc {
  MediaSettingsBloc(
    IMediaSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    IMediaSettingsLocalPreferencesBloc instanceLocalPreferencesBloc,
  ) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  void changeAutoPlay(bool value) {
    if (isInstance) {
      instanceLocalPreferencesBloc.setValue(
        instanceSettingsData.copyWith(
          autoPlay: value,
        ),
      );
    } else {
      globalLocalPreferencesBloc.setValue(
        globalSettingsData.copyWith(
          autoPlay: value,
        ),
      );
    }
  }

  @override
  void changeAutoInit(bool value) {
    if (isInstance) {
      instanceLocalPreferencesBloc.setValue(
        instanceSettingsData.copyWith(
          autoInit: value,
        ),
      );
    } else {
      globalLocalPreferencesBloc.setValue(
        globalSettingsData.copyWith(
          autoInit: value,
        ),
      );
    }
  }

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
