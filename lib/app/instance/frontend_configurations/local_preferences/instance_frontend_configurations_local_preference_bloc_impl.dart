import 'package:fedi/app/instance/frontend_configurations/local_preferences/instance_frontend_configurations_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

class InstanceFrontendConfigurationsLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<IUnifediApiFrontendConfigurations?>
    implements IInstanceFrontendConfigurationsLocalPreferenceBloc {
  InstanceFrontendConfigurationsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: 'access.$userAtHost.frontend_configurations',
          schemaVersion: 1,
          jsonConverter: (json) =>
              UnifediApiFrontendConfigurations.fromJson(json),
        );

  static const UnifediApiFrontendConfigurations? defaultValue = null;

  @override
  UnifediApiFrontendConfigurations? get defaultPreferenceValue => defaultValue;
}
