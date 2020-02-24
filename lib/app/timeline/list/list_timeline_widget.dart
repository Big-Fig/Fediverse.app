import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/list/list_timeline_service_impl.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/timeline_service.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:flutter/widgets.dart';

class ListTimelineWidget extends TimelineHomePage {
  final String listRemoteId;

  ListTimelineWidget(
      {@required bool onlyLocal,
      @required String localUrlHost,
      this.listRemoteId})
      : super(localUrlHost: localUrlHost, onlyLocal: onlyLocal);

  @override
  ITimelineService createTimelineService(
      {@required BuildContext context,
      @required TimelineLocalPreferences timelinePreferences,
      @required IStatusRepository statusRepository,
      @required IPleromaTimelineService pleromaTimelineService}) {
    return ListTimelineService(
        pleromaTimelineService: pleromaTimelineService,
        timelineLocalPreferences: timelinePreferences,
        statusRepository: statusRepository,
        localUrlHost: localUrlHost,
        onlyLocal: onlyLocal,
        listRemoteId: listRemoteId);
  }
}
