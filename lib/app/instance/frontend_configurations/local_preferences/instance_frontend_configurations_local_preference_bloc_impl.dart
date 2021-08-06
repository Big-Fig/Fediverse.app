import 'package:fedi/app/instance/frontend_configurations/local_preferences/instance_frontend_configurations_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class InstanceFrontendConfigurationsLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<IPleromaApiFrontendConfigurations?>
    implements IInstanceFrontendConfigurationsLocalPreferenceBloc {
  InstanceFrontendConfigurationsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: '$userAtHost.frontend_configurations',
          schemaVersion: 1,
          jsonConverter: (json) =>
              PleromaApiFrontendConfigurations.fromJson(json),
        );

  static const defaultValue = null;

  @override
  PleromaApiFrontendConfigurations? get defaultPreferenceValue => defaultValue;
}
