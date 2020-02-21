import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/public/public_timeline_service.dart';
import 'package:fedi/app/timeline/timeline_service_impl.dart';
import 'package:flutter/widgets.dart';

class PublicTimelineService extends TimelineService
    implements IPublicTimelineService {
  PublicTimelineService(
      {@required IPleromaTimelineService pleromaTimelineService,
      @required TimelineLocalPreferences timelineLocalPreferences})
      : super(
            pleromaTimelineService: pleromaTimelineService,
            timelineLocalPreferences: timelineLocalPreferences);
}
