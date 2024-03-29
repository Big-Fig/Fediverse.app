import 'package:fedi_app/app/hive/old/auth_host_access_token_local_preference_old_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:pleroma_api/pleroma_api.dart';

class AuthHostAccessTokenLocalPreferenceBlocOld
    extends ObjectLocalPreferenceBloc<PleromaApiOAuthToken?>
    implements IAuthHostAccessTokenLocalPreferenceBlocOld {
  AuthHostAccessTokenLocalPreferenceBlocOld(
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
