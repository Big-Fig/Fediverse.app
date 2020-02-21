import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class TimelineLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<TimelineLocalPreferences>
    implements ITimelineLocalPreferencesBloc {
  TimelineLocalPreferencesBloc(ILocalPreferencesService preferencesService)
      : super(preferencesService, "timeline.display", 1);
}
