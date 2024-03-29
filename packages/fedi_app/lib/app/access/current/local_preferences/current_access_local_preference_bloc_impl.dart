import 'package:fedi_app/app/access/current/local_preferences/current_access_local_preference_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

class CurrentAccessLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<UnifediApiAccess?>
    implements ICurrentAccessLocalPreferenceBloc {
  static const UnifediApiAccess? defaultValue = null;

  CurrentAccessLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'access.current',
          schemaVersion: 1,
          jsonConverter: (json) => UnifediApiAccess.fromJson(json),
        );

  @override
  UnifediApiAccess? get defaultPreferenceValue => defaultValue;
}
