import 'package:fedi_app/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/post/settings/local_preferences/post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

class GlobalPostStatusSettingsLocalPreferenceBloc
    extends PostStatusSettingsLocalPreferenceBloc<PostStatusSettings>
    implements IGlobalPostStatusSettingsLocalPreferenceBloc {
  GlobalPostStatusSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, 'postStatus.settings.global');

  static final defaultValue = PostStatusSettings(
    defaultVisibilityString: UnifediApiVisibility.publicValue.stringValue,
    markMediaAsNsfwOnAttach: false,
    dontUploadMediaDuringEditing: false,
    defaultStatusLocale: null,
  );

  @override
  PostStatusSettings get defaultPreferenceValue => defaultValue;
}
