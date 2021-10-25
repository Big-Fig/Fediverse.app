import 'package:fedi_app/app/access/host/application/access_host_application_local_preference_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AccessHostApplicationLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<UnifediApiClientApplication?>
    implements IAccessHostApplicationLocalPreferenceBloc {
  AccessHostApplicationLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String host,
  }) : super(
          preferencesService: preferencesService,
          key: 'access.host.$host.application',
          schemaVersion: 1,
          jsonConverter: (json) => UnifediApiClientApplication.fromJson(json),
        );

  static const UnifediApiClientApplication? defaultValue = null;

  @override
  UnifediApiClientApplication? get defaultPreferenceValue => defaultValue;
}
