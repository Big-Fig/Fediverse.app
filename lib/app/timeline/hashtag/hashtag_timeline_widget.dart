import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/hashTag/hashTag_timeline_service_impl.dart';
import 'package:fedi/app/timeline/hashtag/hashtag_timeline_service_impl.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/public/public_timeline_service_impl.dart';
import 'package:fedi/app/timeline/timeline_service.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:flutter/widgets.dart';

class HashTagTimelineWidget extends TimelineWidget {
  final String hashTag;

  HashTagTimelineWidget(
      {@required bool onlyLocal,
      @required String localUrlHost,
      this.hashTag})
      : super(localUrlHost: localUrlHost, onlyLocal: onlyLocal);

  @override
  ITimelineService createTimelineService(
      {@required BuildContext context,
      @required TimelineLocalPreferences timelinePreferences,
      @required IStatusRepository statusRepository,
      @required IPleromaTimelineService pleromaTimelineService}) {
    return HashTagTimelineService(
        pleromaTimelineService: pleromaTimelineService,
        timelineLocalPreferences: timelinePreferences,
        statusRepository: statusRepository,
        localUrlHost: localUrlHost,
        onlyLocal: onlyLocal,
        hashTag: hashTag);
  }
}
