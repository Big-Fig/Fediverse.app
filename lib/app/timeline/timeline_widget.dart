import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
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
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("timeline_widget.dart");

abstract class TimelineHomePage extends StatelessWidget {
  final bool onlyLocal;
  final String localUrlHost;

  TimelineHomePage({@required this.onlyLocal, @required this.localUrlHost});

  @override
  Widget build(BuildContext context) {
    TimelineLocalPreferences timelinePreferences =
        Provider.of<TimelineLocalPreferences>(context, listen: true);

    Widget bodyWidget;

    if (timelinePreferences?.onlyMedia == true) {
      bodyWidget = TimelinePaginationMediaListWidget();
    } else {
      bodyWidget = TimelinePaginationSimpleListWidget();
    }

    _logger.fine(() => "build timelinePreferences=$timelinePreferences");

    var pleromaTimelineService =
        IPleromaTimelineService.of(context, listen: false);

    return DisposableProxyProvider<TimelineLocalPreferences, ITimelineService>(
      update: (
        BuildContext context,
        TimelineLocalPreferences value,
        ITimelineService previous,
      ) {
        _logger.fine(() => "DisposableProxyProvider pleromaTimelineService "
            "rebuild \n"
            "\t value $value"
            "\t previous $previous");

        return createTimelineService(
            context: context,
            timelinePreferences: value,
            pleromaTimelineService: pleromaTimelineService,
            statusRepository: IStatusRepository.of(context, listen: false));
      },
      child: DisposableProxyProvider<ITimelineService, ITimelinePaginationBloc>(
        update: (BuildContext context, ITimelineService value,
            ITimelinePaginationBloc previous) {
          _logger.fine(() => "timelineService rebuild");

          return TimelinePaginationBloc(
              timelineService: value,
              itemsCountPerPage: 20,
              maximumCachedPagesCount: null);
        },
        child: DisposableProxyProvider<ITimelinePaginationBloc,
            ITimelinePaginationListBloc>(
          update: (BuildContext context, value, previous) {
            _logger.fine(() => "timelinePaginationBloc rebuild");

            var timelinePaginationListBloc =
                TimelinePaginationListBloc(timelinePaginationBloc: value);
            timelinePaginationListBloc.loadMore();
            return timelinePaginationListBloc;
          },
          child: bodyWidget,
        ),
      ),
    );
  }

  ITimelineService createTimelineService(
      {@required BuildContext context,
      @required TimelineLocalPreferences timelinePreferences,
      @required IStatusRepository statusRepository,
      @required IPleromaTimelineService pleromaTimelineService});
}

//class TimelineWidget extends StatelessWidget {
//
//
//}
