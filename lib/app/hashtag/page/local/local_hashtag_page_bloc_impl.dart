import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/hashtag/hashtag_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_bloc_impl.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/page/hashtag_page_bloc.dart';
import 'package:fedi/app/hashtag/page/hashtag_page_bloc_impl.dart';
import 'package:fedi/app/hashtag/page/hashtag_page_bloc_proxy_provider.dart';
import 'package:fedi/app/hashtag/page/local/local_hashtag_page_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
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
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class LocalHashtagPageBloc extends HashtagPageBloc
    implements ILocalHashtagPageBloc {
  final IMyAccountFeaturedHashtag? myAccountFeaturedHashtag;

  @override
  final IUnifediApiTimelineService unifediApiTimelineService;

  final IUnifediApiAccountService unifediApiAccountService;
  final IStatusRepository statusRepository;
  final IFilterRepository filterRepository;
  final ICurrentUnifediApiAccessBloc currentUnifediApiAccessBloc;
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
  final IConnectionService connectionService;
  LocalHashtagPageBloc({
    required this.connectionService,
    required this.localPreferencesService,
    required this.unifediApiTimelineService,
    required this.unifediApiAccountService,
    required this.statusRepository,
    required this.filterRepository,
    required this.currentUnifediApiAccessBloc,
    required this.webSocketsHandlerManagerBloc,
    required this.paginationSettingsBloc,
    required this.myAccountBloc,
    required IHashtag hashtag,
    required this.myAccountFeaturedHashtag,
  }) : super(
          instanceUri:
              unifediApiTimelineService.restService.accessBloc.access.uri,
          hashtag: hashtag,
        );

  @override
  // ignore: avoid-late-keyword
  late ITimelineLocalPreferenceBlocOld timelineLocalPreferenceBloc;

  static LocalHashtagPageBloc createFromContext(
    BuildContext context, {
    required IHashtag hashtag,
    required IMyAccountFeaturedHashtag? myAccountFeaturedHashtag,
  }) {
    var unifediApiTimelineService =
        Provider.of<IUnifediApiTimelineService>(context, listen: false);

    return LocalHashtagPageBloc(
      connectionService: Provider.of<IConnectionService>(
        context,
        listen: false,
      ),
      hashtag: hashtag,
      myAccountFeaturedHashtag: myAccountFeaturedHashtag,
      unifediApiTimelineService: unifediApiTimelineService,
      localPreferencesService: ILocalPreferencesService.of(
        context,
        listen: false,
      ),
      unifediApiAccountService: Provider.of<IUnifediApiAccountService>(
        context,
        listen: false,
      ),
      currentUnifediApiAccessBloc: ICurrentUnifediApiAccessBloc.of(
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
    required IHashtag hashtag,
    required IMyAccountFeaturedHashtag? myAccountFeaturedHashtag,
  }) {
    return Provider<IHashtag>.value(
      value: hashtag,
      child: DisposableProxyProvider<IHashtag, IHashtagBloc>(
        update: (context, hashtag, previous) => HashtagBloc.createFromContext(
          context,
          hashtag: hashtag,
          myAccountFeaturedHashtag: myAccountFeaturedHashtag,
          needLoadFeaturedState: true,
        ),
        child: DisposableProxyProvider<IHashtag, ILocalHashtagPageBloc>(
          update: (context, hashtag, previous) =>
              LocalHashtagPageBloc.createFromContext(
            context,
            hashtag: hashtag,
            myAccountFeaturedHashtag: myAccountFeaturedHashtag,
          ),
          child: ProxyProvider<ILocalHashtagPageBloc, IHashtagPageBloc>(
            update: (context, value, previous) => value,
            child: HashtagPageBlocProxyProvider(
              child: child,
            ),
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
    timelineLocalPreferenceBloc = TimelineLocalPreferenceBloc.hashtag(
      localPreferencesService,
      userAtHost: userAtHost,
      hashtag: hashtag,
    )..disposeWith(this);
    await timelineLocalPreferenceBloc.performAsyncInit();

    statusCachedListBloc = TimelineStatusCachedListBloc(
      unifediApiAccountService: unifediApiAccountService,
      unifediApiTimelineService: unifediApiTimelineService,
      statusRepository: statusRepository,
      filterRepository: filterRepository,
      currentInstanceBloc: currentUnifediApiAccessBloc,
      timelineLocalPreferenceBloc: timelineLocalPreferenceBloc,
      webSocketsHandlerManagerBloc: webSocketsHandlerManagerBloc,
      myAccountBloc: myAccountBloc,
      handlerType: WebSocketsChannelHandlerType.foregroundValue,
    )..disposeWith(this);
    await statusCachedListBloc.performAsyncInit();

    statusCachedPaginationBloc = StatusCachedPaginationBloc(
      connectionService: connectionService,
      statusListService: statusCachedListBloc,
      paginationSettingsBloc: paginationSettingsBloc,
      maximumCachedPagesCount: null,
    )..disposeWith(this);

    statusCachedPaginationListWithNewItemsBloc =
        StatusCachedPaginationListWithNewItemsBloc(
      mergeNewItemsImmediately: false,
      statusCachedListBloc: statusCachedListBloc,
      myAccountBloc: myAccountBloc,
      mergeOwnStatusesImmediately: false,
      paginationBloc: statusCachedPaginationBloc,
    )..disposeWith(this);

    timelineLocalPreferenceBloc.stream.listen(
      (_) {
        statusCachedPaginationListWithNewItemsBloc.refreshWithController();
      },
    ).disposeWith(this);
  }

  @override
  String get userAtHost =>
      currentUnifediApiAccessBloc.currentInstance!.userAtHost;
}
