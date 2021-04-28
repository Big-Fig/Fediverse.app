import 'package:fedi/app/auth/host/application/auth_host_application_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';

class AuthHostApplicationLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<PleromaApiClientApplication?>
    implements IAuthHostApplicationLocalPreferenceBloc {
  AuthHostApplicationLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String host,
  }) : super(
          preferencesService: preferencesService,
          key: "auth.host.$host.application",
          schemaVersion: 1,
          jsonConverter: (json) => PleromaApiClientApplication.fromJson(json),
        );

  static const PleromaApiClientApplication? defaultValue = null;

  @override
  PleromaApiClientApplication? get defaultPreferenceValue => defaultValue;
}
