import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HashtagStatusListNetworkOnlyListBloc extends IStatusNetworkOnlyListBloc {
  final Uri instanceUri;
  final IPleromaApiTimelineService pleromaApiTimelineService;
  final ITimelineLocalPreferenceBloc timelineLocalPreferenceBloc;

  HashtagStatusListNetworkOnlyListBloc({
    required this.instanceUri,
    required this.pleromaApiTimelineService,
    required this.timelineLocalPreferenceBloc,
  });

  static HashtagStatusListNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    required ITimelineLocalPreferenceBloc timelineLocalPreferenceBloc,
    required Uri instanceUri,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);
    var pleromaApiTimelineService = PleromaApiTimelineService(
      restService: remoteInstanceBloc.pleromaRestService,
    );

    var bloc = HashtagStatusListNetworkOnlyListBloc(
      timelineLocalPreferenceBloc: timelineLocalPreferenceBloc,
      instanceUri: instanceUri,
      pleromaApiTimelineService: pleromaApiTimelineService,
    );

    bloc.addDisposable(pleromaApiTimelineService);

    return bloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required ITimelineLocalPreferenceBloc timelineLocalPreferenceBloc,
    required Widget child,
    required Uri instanceUri,
  }) {
    return DisposableProvider<IStatusNetworkOnlyListBloc>(
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
  }

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
    var pleromaStatuses = await pleromaApiTimelineService.getHashtagTimeline(
      hashtag: timeline.withRemoteHashtag!,
      onlyLocal: timeline.onlyLocal == true,
      onlyWithMedia: timeline.onlyWithMedia == true,
      excludeVisibilities: timeline.excludeVisibilities,
      pagination: PleromaApiPaginationRequest(
        limit: itemsCountPerPage,
        sinceId: minId,
        maxId: maxId,
      ),
    );

    return pleromaStatuses
        .map(
          (pleromaStatus) => pleromaStatus.toDbStatusPopulatedWrapper(),
        )
        .toList();
  }

  @override
  IPleromaApi get pleromaApi => pleromaApiTimelineService;
}
