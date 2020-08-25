import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class TimelineSettingsLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<TimelineSettingsLocalPreferences>
    implements ITimelineSettingsLocalPreferencesBloc {
  TimelineSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService, String userAtHost)
      : super(preferencesService, "$userAtHost.timeline.display", 1);

  @override
  TimelineSettingsLocalPreferences get defaultValue => TimelineSettingsLocalPreferences(
      onlyNoReplies: false, onlyWithMedia: false, onlyNoNsfwSensitive: false);
}
