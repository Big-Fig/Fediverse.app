import 'package:fedi/app/auth/host/application/auth_host_application_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AuthHostApplicationLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<UnifediApiClientApplication?>
    implements IAuthHostApplicationLocalPreferenceBloc {
  AuthHostApplicationLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String host,
  }) : super(
          preferencesService: preferencesService,
          key: 'auth.host.$host.application',
          schemaVersion: 1,
          jsonConverter: (json) => UnifediApiClientApplication.fromJson(json),
        );

  static const UnifediApiClientApplication? defaultValue = null;

  @override
  UnifediApiClientApplication? get defaultPreferenceValue => defaultValue;
}
