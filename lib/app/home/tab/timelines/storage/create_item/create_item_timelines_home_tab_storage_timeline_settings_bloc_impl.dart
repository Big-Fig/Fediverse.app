import 'package:fedi/app/home/tab/timelines/storage/create_item/create_item_timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:flutter/widgets.dart';

class CreateItemTimelinesHomeTabStorageBlocTimelineSettingsBloc
    extends TimelineSettingsBloc {
  final ICreateItemTimelinesHomeTabStorageBloc
      createItemTimelinesHomeTabStorageBloc;

  CreateItemTimelinesHomeTabStorageBlocTimelineSettingsBloc({
    @required this.createItemTimelinesHomeTabStorageBloc,
    @required TimelineSettings originalSettings,
  }) : super(originalSettings: originalSettings) {
    addDisposable(
      streamSubscription: timelineSettingsStream.listen(
        (timelineSettings) {
          createItemTimelinesHomeTabStorageBloc.timelineSettingsFieldBloc
              .changeCurrentValue(timelineSettings);
        },
      ),
    );
  }
}
