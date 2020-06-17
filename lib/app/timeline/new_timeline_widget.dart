import 'package:fedi/app/status/pagination/list/status_pagination_list_media_widget.dart';
import 'package:fedi/app/status/pagination/list/status_pagination_list_timeline_widget.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/collapsible/collapsible_bloc.dart';
import 'package:fedi/collapsible/collapsible_bloc_impl.dart';
import 'package:fedi/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("timeline_widget.dart");

class NewTimelineWidget extends StatelessWidget {
  const NewTimelineWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelineLocalPreferencesBloc =
        ITimelineLocalPreferencesBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: timelineLocalPreferencesBloc.stream
            .map((timelineLocalPreferences) =>
                timelineLocalPreferences?.onlyWithMedia == true)
            .distinct(),
        initialData: timelineLocalPreferencesBloc.value?.onlyWithMedia == true,
        builder: (context, snapshot) {
          var onlyWithMedia = snapshot.data;

          Widget bodyWidget;

          if (onlyWithMedia == true) {
            bodyWidget = StatusPaginationListMediaWidget();
          } else {
            bodyWidget = DisposableProvider<ICollapsibleBloc>(
              create: (context) => CollapsibleBloc.createFromContext(context),
              child: Stack(
                children: <Widget>[
                  StatusPaginationListTimelineWidget(
                    forceFirstItemPadding: true,
                    needWatchLocalRepositoryForUpdates: true,
                  ),
                  Align(
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
