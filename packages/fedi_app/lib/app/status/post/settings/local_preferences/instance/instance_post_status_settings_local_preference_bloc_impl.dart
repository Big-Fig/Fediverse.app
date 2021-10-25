import 'package:fedi_app/app/status/post/settings/local_preferences/instance/instance_post_status_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/post/settings/local_preferences/post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class InstancePostStatusSettingsLocalPreferenceBloc
    extends PostStatusSettingsLocalPreferenceBloc<PostStatusSettings?>
    implements IInstancePostStatusSettingsLocalPreferenceBloc {
  InstancePostStatusSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          'postStatus.settings.instance.$userAtHost',
        );
  static const PostStatusSettings? defaultValue = null;

  @override
  PostStatusSettings? get defaultPreferenceValue => defaultValue;
}
