import 'package:fedi/app/media/settings/local_preferences/media_settings_local_preference_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class MediaSettingsLocalPreferenceBloc<T extends MediaSettings?>
    extends ObjectLocalPreferenceBloc<T>
    implements IMediaSettingsLocalPreferenceBloc<T> {
  MediaSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => MediaSettings.fromJson(json) as T,
        );
}
