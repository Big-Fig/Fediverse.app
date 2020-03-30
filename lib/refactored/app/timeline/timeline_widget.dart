import 'package:fedi/refactored/app/status/list/status_list_service.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_media_widget.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_timeline_widget.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("timeline_widget.dart");

class TimelineWidget extends StatelessWidget {
  TimelineWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelineLocalPreferencesBloc =
        ITimelineLocalPreferencesBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: timelineLocalPreferencesBloc.stream
            .map((timelineLocalPreferences) =>
                timelineLocalPreferences?.onlyWithMedia == true)
            .distinct(),
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
                key: PageStorageKey<String>(this.key.toString() +
                    "TimelinePaginationListSimpleWidget"));
          }

          _logger.fine(
              () => "build onlyWithMedia=$onlyWithMedia");

          return bodyWidget;
        });
  }
}
