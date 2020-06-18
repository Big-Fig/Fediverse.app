import 'package:fedi/app/status/pagination/list/status_pagination_list_media_widget.dart';
import 'package:fedi/app/status/pagination/list/status_pagination_list_timeline_widget.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
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

    return Container(
      color: FediColors.offWhite,
      child: StreamBuilder<bool>(
          stream: timelineLocalPreferencesBloc.stream
              .map((timelineLocalPreferences) =>
                  timelineLocalPreferences?.onlyWithMedia == true)
              .distinct(),
          initialData:
              timelineLocalPreferencesBloc.value?.onlyWithMedia == true,
          builder: (context, snapshot) {
            var onlyWithMedia = snapshot.data;

            Widget bodyWidget;

            if (onlyWithMedia == true) {
              bodyWidget = StatusPaginationListMediaWidget();
            } else {
              bodyWidget = CollapsibleOwnerWidget(
                child: StatusPaginationListTimelineWidget(
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
