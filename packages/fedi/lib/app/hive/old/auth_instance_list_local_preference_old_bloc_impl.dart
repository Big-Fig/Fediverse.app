import 'package:fedi/app/hive/old/auth_instance_list_local_preference_old_bloc.dart';
import 'package:fedi/app/hive/old/auth_instance_list_old_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class AuthInstanceListLocalPreferenceBlocOld
    extends ObjectLocalPreferenceBloc<AuthInstanceListOld?>
    implements IAuthInstanceListLocalPreferenceBlocOld {
  static const AuthInstanceListOld? defaultValue = null;

  AuthInstanceListLocalPreferenceBlocOld(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'instance.list',
          schemaVersion: 1,
          jsonConverter: (json) => AuthInstanceListOld.fromJson(json),
        );

  @override
  AuthInstanceListOld? get defaultPreferenceValue => defaultValue;
}
