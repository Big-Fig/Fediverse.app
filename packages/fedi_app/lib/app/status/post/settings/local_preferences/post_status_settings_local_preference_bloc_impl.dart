import 'package:fedi_app/app/status/post/settings/local_preferences/post_status_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

abstract class PostStatusSettingsLocalPreferenceBloc<
        T extends PostStatusSettings?> extends ObjectLocalPreferenceBloc<T>
    implements IPostStatusSettingsLocalPreferenceBloc<T> {
  PostStatusSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => PostStatusSettings.fromJson(json) as T,
        );
}
