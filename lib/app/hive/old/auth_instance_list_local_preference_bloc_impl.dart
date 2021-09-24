import 'package:fedi/app/hive/old/auth_instance_list_local_preference_bloc.dart';
import 'package:fedi/app/hive/old/auth_instance_list_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class AuthInstanceListLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<AuthInstanceList?>
    implements IAuthInstanceListLocalPreferenceBloc {
  static const AuthInstanceList? defaultValue = null;

  AuthInstanceListLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'instance.list',
          schemaVersion: 1,
          jsonConverter: (json) => AuthInstanceList.fromJson(json),
        );

  @override
  AuthInstanceList? get defaultPreferenceValue => defaultValue;
}
