import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/post/settings/local_preferences/post_status_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';

class GlobalPostStatusSettingsLocalPreferencesBloc
    extends PostStatusSettingsLocalPreferencesBloc
    implements IGlobalPostStatusSettingsLocalPreferencesBloc {
  GlobalPostStatusSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, "postStatus.settings.global");

  @override
  PostStatusSettings get defaultValue => PostStatusSettings(
        defaultVisibilityString: PleromaVisibility.public.toJsonValue(),
        markMediaAsNsfwOnAttach: false,
        defaultStatusLocale: null,
      );
}
