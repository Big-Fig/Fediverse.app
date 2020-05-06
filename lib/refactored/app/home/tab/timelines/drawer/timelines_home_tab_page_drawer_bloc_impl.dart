import 'package:fedi/refactored/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_bloc.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/cupertino.dart';

class TimelinesHomeTabPageDrawerBloc extends DisposableOwner
    implements ITimelinesHomeTabPageDrawerBloc {
  final ITimelineLocalPreferencesBloc localPreferencesBloc;

  TimelineLocalPreferences get preferences => localPreferencesBloc.value;

  Stream<TimelineLocalPreferences> get preferencesStream =>
      localPreferencesBloc.stream;

  @override
  bool get onlyNoNsfwSensitive => preferences?.onlyNoNsfwSensitive;

  @override
  Stream<bool> get onlyNoNsfwSensitiveStream =>
      preferencesStream.map((preferences) => preferences?.onlyNoNsfwSensitive);

  @override
  bool get onlyNoReplies => preferences?.onlyNoReplies;

  @override
  Stream<bool> get onlyNoRepliesStream =>
      preferencesStream.map((preferences) => preferences?.onlyNoReplies);

  @override
  bool get onlyWithMedia => preferences?.onlyWithMedia;

  @override
  Stream<bool> get onlyWithMediaStream =>
      preferencesStream.map((preferences) => preferences?.onlyWithMedia);

  TimelinesHomeTabPageDrawerBloc({@required this.localPreferencesBloc});

  @override
  void changeOnlyNoNsfwSensitive(bool value) {
    localPreferencesBloc
        .setValue(preferences.copyWith(onlyNoNsfwSensitive: value));
  }

  @override
  void changeOnlyNoReplies(bool value) {
    localPreferencesBloc.setValue(preferences.copyWith(onlyNoReplies: value));
  }

  @override
  void changeOnlyWithMedia(bool value) {
    localPreferencesBloc.setValue(preferences.copyWith(onlyWithMedia: value));
  }
}
