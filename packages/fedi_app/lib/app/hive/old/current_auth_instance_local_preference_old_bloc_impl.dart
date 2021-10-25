import 'package:fedi_app/app/hive/old/auth_instance_old_model.dart';
import 'package:fedi_app/app/hive/old/current_auth_instance_local_preference_old_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class CurrentAuthInstanceOldLocalPreferenceBlocOld
    extends ObjectLocalPreferenceBloc<AuthInstanceOld?>
    implements ICurrentAuthInstanceOldLocalPreferenceBlocOld {
  static const AuthInstanceOld? defaultValue = null;

  CurrentAuthInstanceOldLocalPreferenceBlocOld(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'instance.current',
          schemaVersion: 1,
          jsonConverter: (json) => AuthInstanceOld.fromJson(json),
        );

  @override
  AuthInstanceOld? get defaultPreferenceValue => defaultValue;
}
