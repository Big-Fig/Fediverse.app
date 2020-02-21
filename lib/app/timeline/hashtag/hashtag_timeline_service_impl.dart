import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/timeline_service_impl.dart';
import 'package:flutter/widgets.dart';

import 'hashtag_timeline_service.dart';

class HashTagTimelineService extends TimelineService
    implements IHashTagTimelineService {
  final bool onlyLocal;
  final String localUrlHost;
  final String hashTag;

  @override
  ITimelineSettings get settings => TimelineSettings.hashTag(
      localPreferences: null,
      excludeVisibilities: [
        PleromaVisibility.DIRECT,
        PleromaVisibility.LIST,
        PleromaVisibility.UNLISTED
      ],
      onlyLocal: onlyLocal,
      notMuted: true,
      localUrlHost: localUrlHost,
      withHashTag: hashTag);

  HashTagTimelineService({
    @required IPleromaTimelineService pleromaTimelineService,
    @required IStatusRepository statusRepository,
    @required TimelineLocalPreferences timelineLocalPreferences,
    @required this.onlyLocal,
    @required this.localUrlHost,
    @required this.hashTag,
  }) : super(
            pleromaTimelineService: pleromaTimelineService,
            timelineLocalPreferences: timelineLocalPreferences,
            statusRepository: statusRepository);
}
