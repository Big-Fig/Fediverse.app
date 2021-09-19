import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_page_bloc.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_page_bloc_impl.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_page_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/public_timeline/local/local_instance_public_timeline_page_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/status/pagination/cached/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc_impl.dart';
import 'package:fedi/app/timeline/status/timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

class LocalInstancePublicTimelinePageBloc extends InstancePublicTimelinePageBloc
    implements ILocalInstancePublicTimelinePageBloc {
  @override
  final IUnifediApiTimelineService unifediApiTimelineService;

  final IUnifediApiAccountService unifediApiAccountService;
  final IStatusRepository statusRepository;
  final IFilterRepository filterRepository;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;
  final IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc;
  final IMyAccountBloc myAccountBloc;
  final IPaginationSettingsBloc paginationSettingsBloc;
  final ILocalPreferencesService localPreferencesService;
  final IConnectionService connectionService;

  @override
  // ignore: avoid-late-keyword
  late TimelineStatusCachedListBloc statusCachedListBloc;

  @override
  // ignore: avoid-late-keyword
  late IStatusCachedPaginationBloc statusCachedPaginationBloc;

  @override
  // ignore: avoid-late-keyword
  late ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>,
      IStatus> statusCachedPaginationListWithNewItemsBloc;

  LocalInstancePublicTimelinePageBloc({
    required this.localPreferencesService,
    required this.unifediApiTimelineService,
    required this.unifediApiAccountService,
    required this.statusRepository,
    required this.filterRepository,
    required this.currentAuthInstanceBloc,
    required this.webSocketsHandlerManagerBloc,
    required this.paginationSettingsBloc,
    required this.myAccountBloc,
    required this.connectionService,
    required IUnifediApiInstance unifediApiInstance,
  }) : super(
          instanceUri: unifediApiTimelineService.baseUri,
          unifediApiInstance: unifediApiInstance,
        );

  @override
  // ignore: avoid-late-keyword
  late ITimelineLocalPreferenceBloc timelineLocalPreferenceBloc;

  static LocalInstancePublicTimelinePageBloc createFromContext(
    BuildContext context, {
    required IUnifediApiInstance unifediApiInstance,
  }) {
    var unifediApiTimelineService =
        Provider.of<IUnifediApiTimelineService>(context, listen: false);

    return LocalInstancePublicTimelinePageBloc(
      connectionService: Provider.of<IConnectionService>(
        context,
        listen: false,
      ),
      unifediApiInstance: unifediApiInstance,
      unifediApiTimelineService: unifediApiTimelineService,
      localPreferencesService: ILocalPreferencesService.of(
        context,
        listen: false,
      ),
      unifediApiAccountService: Provider.of<IUnifediApiAccountService>(
        context,
        listen: false,
      ),
      currentAuthInstanceBloc: ICurrentAuthInstanceBloc.of(
        context,
        listen: false,
      ),
      webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(
        context,
        listen: false,
      ),
      filterRepository: IFilterRepository.of(
        context,
        listen: false,
      ),
      myAccountBloc: IMyAccountBloc.of(
        context,
        listen: false,
      ),
      paginationSettingsBloc: IPaginationSettingsBloc.of(
        context,
        listen: false,
      ),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required IUnifediApiInstance unifediApiInstance,
  }) {
    return Provider<IUnifediApiInstance>.value(
      value: unifediApiInstance,
      child: DisposableProxyProvider<IUnifediApiInstance,
          ILocalInstancePublicTimelinePageBloc>(
        update: (context, unifediApiInstance, previous) =>
            LocalInstancePublicTimelinePageBloc.createFromContext(
          context,
          unifediApiInstance: unifediApiInstance,
        ),
        child: ProxyProvider<ILocalInstancePublicTimelinePageBloc,
            IInstancePublicTimelinePageBloc>(
          update: (context, value, previous) => value,
          child: InstancePublicTimelinePageBlocProxyProvider(
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;

  @override
  Future internalAsyncInit() async {
    timelineLocalPreferenceBloc =
        TimelineLocalPreferenceBloc.instancePublicTimeline(
      localPreferencesService,
      unifediApiInstance: unifediApiInstance,
    );
    await timelineLocalPreferenceBloc.performAsyncInit();

    addDisposable(timelineLocalPreferenceBloc);

    statusCachedListBloc = TimelineStatusCachedListBloc(
      unifediApiAccountService: unifediApiAccountService,
      unifediApiTimelineService: unifediApiTimelineService,
      statusRepository: statusRepository,
      filterRepository: filterRepository,
      currentInstanceBloc: currentAuthInstanceBloc,
      timelineLocalPreferenceBloc: timelineLocalPreferenceBloc,
      webSocketsHandlerManagerBloc: webSocketsHandlerManagerBloc,
      myAccountBloc: myAccountBloc,
      handlerType: WebSocketsChannelHandlerType.foregroundValue,
    );
    await statusCachedListBloc.performAsyncInit();
    addDisposable(statusCachedListBloc);

    statusCachedPaginationBloc = StatusCachedPaginationBloc(
      statusListService: statusCachedListBloc,
      connectionService: connectionService,
      paginationSettingsBloc: paginationSettingsBloc,
      maximumCachedPagesCount: null,
    );
    addDisposable(statusCachedPaginationBloc);

    statusCachedPaginationListWithNewItemsBloc =
        StatusCachedPaginationListWithNewItemsBloc(
      mergeNewItemsImmediately: false,
      statusCachedListBloc: statusCachedListBloc,
      myAccountBloc: myAccountBloc,
      mergeOwnStatusesImmediately: false,
      paginationBloc: statusCachedPaginationBloc,
    );
    addDisposable(statusCachedPaginationListWithNewItemsBloc);

    timelineLocalPreferenceBloc.stream.listen(
      (_) {
        statusCachedPaginationListWithNewItemsBloc.refreshWithController();
      },
    ).disposeWith(this);
  }

  @override
  String get userAtHost => currentAuthInstanceBloc.currentInstance!.userAtHost;
}
