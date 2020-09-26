import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_bloc.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class TimelineBloc extends DisposableOwner implements ITimelineBloc {
  @override
  Timeline get timeline => timelineLocalPreferencesBloc.value;

  @override
  Stream<Timeline> get timelineStream => throw UnimplementedError();

  final ITimelineLocalPreferencesBloc timelineLocalPreferencesBloc;

  TimelineBloc({
    @required ILocalPreferencesService preferencesService,
    @required Timeline timeline,
    @required AuthInstance currentInstance,
  }) : timelineLocalPreferencesBloc = TimelineLocalPreferencesBloc.byId(
          preferencesService,
          userAtHost: currentInstance.userAtHost,
          timelineId: timeline.id,
        ) {
    addDisposable(disposable: timelineLocalPreferencesBloc);
  }

  @override
  TimelineSettings get settings => timeline?.settings;

  @override
  Stream<TimelineSettings> get settingsStream =>
      timelineStream.map((timeline) => timeline?.settings);
}
