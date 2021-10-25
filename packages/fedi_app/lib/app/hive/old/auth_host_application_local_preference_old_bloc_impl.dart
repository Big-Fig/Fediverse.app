import 'package:fedi_app/app/hive/old/auth_host_application_local_preference_old_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:pleroma_api/pleroma_api.dart';

class AuthHostApplicationLocalPreferenceBlocOld
    extends ObjectLocalPreferenceBloc<PleromaApiClientApplication?>
    implements IAuthHostApplicationLocalPreferenceBlocOld {
  AuthHostApplicationLocalPreferenceBlocOld(
    ILocalPreferencesService preferencesService, {
    required String host,
  }) : super(
          preferencesService: preferencesService,
          key: 'auth.host.$host.application',
          schemaVersion: 1,
          jsonConverter: (json) => PleromaApiClientApplication.fromJson(json),
        );

  static const PleromaApiClientApplication? defaultValue = null;

  @override
  PleromaApiClientApplication? get defaultPreferenceValue => defaultValue;
}
