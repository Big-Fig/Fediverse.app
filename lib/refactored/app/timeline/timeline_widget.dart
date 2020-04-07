import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_media_widget.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_timeline_widget.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("timeline_widget.dart");

class TimelineWidget extends StatelessWidget {
  TimelineWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelineLocalPreferencesBloc =
        ITimelineLocalPreferencesBloc.of(context, listen: false);

    return InitialDataStreamBuilder<bool>(
        stream: timelineLocalPreferencesBloc.stream
            .map((timelineLocalPreferences) =>
                timelineLocalPreferences?.onlyWithMedia == true)
            .distinct(),
        initialData: timelineLocalPreferencesBloc.value?.onlyWithMedia,
        builder: (context, snapshot) {
          var onlyWithMedia = snapshot.data;

          if (onlyWithMedia == null) {
            return SizedBox.shrink();
          }

          Widget bodyWidget;

          if (onlyWithMedia == true) {
            bodyWidget = StatusPaginationListMediaWidget(
                key: PageStorageKey<String>(
                    this.key.toString() + "TimelinePaginationListMediaWidget"));
          } else {
            bodyWidget = StatusPaginationListTimelineWidget(
              key: PageStorageKey<String>(
                  this.key.toString() + "TimelinePaginationListSimpleWidget"),
              needWatchLocalRepositoryForUpdates: true,
            );
          }

          _logger.fine(() => "build onlyWithMedia=$onlyWithMedia");

          return bodyWidget;
        });
  }
}
