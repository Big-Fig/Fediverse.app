import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/page/hashtag_page_bloc.dart';
import 'package:fedi/app/hashtag/page/hashtag_page_bloc_impl.dart';
import 'package:fedi/app/hashtag/page/hashtag_page_bloc_proxy_provider.dart';
import 'package:fedi/app/hashtag/page/remote/remote_hashtag_page_bloc.dart';
import 'package:fedi/app/hashtag/status_list/network_only/hashtag_status_list_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/pagination/network_only/status_network_only_pagination_bloc.dart';
import 'package:fedi/app/status/pagination/network_only/status_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:easy_dispose/easy_dispose.dart';

class RemoteHashtagPageBloc extends HashtagPageBloc
    implements IRemoteHashtagPageBloc {
  @override
  final IRemoteInstanceBloc remoteInstanceBloc;
  @override
  final IPleromaApiTimelineService pleromaApiTimelineService;

  final IPaginationSettingsBloc paginationSettingsBloc;

  // ignore: avoid-late-keyword
  late MemoryLocalPreferencesService memoryLocalPreferencesService;

  RemoteHashtagPageBloc({
    required this.remoteInstanceBloc,
    required this.paginationSettingsBloc,
    required IHashtag hashtag,
  })  : pleromaApiTimelineService = PleromaApiTimelineService(
          restService: remoteInstanceBloc.pleromaRestService,
        ),
        super(
          hashtag: hashtag,
          instanceUri: remoteInstanceBloc.instanceUri,
        ) {
    addDisposable(pleromaApiTimelineService);
  }

  static RemoteHashtagPageBloc createFromContext(
    BuildContext context, {
    required IHashtag hashtag,
    required IRemoteInstanceBloc remoteInstanceBloc,
  }) {
    return RemoteHashtagPageBloc(
      remoteInstanceBloc: remoteInstanceBloc,
      hashtag: hashtag,
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
  Future internalAsyncInit() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();

    addDisposable(memoryLocalPreferencesService);

    timelineLocalPreferenceBloc = TimelineLocalPreferenceBloc.hashtag(
      memoryLocalPreferencesService,
      userAtHost: userAtHost,
      hashtag: hashtag,
    );
    await timelineLocalPreferenceBloc.performAsyncInit();

    addDisposable(timelineLocalPreferenceBloc);

    var pleromaApiTimelineService = PleromaApiTimelineService(
      restService: remoteInstanceBloc.pleromaRestService,
    );
    addDisposable(pleromaApiTimelineService);

    statusNetworkOnlyListBloc = HashtagStatusListNetworkOnlyListBloc(
      pleromaApiTimelineService: pleromaApiTimelineService,
      instanceUri: instanceUri,
      timelineLocalPreferenceBloc: timelineLocalPreferenceBloc,
    );
    addDisposable(statusNetworkOnlyListBloc);

    statusNetworkOnlyPaginationBloc = StatusNetworkOnlyPaginationBloc(
      paginationSettingsBloc: paginationSettingsBloc,
      maximumCachedPagesCount: null,
      listService: statusNetworkOnlyListBloc,
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
  late ITimelineLocalPreferenceBloc timelineLocalPreferenceBloc;

  @override
  String get userAtHost => remoteInstanceBloc.instanceUri.host;
}
