import 'package:fedi_app/app/auth/oauth_last_launched/local_preferences/access_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class AccessOAuthLastLaunchedHostToLoginLocalPreferenceBloc
    extends StringNullableLocalPreferenceBloc
    implements IAccessApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc {
  AccessOAuthLastLaunchedHostToLoginLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'PleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc',
        );
}
