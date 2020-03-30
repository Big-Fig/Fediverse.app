import 'package:fedi/refactored/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_access_token_local_preference_bloc.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';

class AuthHostAccessTokenLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<PleromaOAuthToken>
    implements IAuthHostAccessTokenLocalPreferenceBloc {
  AuthHostAccessTokenLocalPreferenceBloc(
      ILocalPreferencesService preferencesService, String host)
      : super(preferencesService, "auth.host.$host.access_token", 1);
}
