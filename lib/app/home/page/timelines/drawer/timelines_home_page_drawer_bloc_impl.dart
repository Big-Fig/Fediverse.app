import 'package:fedi/app/home/page/timelines/drawer/timelines_home_page_drawer_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:flutter/cupertino.dart';

class TimelinesHomePageDrawerBloc implements ITimelinesHomePageDrawerBloc {
  final ITimelineLocalPreferencesBloc localPreferencesBloc;

  TimelineLocalPreferences get preferences => localPreferencesBloc.value;

  Stream<TimelineLocalPreferences> get preferencesStream =>
      localPreferencesBloc.stream;

  @override
  bool get noNsfwSensitive => preferences?.noNsfwSensitive;

  @override
  Stream<bool> get noNsfwSensitiveStream =>
      preferencesStream.map((preferences) => preferences?.noNsfwSensitive);

  @override
  bool get noReplies => preferences?.noReplies;

  @override
  Stream<bool> get noRepliesStream =>
      preferencesStream.map((preferences) => preferences?.noReplies);

  @override
  bool get onlyMedia => preferences?.onlyMedia;

  @override
  Stream<bool> get onlyMediaStream =>
      preferencesStream.map((preferences) => preferences?.onlyMedia);

  TimelinesHomePageDrawerBloc({@required this.localPreferencesBloc});

  @override
  changeNoNsfwSensitive(bool value) {
    preferences.noNsfwSensitive = value;
    localPreferencesBloc.setValue(preferences);
  }

  @override
  changeNoReplies(bool value) {
    preferences.noReplies = value;
    localPreferencesBloc.setValue(preferences);
  }

  @override
  changeOnlyMedia(bool value) {
    preferences.onlyMedia = value;
    localPreferencesBloc.setValue(preferences);
  }
}
