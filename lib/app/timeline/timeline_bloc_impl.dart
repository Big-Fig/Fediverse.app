import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class TimelineBloc extends DisposableOwner implements ITimelineBloc {
  final Timeline timeline;

  final ITimelineSettingsLocalPreferencesBloc
      timelineSettingsLocalPreferencesBloc;

  TimelineBloc({
    @required ILocalPreferencesService preferencesService,
    @required this.timeline,
    @required AuthInstance currentInstance,
  }) : timelineSettingsLocalPreferencesBloc =
            TimelineSettingsLocalPreferencesBloc.byId(
          preferencesService,
          userAtHost: currentInstance.userAtHost,
          timelineId: timeline.timelineSettingsId,
        ) {
    addDisposable(disposable: timelineSettingsLocalPreferencesBloc);
  }

  @override
  Timeline get item => timeline;

  @override
  Stream<Timeline> get itemStream => Stream.value(timeline);

  @override
  String get label => item.label;

  @override
  Stream<String> get labelStream => itemStream.map((item) => item.label);

  @override
  TimelineSettings get settings => timelineSettingsLocalPreferencesBloc.value;

  @override
  Stream<TimelineSettings> get settingsStream =>
      timelineSettingsLocalPreferencesBloc.stream;
}
