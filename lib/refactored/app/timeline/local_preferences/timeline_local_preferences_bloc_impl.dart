import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';

class TimelineLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<TimelineLocalPreferences>
    implements ITimelineLocalPreferencesBloc {
  TimelineLocalPreferencesBloc(
      ILocalPreferencesService preferencesService, String userAtHost)
      : super(preferencesService, "$userAtHost.timeline.display", 1);

  TimelineLocalPreferences get defaultValue => TimelineLocalPreferences(
      onlyNoReplies: false, onlyWithMedia: false, onlyNoNsfwSensitive: false);
}
