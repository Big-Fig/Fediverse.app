import 'package:fedi/app/auth/host/auth_host_application_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/api/application/pleroma_application_model.dart';

class AuthHostApplicationLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<PleromaClientApplication?>
    implements IAuthHostApplicationLocalPreferenceBloc {
  AuthHostApplicationLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String? host,
  }) : super(
          preferencesService: preferencesService,
          key: "auth.host.$host.application",
          schemaVersion: 1,
          jsonConverter: (json) => PleromaClientApplication.fromJson(json),
        );

  @override
  PleromaClientApplication? get defaultPreferenceValue => null;
}
