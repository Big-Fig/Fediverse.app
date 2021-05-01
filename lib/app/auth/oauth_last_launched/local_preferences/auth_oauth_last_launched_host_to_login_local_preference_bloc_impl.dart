import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class AuthOAuthLastLaunchedHostToLoginLocalPreferenceBloc
    extends StringNullableLocalPreferenceBloc
    implements IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc {
  AuthOAuthLastLaunchedHostToLoginLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: "PleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc",
        );
}
