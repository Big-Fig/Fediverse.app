import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class TimelineSettingsBloc extends DisposableOwner
    implements ITimelineSettingsBloc {
  final ITimelineLocalPreferencesBloc timelineLocalPreferencesBloc;

  TimelineSettingsBloc({
    @required this.timelineLocalPreferencesBloc,
  });

  @override
  TimelineSettings get settingsData =>
      timelineLocalPreferencesBloc.value?.settings;

  @override
  Stream<TimelineSettings> get settingsDataStream =>
      timelineLocalPreferencesBloc.stream.map((event) => null);

  @override
  Future updateSettings(TimelineSettings newSettings) async {
    var currentTimeline = timelineLocalPreferencesBloc.value;
    var currentTimelineSettings = currentTimeline?.settings;
    if (currentTimelineSettings != newSettings && currentTimeline != null) {
      await timelineLocalPreferencesBloc.setValue(
        currentTimeline.copyWith(settings: newSettings),
      );
    }
  }
}
