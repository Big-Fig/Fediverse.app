import 'package:fedi/app/timeline/create/create_timeline_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:flutter/widgets.dart';

class CreateTimelineBlocTimelineSettingsBloc
    extends TimelineSettingsBloc {
  final ICreateTimelineBloc
      createTimelineBloc;

  CreateTimelineBlocTimelineSettingsBloc({
    @required this.createTimelineBloc,
    @required TimelineSettings originalSettings,
  }) : super(originalSettings: originalSettings) {
    addDisposable(
      streamSubscription: timelineSettingsStream.listen(
        (timelineSettings) {
          createTimelineBloc.timelineSettingsFieldBloc
              .changeCurrentValue(timelineSettings);
        },
      ),
    );
  }
}
