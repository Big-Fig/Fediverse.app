import 'package:fedi/refactored/app/push/local_preferences/push_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/push/local_preferences/push_local_preferences_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';

class PushLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<PushLocalPreferences>
    implements IPushLocalPreferencesBloc {
  PushLocalPreferencesBloc(ILocalPreferencesService preferencesService,
      String userAtHost)
      : super(preferencesService, "$userAtHost.push.display", 1);

  PushLocalPreferences get defaultValue => PushLocalPreferences
    (onlyNoReplies: false, onlyWithMedia: false, onlyNoNsfwSensitive: false);
}
