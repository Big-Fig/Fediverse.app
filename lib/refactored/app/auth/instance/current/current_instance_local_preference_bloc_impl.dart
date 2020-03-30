import 'package:fedi/refactored/app/auth/instance/current/current_instance_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';

class CurrentInstanceLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<Instance>
    implements ICurrentInstanceLocalPreferenceBloc {
  CurrentInstanceLocalPreferenceBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "instance.current", 1);
}
