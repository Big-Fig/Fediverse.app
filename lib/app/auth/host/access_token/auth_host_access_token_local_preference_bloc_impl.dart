import 'package:fedi/app/auth/host/access_token/auth_host_access_token_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_model.dart';

class AuthHostAccessTokenLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<PleromaApiOAuthToken?>
    implements IAuthHostAccessTokenLocalPreferenceBloc {
  AuthHostAccessTokenLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String host,
  }) : super(
          preferencesService: preferencesService,
          key: 'auth.host.$host.access_token',
          schemaVersion: 1,
          jsonConverter: (json) => PleromaApiOAuthToken.fromJson(json),
        );

  static const PleromaApiOAuthToken? defaultValue = null;

  @override
  PleromaApiOAuthToken? get defaultPreferenceValue => defaultValue;
}
