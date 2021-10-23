import 'package:fedi/app/access/host/access_token/access_host_access_token_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AccessHostAccessTokenLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<UnifediApiOAuthToken?>
    implements IAccessHostAccessTokenLocalPreferenceBloc {
  AccessHostAccessTokenLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String host,
  }) : super(
          preferencesService: preferencesService,
          key: 'access.host.$host.access_token',
          schemaVersion: 1,
          jsonConverter: (json) => UnifediApiOAuthToken.fromJson(json),
        );

  static const UnifediApiOAuthToken? defaultValue = null;

  @override
  UnifediApiOAuthToken? get defaultPreferenceValue => defaultValue;
}
