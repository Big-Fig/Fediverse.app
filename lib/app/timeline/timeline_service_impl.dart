import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/timeline_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class TimelineService extends DisposableOwner implements ITimelineService {
  final IPleromaTimelineService pleromaTimelineService;
  final TimelineLocalPreferences timelineLocalPreferences;
  TimelineService(
      {@required this.pleromaTimelineService,
      @required this.timelineLocalPreferences});

  @override
  Future<List<IStatus>> loadStatuses() {
    // TODO: implement loadStatuses
    throw UnimplementedError();
  }
}
