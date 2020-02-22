import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/timeline_service_impl.dart';
import 'package:flutter/widgets.dart';

import 'hashtag_timeline_service.dart';

class HashtagTimelineService extends TimelineService
    implements IHashtagTimelineService {
  final bool onlyLocal;
  final String localUrlHost;
  final String hashtag;

  @override
  ITimelineSettings get settings => TimelineSettings.hashtag(
      localPreferences: null,
      excludeVisibilities: [
        PleromaVisibility.DIRECT,
        PleromaVisibility.LIST,
        PleromaVisibility.UNLISTED
      ],
      onlyLocal: onlyLocal,
      notMuted: true,
      localUrlHost: localUrlHost,
      withHashtag: hashtag);

  HashtagTimelineService({
    @required IPleromaTimelineService pleromaTimelineService,
    @required IStatusRepository statusRepository,
    @required TimelineLocalPreferences timelineLocalPreferences,
    @required this.onlyLocal,
    @required this.localUrlHost,
    @required this.hashtag,
  }) : super(
            pleromaTimelineService: pleromaTimelineService,
            timelineLocalPreferences: timelineLocalPreferences,
            statusRepository: statusRepository);
}
