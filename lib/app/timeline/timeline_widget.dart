import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_media_widget.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_simple_widget.dart';
import 'package:fedi/app/timeline/timeline_service.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';

abstract class TimelineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var timelinePreferencesBloc =
        ITimelineLocalPreferencesBloc.of(context, listen: true);

    return StreamBuilder<TimelineLocalPreferences>(
        stream: timelinePreferencesBloc.stream,
        initialData: timelinePreferencesBloc.value,
        builder: (context, snapshot) {
          var timelinePreferences = snapshot.data;

          var bodyWidget;

          if (timelinePreferences.showStatusesWithMediaOnly == true) {
            bodyWidget = TimelinePaginationMediaListWidget();
          } else {
            bodyWidget = TimelinePaginationSimpleListWidget();
          }

          return DisposableProvider(
              create: (BuildContext context) {
                var pleromaTimelineService =
                    IPleromaTimelineService.of(context, listen: true);

                return createTimelineService(
                    context: context,
                    timelinePreferences: timelinePreferences,
                    pleromaTimelineService: pleromaTimelineService);
              },
              child: bodyWidget);
        });
  }

  ITimelineService createTimelineService(
      {@required BuildContext context,
      @required TimelineLocalPreferences timelinePreferences,
      @required IPleromaTimelineService pleromaTimelineService});
}
