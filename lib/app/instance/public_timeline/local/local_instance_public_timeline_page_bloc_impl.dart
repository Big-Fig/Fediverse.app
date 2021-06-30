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
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/timeline/auth/pleroma_api_auth_timeline_service.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_service.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LocalInstancePublicTimelinePageBloc extends InstancePublicTimelinePageBloc
    implements ILocalInstancePublicTimelinePageBloc {
  @override
  final IPleromaApiTimelineService pleromaApiTimelineService;

  final IPleromaApiAuthTimelineService pleromaApiAuthTimelineService;
  final IPleromaApiAccountService pleromaApiAccountService;
  final IStatusRepository statusRepository;
  final IFilterRepository filterRepository;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;
  final IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc;
  final IMyAccountBloc myAccountBloc;
  final IPaginationSettingsBloc paginationSettingsBloc;
  final ILocalPreferencesService localPreferencesService;

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
    required this.pleromaApiTimelineService,
    required this.pleromaApiAuthTimelineService,
    required this.pleromaApiAccountService,
    required this.statusRepository,
    required this.filterRepository,
    required this.currentAuthInstanceBloc,
    required this.webSocketsHandlerManagerBloc,
    required this.paginationSettingsBloc,
    required this.myAccountBloc,
    required IPleromaApiInstance pleromaApiInstance,
  }) : super(
          instanceUri: pleromaApiTimelineService.restService.baseUri,
          pleromaApiInstance: pleromaApiInstance,
        );

  @override
  // ignore: avoid-late-keyword
  late ITimelineLocalPreferenceBloc timelineLocalPreferenceBloc;

  static LocalInstancePublicTimelinePageBloc createFromContext(
    BuildContext context, {
    required IPleromaApiInstance pleromaApiInstance,
  }) {
    var pleromaApiTimelineService =
        IPleromaApiTimelineService.of(context, listen: false);

    return LocalInstancePublicTimelinePageBloc(
      pleromaApiInstance: pleromaApiInstance,
      pleromaApiTimelineService: pleromaApiTimelineService,
      localPreferencesService: ILocalPreferencesService.of(
        context,
        listen: false,
      ),
      pleromaApiAccountService: IPleromaApiAccountService.of(
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
      pleromaApiAuthTimelineService: IPleromaApiAuthTimelineService.of(
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
    required IPleromaApiInstance pleromaApiInstance,
  }) {
    return Provider<IPleromaApiInstance>.value(
      value: pleromaApiInstance,
      child: DisposableProxyProvider<IPleromaApiInstance,
          ILocalInstancePublicTimelinePageBloc>(
        update: (context, pleromaApiInstance, previous) =>
            LocalInstancePublicTimelinePageBloc.createFromContext(
          context,
          pleromaApiInstance: pleromaApiInstance,
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
      pleromaApiInstance: pleromaApiInstance,
    );
    await timelineLocalPreferenceBloc.performAsyncInit();

    addDisposable(timelineLocalPreferenceBloc);

    statusCachedListBloc = TimelineStatusCachedListBloc(
      pleromaApiAccountService: pleromaApiAccountService,
      pleromaApiAuthTimelineService: pleromaApiAuthTimelineService,
      statusRepository: statusRepository,
      filterRepository: filterRepository,
      currentInstanceBloc: currentAuthInstanceBloc,
      timelineLocalPreferenceBloc: timelineLocalPreferenceBloc,
      webSocketsHandlerManagerBloc: webSocketsHandlerManagerBloc,
      myAccountBloc: myAccountBloc,
      webSocketsListenType: WebSocketsListenType.foreground,
    );
    await statusCachedListBloc.performAsyncInit();
    addDisposable(statusCachedListBloc);

    statusCachedPaginationBloc = StatusCachedPaginationBloc(
      statusListService: statusCachedListBloc,
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
