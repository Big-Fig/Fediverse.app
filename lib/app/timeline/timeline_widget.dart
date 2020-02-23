import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_bloc.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_bloc_impl.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_media_widget.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_simple_widget.dart';
import 'package:fedi/app/timeline/pagination/timeline_pagination_bloc.dart';
import 'package:fedi/app/timeline/pagination/timeline_pagination_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_service.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class TimelineWidget extends StatelessWidget {
  final bool onlyLocal;
  final String localUrlHost;

  TimelineWidget({@required this.onlyLocal, @required this.localUrlHost});

  @override
  Widget build(BuildContext context) {
    var timelinePreferencesBloc =
        ITimelineLocalPreferencesBloc.of(context, listen: true);

    return StreamBuilder<TimelineLocalPreferences>(
        stream: timelinePreferencesBloc.stream,
        initialData: timelinePreferencesBloc.value,
        builder: (context, snapshot) {
          var timelinePreferences = snapshot.data;

          Widget bodyWidget;

          if (timelinePreferences?.onlyMedia == true) {
            bodyWidget = TimelinePaginationMediaListWidget();
          } else {
            bodyWidget = TimelinePaginationSimpleListWidget();
          }

          return DisposableProvider<ITimelineService>(
              create: (BuildContext context) {
                var pleromaTimelineService =
                    IPleromaTimelineService.of(context, listen: false);

                return createTimelineService(
                    context: context,
                    timelinePreferences: timelinePreferences,
                    pleromaTimelineService: pleromaTimelineService,
                    statusRepository:
                        IStatusRepository.of(context, listen: false));
              },
              child: Provider<ITimelinePaginationBloc>(
                create: (BuildContext context) {
                  var timelineService =
                      ITimelineService.of(context, listen: false);

                  return TimelinePaginationBloc(
                      timelineService: timelineService,
                      itemsCountPerPage: 20,
                      maximumCachedPagesCount: null);
                },
                child: Provider<ITimelinePaginationListBloc>(
                    create: (BuildContext context) {
                      var timelinePaginationBloc =
                          ITimelinePaginationBloc.of(context, listen: false);

                      var timelinePaginationListBloc = TimelinePaginationListBloc(
                          timelinePaginationBloc: timelinePaginationBloc);
                      timelinePaginationListBloc.loadMore();
                      return timelinePaginationListBloc;
                    },
                    child: bodyWidget),
              ));
        });
  }

  ITimelineService createTimelineService(
      {@required BuildContext context,
      @required TimelineLocalPreferences timelinePreferences,
      @required IStatusRepository statusRepository,
      @required IPleromaTimelineService pleromaTimelineService});
}
