import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
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

class TimelineWidget extends StatelessWidget {
  final Key tabKey;
  const TimelineWidget({@required this.tabKey, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelineLocalPreferencesBloc =
        ITimelineLocalPreferencesBloc.of(context, listen: false);

//    return NestedScrollViewInnerScrollPositionKeyWidget(
//      tabKey,
//      ListView.builder(
//          physics: const ClampingScrollPhysics(),
//          itemBuilder: (BuildContext c, int i) {
//            return Container(
//              //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
//              alignment: Alignment.center,
//              height: 60.0,
//              width: double.infinity,
//              //color: Colors.blue,
//              child: Text(tabKey.toString() + ': List$i'),
//            );
//          },
//          itemCount: 100,
//          padding: const EdgeInsets.all(0.0)),
//    );

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
            bodyWidget = StatusPaginationListMediaWidget(
                key: PageStorageKey<String>(
                    key.toString() + "TimelinePaginationListMediaWidget"));
          } else {
            bodyWidget = DisposableProvider<ICollapsibleBloc>(
              create: (context) => CollapsibleBloc.createFromContext(context),
              child: Stack(
                children: <Widget>[
//                  NestedScrollViewInnerScrollPositionKeyWidget(
//                    tabKey,
//                    ListView.builder(
//                        physics: const ClampingScrollPhysics(),
//                        itemBuilder: (BuildContext c, int i) {
//                          return Container(
//                            //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
//                            alignment: Alignment.center,
//                            height: 60.0,
//                            width: double.infinity,
//                            //color: Colors.blue,
//                            child: Text(tabKey.toString() + ': List$i'),
//                          );
//                        },
//                        itemCount: 100,
//                        padding: const EdgeInsets.all(0.0)),
//                  ),
                  NestedScrollViewInnerScrollPositionKeyWidget(
                      tabKey,
                      StatusPaginationListTimelineWidget(
                        forceFirstItemPadding: true,
//                    key: PageStorageKey<String>(
//                        "TimelinePaginationListSimpleWidget"),
                        needWatchLocalRepositoryForUpdates: true,
                      )),
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
