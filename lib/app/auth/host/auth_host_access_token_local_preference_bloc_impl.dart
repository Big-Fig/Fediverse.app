import 'package:fedi/app/auth/host/auth_host_access_token_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:flutter/widgets.dart';

class AuthHostAccessTokenLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<PleromaOAuthToken?>
    implements IAuthHostAccessTokenLocalPreferenceBloc {
  AuthHostAccessTokenLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String? host,
  }) : super(
          preferencesService,
          "auth.host.$host.access_token",
          1,
          (json) => PleromaOAuthToken.fromJson(json),
        );
}
