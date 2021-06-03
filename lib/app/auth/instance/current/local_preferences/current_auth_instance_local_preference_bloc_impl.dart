import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/local_preferences/current_auth_instance_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class CurrentAuthInstanceLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<AuthInstance?>
    implements ICurrentAuthInstanceLocalPreferenceBloc {
  static const AuthInstance? defaultValue = null;

  CurrentAuthInstanceLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: "instance.current",
          schemaVersion: 1,
          jsonConverter: (json) => AuthInstance.fromJson(json),
        );

  @override
  AuthInstance? get defaultPreferenceValue => defaultValue;
}
