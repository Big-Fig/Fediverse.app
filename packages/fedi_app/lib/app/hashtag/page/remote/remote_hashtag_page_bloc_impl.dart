import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/page/hashtag_page_bloc.dart';
import 'package:fedi_app/app/hashtag/page/hashtag_page_bloc_impl.dart';
import 'package:fedi_app/app/hashtag/page/hashtag_page_bloc_proxy_provider.dart';
import 'package:fedi_app/app/hashtag/page/remote/remote_hashtag_page_bloc.dart';
import 'package:fedi_app/app/hashtag/status_list/network_only/hashtag_status_list_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi_app/app/status/pagination/network_only/status_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/status/pagination/network_only/status_network_only_pagination_bloc_impl.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc_impl.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RemoteHashtagPageBloc extends HashtagPageBloc
    implements IRemoteHashtagPageBloc {
  @override
  final IRemoteInstanceBloc remoteInstanceBloc;
  @override
  final IUnifediApiTimelineService unifediApiTimelineService;

  final IPaginationSettingsBloc paginationSettingsBloc;

  // ignore: avoid-late-keyword
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  final IConnectionService connectionService;
  RemoteHashtagPageBloc({
    required this.remoteInstanceBloc,
    required this.paginationSettingsBloc,
    required this.connectionService,
    required IHashtag hashtag,
  })  : unifediApiTimelineService =
            remoteInstanceBloc.unifediApiManager.createTimelineService(),
        super(
          hashtag: hashtag,
          instanceUri: remoteInstanceBloc.instanceUri,
        ) {
    addDisposable(unifediApiTimelineService);
  }

  static RemoteHashtagPageBloc createFromContext(
    BuildContext context, {
    required IHashtag hashtag,
    required IRemoteInstanceBloc remoteInstanceBloc,
  }) =>
      RemoteHashtagPageBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        remoteInstanceBloc: remoteInstanceBloc,
        hashtag: hashtag,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required IHashtag hashtag,
  }) =>
      Provider<IHashtag>.value(
        value: hashtag,
        child: DisposableProxyProvider<IRemoteInstanceBloc,
            IRemoteHashtagPageBloc>(
          update: (context, value, previous) =>
              RemoteHashtagPageBloc.createFromContext(
            context,
            remoteInstanceBloc: value,
            hashtag: hashtag,
          ),
          child: ProxyProvider<IRemoteHashtagPageBloc, IHashtagPageBloc>(
            update: (context, value, previous) => value,
            child: HashtagPageBlocProxyProvider(
              child: child,
            ),
          ),
        ),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;

  @override
  Future<void> internalAsyncInit() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();

    addDisposable(memoryLocalPreferencesService);

    timelineLocalPreferenceBloc = TimelineLocalPreferenceBloc.hashtag(
      memoryLocalPreferencesService,
      userAtHost: userAtHost,
      hashtag: hashtag,
    );
    await timelineLocalPreferenceBloc.performAsyncInit();

    addDisposable(timelineLocalPreferenceBloc);

    var unifediApiTimelineService =
        remoteInstanceBloc.unifediApiManager.createTimelineService();
    addDisposable(unifediApiTimelineService);

    statusNetworkOnlyListBloc = HashtagStatusListNetworkOnlyListBloc(
      unifediApiTimelineService: unifediApiTimelineService,
      instanceUri: instanceUri,
      timelineLocalPreferenceBloc: timelineLocalPreferenceBloc,
    );
    addDisposable(statusNetworkOnlyListBloc);

    statusNetworkOnlyPaginationBloc = StatusNetworkOnlyPaginationBloc(
      paginationSettingsBloc: paginationSettingsBloc,
      maximumCachedPagesCount: null,
      listService: statusNetworkOnlyListBloc,
      connectionService: connectionService,
    );
    addDisposable(statusNetworkOnlyPaginationBloc);

    statusPaginationListBloc = PaginationListBloc(
      paginationBloc: statusNetworkOnlyPaginationBloc,
    );
    addDisposable(statusPaginationListBloc);

    timelineLocalPreferenceBloc.stream.listen(
      (_) {
        statusPaginationListBloc.refreshWithController();
      },
    ).disposeWith(this);
  }

  @override
  // ignore: avoid-late-keyword
  late IStatusNetworkOnlyListBloc statusNetworkOnlyListBloc;

  @override
  // ignore: avoid-late-keyword
  late IStatusNetworkOnlyPaginationBloc statusNetworkOnlyPaginationBloc;

  @override
  // ignore: avoid-late-keyword
  late IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      statusPaginationListBloc;

  @override
  // ignore: avoid-late-keyword
  late ITimelineLocalPreferenceBlocOld timelineLocalPreferenceBloc;

  @override
  String get userAtHost => remoteInstanceBloc.instanceUri.host;
}
