import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/post/settings/local_preferences/post_status_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalPostStatusSettingsLocalPreferencesBloc
    extends PostStatusSettingsLocalPreferencesBloc
    implements IGlobalPostStatusSettingsLocalPreferencesBloc {
  GlobalPostStatusSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "postStatus.settings.global");
}
