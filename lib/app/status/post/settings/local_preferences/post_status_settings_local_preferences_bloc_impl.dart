import 'package:fedi/app/status/post/settings/local_preferences/post_status_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class PostStatusSettingsLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<PostStatusSettings?>
    implements IPostStatusSettingsLocalPreferencesBloc {
  PostStatusSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => PostStatusSettings.fromJson(json),
        );
}
