import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineLocalPreferencesBloc
    implements LocalPreferenceBloc<TimelineLocalPreferences> {
  static ITimelineLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelineLocalPreferencesBloc>(context, listen: listen);
}
