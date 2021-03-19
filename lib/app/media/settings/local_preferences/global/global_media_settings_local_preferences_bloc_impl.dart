import 'package:fedi/app/media/settings/local_preferences/global/global_media_settings_local_preferences_bloc.dart';
import 'package:fedi/app/media/settings/local_preferences/media_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalMediaSettingsLocalPreferencesBloc
    extends MediaSettingsLocalPreferencesBloc
    implements IGlobalMediaSettingsLocalPreferencesBloc {
  GlobalMediaSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, "media.settings.global");

  @override
  MediaSettings get defaultValue => MediaSettings(
        autoInit: false,
        autoPlay: false,
      );
}
