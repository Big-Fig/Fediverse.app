import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_model.dart';

class TimelineSettingsBloc extends DisposableOwner
    implements ITimelineSettingsBloc {
  final ITimelineLocalPreferenceBlocOld timelineLocalPreferencesBloc;

  TimelineSettingsBloc({
    required this.timelineLocalPreferencesBloc,
  });

  @override
  TimelineSettings? get settingsData =>
      timelineLocalPreferencesBloc.value?.settings;

  @override
  Stream<TimelineSettings?> get settingsDataStream =>
      timelineLocalPreferencesBloc.stream.map((event) => null);

  @override
  Future<void> updateSettings(TimelineSettings? newSettings) async {
    var currentTimeline = timelineLocalPreferencesBloc.value;
    var currentTimelineSettings = currentTimeline?.settings;
    if (currentTimelineSettings != newSettings &&
        currentTimeline != null &&
        newSettings != null) {
      await timelineLocalPreferencesBloc.setValue(
        currentTimeline.copyWith(settings: newSettings),
      );
    }
  }
}
