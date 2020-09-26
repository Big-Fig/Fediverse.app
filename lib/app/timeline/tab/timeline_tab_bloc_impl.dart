import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/status/timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/websockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:flutter/widgets.dart';

class TimelineTabBloc extends AsyncInitLoadingBloc implements ITimelineTabBloc {
  @override
  Timeline get timeline => timelineLocalPreferencesBloc.value;
  IStatusCachedListBloc statusCachedListService;
  IStatusCachedPaginationBloc statusCachedPaginationBloc;
  @override
  ITimelineLocalPreferencesBloc timelineLocalPreferencesBloc;

  @override
  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>, IStatus>
      paginationListWithNewItemsBloc;

  final IPleromaAccountService pleromaAccountService;
  final IPleromaTimelineService pleromaTimelineService;
  final IStatusRepository statusRepository;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;
  final bool listenWebSockets;
  final IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc;
  final ILocalPreferencesService preferencesService;

  TimelineTabBloc({
    @required String timelineId,
    @required this.preferencesService,
    @required this.pleromaTimelineService,
    @required this.pleromaAccountService,
    @required this.statusRepository,
    @required this.currentAuthInstanceBloc,
    @required this.listenWebSockets,
    @required this.webSocketsHandlerManagerBloc,
  }) {
    timelineLocalPreferencesBloc = TimelineLocalPreferencesBloc.byId(
      preferencesService,
      userAtHost: currentAuthInstanceBloc.currentInstance.userAtHost,
      timelineId: timelineId,
    );
  }

  IStatusCachedListBloc createListService() => TimelineStatusCachedListBloc(
        pleromaAccountService: pleromaAccountService,
        pleromaTimelineService: pleromaTimelineService,
        statusRepository: statusRepository,
        currentInstanceBloc: currentAuthInstanceBloc,
        timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
        listenWebSockets: listenWebSockets,
        webSocketsHandlerManagerBloc: webSocketsHandlerManagerBloc,
      );

  @override
  Future internalAsyncInit() async {
    await timelineLocalPreferencesBloc.performAsyncInit();

    statusCachedListService = createListService();
    addDisposable(disposable: statusCachedListService);

    statusCachedPaginationBloc = StatusCachedPaginationBloc(
        itemsCountPerPage: 20,
        maximumCachedPagesCount: null,
        statusListService: statusCachedListService);
    addDisposable(disposable: statusCachedPaginationBloc);

    paginationListWithNewItemsBloc = StatusCachedPaginationListWithNewItemsBloc<
            CachedPaginationPage<IStatus>>(
        paginationBloc: statusCachedPaginationBloc,
        mergeNewItemsImmediately: false,
        statusCachedListBloc: statusCachedListService);
    addDisposable(disposable: paginationListWithNewItemsBloc);

    // skip first value to avoid duplicated update on first build
    var initValueSkipped = false;
    addDisposable(
        streamSubscription: timelineLocalPreferencesBloc.stream
            .distinct()
            .listen((newPreferences) {
      if (!initValueSkipped) {
        paginationListWithNewItemsBloc.refreshWithController();
      } else {
        initValueSkipped = true;
      }
    }));
    addDisposable(disposable: timelineLocalPreferencesBloc);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineTabBloc &&
          runtimeType == other.runtimeType &&
          timelineLocalPreferencesBloc == other.timelineLocalPreferencesBloc;

  @override
  int get hashCode => timelineLocalPreferencesBloc.hashCode;
}
