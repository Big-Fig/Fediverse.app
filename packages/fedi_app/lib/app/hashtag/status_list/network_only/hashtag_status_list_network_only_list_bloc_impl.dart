import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/status_model_adapter.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class HashtagStatusListNetworkOnlyListBloc extends IStatusNetworkOnlyListBloc {
  final Uri instanceUri;
  final IUnifediApiTimelineService unifediApiTimelineService;
  final ITimelineLocalPreferenceBlocOld timelineLocalPreferenceBloc;

  HashtagStatusListNetworkOnlyListBloc({
    required this.instanceUri,
    required this.unifediApiTimelineService,
    required this.timelineLocalPreferenceBloc,
  });

  static HashtagStatusListNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    required ITimelineLocalPreferenceBlocOld timelineLocalPreferenceBloc,
    required Uri instanceUri,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);
    var unifediApiTimelineService =
        remoteInstanceBloc.unifediApiManager.createTimelineService();

    var bloc = HashtagStatusListNetworkOnlyListBloc(
      timelineLocalPreferenceBloc: timelineLocalPreferenceBloc,
      instanceUri: instanceUri,
      unifediApiTimelineService: unifediApiTimelineService,
    );

    // ignore: cascade_invocations
    bloc.addDisposable(unifediApiTimelineService);

    return bloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required ITimelineLocalPreferenceBlocOld timelineLocalPreferenceBloc,
    required Widget child,
    required Uri instanceUri,
  }) =>
      DisposableProvider<IStatusNetworkOnlyListBloc>(
        create: (context) =>
            HashtagStatusListNetworkOnlyListBloc.createFromContext(
          context,
          timelineLocalPreferenceBloc: timelineLocalPreferenceBloc,
          instanceUri: instanceUri,
        ),
        child: ProxyProvider<IStatusNetworkOnlyListBloc, INetworkOnlyListBloc>(
          update: (context, value, previous) => value,
          child: StatusNetworkOnlyListBlocProxyProvider(
            child: ProxyProvider<IStatusNetworkOnlyListBloc,
                INetworkOnlyListBloc<IStatus>>(
              update: (context, value, previous) => value,
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
  Future<List<IStatus>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required String? minId,
    required String? maxId,
  }) async {
    var timeline = timelineLocalPreferenceBloc.value!;
    var unifediApiStatuses = await unifediApiTimelineService.getHashtagTimeline(
      hashtag: timeline.withRemoteHashtag!,
      onlyLocal: timeline.onlyLocal == true ? true : null,
      onlyWithMedia: timeline.onlyWithMedia == true ? true : null,
      excludeVisibilities: timeline.excludeVisibilities,
      withMuted: timeline.withMuted,
      pagination: UnifediApiPagination(
        limit: itemsCountPerPage,
        minId: minId,
        maxId: maxId,
      ),
    );

    return unifediApiStatuses
        .map(
          (unifediApiStatus) => unifediApiStatus.toDbStatusPopulatedWrapper(),
        )
        .toList();
  }

  @override
  IUnifediApiService get unifediApi => unifediApiTimelineService;
}
