import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_media_widget.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/collapsible/collapsible_owner_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("timeline_widget.dart");

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelineLocalPreferencesBloc =
        ITimelineLocalPreferencesBloc.of(context, listen: false);

    var timeline = timelineLocalPreferencesBloc.value?.onlyWithMedia;
    return Container(
      color: FediColors.offWhite,
      child: StreamBuilder<bool>(
          stream: timelineLocalPreferencesBloc.stream
              .map((timeline) =>
                  timeline?.onlyWithMedia == true)
              .distinct(),
          initialData:
              timeline == true,
          builder: (context, snapshot) {
            var onlyWithMedia = snapshot.data;

            Widget bodyWidget;

            if (onlyWithMedia == true) {
              bodyWidget = StatusCachedPaginationListMediaWidget();
            } else {
              bodyWidget = CollapsibleOwnerWidget(
                child: StatusCachedPaginationListTimelineWidget(
                  forceFirstItemPadding: true,
                  needWatchLocalRepositoryForUpdates: true,
                ),
              );
            }

            _logger.fine(() => "build onlyWithMedia=$onlyWithMedia");

            return bodyWidget;
          }),
    );
  }
}
