import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/status/pagination/cached/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc_impl.dart';
import 'package:fedi/app/timeline/status/timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

var _logger = Logger('timeline_tab_bloc_impl.dart');

class TimelineTabBloc extends AsyncInitLoadingBloc implements ITimelineTabBloc {
  @override
  Timeline get timeline => timelineLocalPreferencesBloc.value!;
  @override
  // ignore: avoid-late-keyword
  late TimelineStatusCachedListBloc statusCachedListBloc;

  // ignore: avoid-late-keyword
  late IStatusCachedPaginationBloc statusCachedPaginationBloc;
  @override
  // ignore: avoid-late-keyword
  late ITimelineLocalPreferenceBloc timelineLocalPreferencesBloc;

  @override
  // ignore: avoid-late-keyword
  late ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>,
      IStatus> paginationListWithNewItemsBloc;

  final IUnifediApiAccountService unifediApiAccountService;
  final IUnifediApiTimelineService unifediApiTimelineService;
  final IStatusRepository statusRepository;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;
  final IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc;
  final ILocalPreferencesService preferencesService;
  final IMyAccountBloc myAccountBloc;
  final IFilterRepository filterRepository;
  final IConnectionService connectionService;
  @override
  final String timelineId;

  final WebSocketsChannelHandlerType handlerType;
  final IPaginationSettingsBloc paginationSettingsBloc;

  TimelineTabBloc({
    required this.timelineId,
    required this.connectionService,
    required this.preferencesService,
    required this.unifediApiTimelineService,
    required this.unifediApiAccountService,
    required this.statusRepository,
    required this.currentAuthInstanceBloc,
    required this.webSocketsHandlerManagerBloc,
    required this.myAccountBloc,
    required this.handlerType,
    required this.filterRepository,
    required this.paginationSettingsBloc,
  }) {
    _logger.finest(() => 'TimelineTabBloc timelineId $timelineId');

    timelineLocalPreferencesBloc = TimelineLocalPreferenceBloc.byId(
      preferencesService,
      userAtHost: currentAuthInstanceBloc.currentInstance!.userAtHost,
      timelineId: timelineId,
      defaultPreferenceValue: null,
    );

    addDisposable(timelineLocalPreferencesBloc);
  }

  TimelineStatusCachedListBloc createListService({
    required WebSocketsChannelHandlerType handlerType,
  }) =>
      TimelineStatusCachedListBloc(
        unifediApiAccountService: unifediApiAccountService,
        unifediApiTimelineService: unifediApiTimelineService,
        statusRepository: statusRepository,
        currentInstanceBloc: currentAuthInstanceBloc,
        timelineLocalPreferenceBloc: timelineLocalPreferencesBloc,
        webSocketsHandlerManagerBloc: webSocketsHandlerManagerBloc,
        handlerType: handlerType,
        filterRepository: filterRepository,
        myAccountBloc: myAccountBloc,
      );

  @override
  void resubscribeWebSocketsUpdates(WebSocketsChannelHandlerType handlerType) {
    statusCachedListBloc.resubscribeWebSocketsUpdates(handlerType);
  }

  @override
  Future internalAsyncInit() async {
    await timelineLocalPreferencesBloc.performAsyncInit();

    statusCachedListBloc = createListService(handlerType: handlerType);
    addDisposable(statusCachedListBloc);

    await statusCachedListBloc.performAsyncInit();

    statusCachedPaginationBloc = StatusCachedPaginationBloc(
      connectionService: connectionService,
      maximumCachedPagesCount: null,
      statusListService: statusCachedListBloc,
      paginationSettingsBloc: paginationSettingsBloc,
    );
    addDisposable(statusCachedPaginationBloc);

    paginationListWithNewItemsBloc = StatusCachedPaginationListWithNewItemsBloc<
        CachedPaginationPage<IStatus>>(
      paginationBloc: statusCachedPaginationBloc,
      mergeNewItemsImmediately: false,
      mergeOwnStatusesImmediately: true,
      statusCachedListBloc: statusCachedListBloc,
      myAccountBloc: myAccountBloc,
    );
    addDisposable(paginationListWithNewItemsBloc);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineTabBloc &&
          runtimeType == other.runtimeType &&
          timelineId == other.timelineId;

  @override
  int get hashCode => timelineId.hashCode;

  @override
  String toString() {
    return 'TimelineTabBloc{timelineId: $timelineId}';
  }

  static TimelineTabBloc createFromContext(
    BuildContext context, {
    required String timelineId,
    required WebSocketsChannelHandlerType handlerType,
  }) =>
      TimelineTabBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        timelineId: timelineId,
        handlerType: handlerType,
        filterRepository: IFilterRepository.of(
          context,
          listen: false,
        ),
        unifediApiTimelineService:
            Provider.of<IUnifediApiTimelineService>(context, listen: false),
        unifediApiAccountService:
            Provider.of<IUnifediApiAccountService>(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        currentAuthInstanceBloc:
            ICurrentAuthInstanceBloc.of(context, listen: false),
        preferencesService: ILocalPreferencesService.of(context, listen: false),
        webSocketsHandlerManagerBloc:
            IWebSocketsHandlerManagerBloc.of(context, listen: false),
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
      );
}
