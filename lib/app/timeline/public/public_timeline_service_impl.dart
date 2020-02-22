import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/public/public_timeline_service.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/timeline_service_impl.dart';
import 'package:flutter/widgets.dart';

class PublicTimelineService extends TimelineService
    implements IPublicTimelineService {

  final bool onlyLocal;
  final String localUrlHost;


  @override
  ITimelineSettings get settings => TimelineSettings.public(
      localPreferences: null,
      excludeVisibilities: [
        PleromaVisibility.DIRECT,
        PleromaVisibility.LIST,
        PleromaVisibility.UNLISTED
      ],
      onlyLocal: onlyLocal,
      notMuted: true,
      localUrlHost: localUrlHost);

  PublicTimelineService({
    @required IPleromaTimelineService pleromaTimelineService,
    @required IStatusRepository statusRepository,
    @required TimelineLocalPreferences timelineLocalPreferences,
    @required this.onlyLocal,
    @required this.localUrlHost,
  }) : super(
            pleromaTimelineService: pleromaTimelineService,
            timelineLocalPreferences: timelineLocalPreferences,
            statusRepository: statusRepository);

  @override
  Future refresh() async {
    // nothing
  }
}
