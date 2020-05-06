import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_media_widget.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_timeline_widget.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/collapsible/collapsible_bloc.dart';
import 'package:fedi/refactored/collapsible/collapsible_bloc_impl.dart';
import 'package:fedi/refactored/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
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
                  StatusPaginationListTimelineWidget(
                    key: PageStorageKey<String>(
                        key.toString() + "TimelinePaginationListSimpleWidget"),
                    needWatchLocalRepositoryForUpdates: true,
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
