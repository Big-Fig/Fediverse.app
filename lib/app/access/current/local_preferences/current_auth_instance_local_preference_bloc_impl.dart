import 'package:fedi/app/access/current/local_preferences/current_auth_instance_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

class CurrentUnifediApiAccessLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<UnifediApiAccess?>
    implements ICurrentUnifediApiAccessLocalPreferenceBloc {
  static const UnifediApiAccess? defaultValue = null;

  CurrentUnifediApiAccessLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'instance.current',
          schemaVersion: 1,
          jsonConverter: (json) => UnifediApiAccess.fromJson(json),
        );

  @override
  UnifediApiAccess? get defaultPreferenceValue => defaultValue;
}
