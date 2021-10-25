import 'package:fedi_app/app/access/local_preferences/access_local_preference_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AccessLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<UnifediApiAccess?>
    implements IAccessLocalPreferenceBloc {
  static const UnifediApiAccess? defaultValue = null;

  AccessLocalPreferenceBloc({
    required ILocalPreferencesService preferencesService,
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: '$userAtHost.access',
          schemaVersion: 1,
          jsonConverter: (json) => UnifediApiAccess.fromJson(json),
        );

  @override
  UnifediApiAccess? get defaultPreferenceValue => defaultValue;
}
