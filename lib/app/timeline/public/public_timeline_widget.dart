import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/public/public_timeline_service_impl.dart';
import 'package:fedi/app/timeline/timeline_service.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:flutter/widgets.dart';

class PublicTimelineWidget extends TimelineWidget {


  @override
  ITimelineService createTimelineService(
      {@required BuildContext context,
      @required TimelineLocalPreferences timelinePreferences,
      @required IPleromaTimelineService pleromaTimelineService}) {
    return PublicTimelineService(
        pleromaTimelineService: pleromaTimelineService,
        timelineLocalPreferences: timelinePreferences);
  }
}
