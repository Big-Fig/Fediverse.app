import 'package:fedi/refactored/app/auth/instance/list/instance_list_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/list/instance_list_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';

class InstanceListLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<InstanceList>
    implements IInstanceListLocalPreferenceBloc {
  InstanceListLocalPreferenceBloc(ILocalPreferencesService preferencesService)
      : super(preferencesService, "instance.list", 1);
}
