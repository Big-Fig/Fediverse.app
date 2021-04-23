import 'package:fedi/app/media/settings/local_preferences/instance/instance_media_settings_local_preferences_bloc.dart';
import 'package:fedi/app/media/settings/local_preferences/media_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstanceMediaSettingsLocalPreferencesBloc
    extends MediaSettingsLocalPreferencesBloc<MediaSettings?>
    implements IInstanceMediaSettingsLocalPreferencesBloc {
  InstanceMediaSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(preferencesService, "media.settings.instance.$userAtHost");

  @override
  MediaSettings? get defaultPreferenceValue => null;
}
