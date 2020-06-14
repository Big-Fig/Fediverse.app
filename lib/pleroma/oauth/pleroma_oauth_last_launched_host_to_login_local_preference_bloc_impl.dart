import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_last_launched_host_to_login_local_preference_bloc.dart';

class PleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
    extends StringPreferenceBloc
    implements IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc {
  PleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "PleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc");
}
