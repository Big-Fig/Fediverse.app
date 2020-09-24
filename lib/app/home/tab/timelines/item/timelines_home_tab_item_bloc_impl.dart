import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/home/tab/timelines/item/timelines_home_tab_item_bloc.dart';
import 'package:fedi/app/home/tab/timelines/item/timelines_home_tab_item_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class TimelinesHomeTabItemBloc extends DisposableOwner
    implements ITimelinesHomeTabItemBloc {
  final TimelinesHomeTabItem timelinesHomeTabItem;

  final ITimelineSettingsLocalPreferencesBloc
      timelineSettingsLocalPreferencesBloc;

  TimelinesHomeTabItemBloc({
    @required ILocalPreferencesService preferencesService,
    @required this.timelinesHomeTabItem,
    @required AuthInstance currentInstance,
  }) : timelineSettingsLocalPreferencesBloc =
            TimelineSettingsLocalPreferencesBloc.byId(
          preferencesService,
          userAtHost: currentInstance.userAtHost,
          timelineId: timelinesHomeTabItem.timelineSettingsId,
        ) {
    addDisposable(disposable: timelineSettingsLocalPreferencesBloc);
  }

  @override
  TimelinesHomeTabItem get item => timelinesHomeTabItem;

  @override
  Stream<TimelinesHomeTabItem> get itemStream =>
      Stream.value(timelinesHomeTabItem);

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
