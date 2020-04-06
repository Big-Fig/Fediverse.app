import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';

class CurrentAuthInstanceLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<AuthInstance>
    implements ICurrentAuthInstanceLocalPreferenceBloc {
  CurrentAuthInstanceLocalPreferenceBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "instance.current", 1);
}
