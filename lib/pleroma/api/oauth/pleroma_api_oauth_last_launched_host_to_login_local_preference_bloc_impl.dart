import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_last_launched_host_to_login_local_preference_bloc.dart';

class PleromaApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
    extends StringNullableLocalPreferenceBloc
    implements IPleromaApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc {
  PleromaApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: "PleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc",
        );
}
