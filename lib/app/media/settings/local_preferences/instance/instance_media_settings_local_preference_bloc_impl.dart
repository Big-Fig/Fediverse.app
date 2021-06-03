import 'package:fedi/app/media/settings/local_preferences/instance/instance_media_settings_local_preference_bloc.dart';
import 'package:fedi/app/media/settings/local_preferences/media_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstanceMediaSettingsLocalPreferenceBloc
    extends MediaSettingsLocalPreferenceBloc<MediaSettings?>
    implements IInstanceMediaSettingsLocalPreferenceBloc {
  InstanceMediaSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(preferencesService, "media.settings.instance.$userAtHost");

  static const MediaSettings? defaultValue = null;

  @override
  MediaSettings? get defaultPreferenceValue => defaultValue;
}
