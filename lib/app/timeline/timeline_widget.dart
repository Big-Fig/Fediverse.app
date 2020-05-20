import 'package:fedi/app/status/pagination/list/status_pagination_list_media_widget.dart';
import 'package:fedi/app/status/pagination/list/status_pagination_list_timeline_widget.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_header_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/collapsible/collapsible_bloc.dart';
import 'package:fedi/collapsible/collapsible_bloc_impl.dart';
import 'package:fedi/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("timeline_widget.dart");

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelineLocalPreferencesBloc =
        ITimelineLocalPreferencesBloc.of(context, listen: false);

    return StreamBuilder<bool>(
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
                    key.toString() + "TimelinePaginationListMediaWidget"));
          } else {
            bodyWidget = DisposableProvider<ICollapsibleBloc>(
              create: (context) => CollapsibleBloc.createFromContext(context),
              child: Stack(
                children: <Widget>[
                  const StatusPaginationListTimelineWidget(
                    key: PageStorageKey<String>(
                        "TimelinePaginationListSimpleWidget"),
                    header: FediListTile(
                      isFirstInList: true,
                      child: TimelineHeaderWidget(),
                    ),
                    alwaysShowHeader: true,
                    needWatchLocalRepositoryForUpdates: true,
                  ),
                  const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ToggleCollapsibleOverlayWidget(),
                      ))
                ],
              ),
            );
          }

          _logger.fine(() => "build onlyWithMedia=$onlyWithMedia");

          return bodyWidget;
        });
  }
}
