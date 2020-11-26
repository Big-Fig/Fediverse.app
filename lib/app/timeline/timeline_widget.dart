import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_media_widget.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_widget.dart';
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
      color: IFediUiColorTheme.of(context).offWhite,
      child: StreamBuilder<bool>(
          stream: timelineLocalPreferencesBloc.stream
              .map((timeline) => timeline?.onlyWithMedia == true),
          builder: (context, snapshot) {
            var onlyWithMedia = snapshot.data;

            if (onlyWithMedia == null) {
              return const Center(
                child: FediCircularProgressIndicator(),
              );
            }

            var timeline = timelineLocalPreferencesBloc.value;
            // var onlyWithMedia = timeline?.onlyWithMedia == true;

            _logger.finest(() => "timeline $timeline");
            _logger.finest(() => "onlyWithMedia $onlyWithMedia");
            // _logger.finest(() => "onlyWithMedia timeline $timeline");

            Widget bodyWidget;

            if (onlyWithMedia == true) {
              bodyWidget = const StatusCachedPaginationListMediaWidget();
            } else {
              bodyWidget = const CollapsibleOwnerWidget(
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
