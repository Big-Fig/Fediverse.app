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

class InstancePublicTimelineStatusListNetworkOnlyListBloc
    extends IStatusNetworkOnlyListBloc {
  final Uri instanceUri;
  final IUnifediApiTimelineService unifediApiTimelineService;
  final ITimelineLocalPreferenceBlocOld timelineLocalPreferenceBloc;

  InstancePublicTimelineStatusListNetworkOnlyListBloc({
    required this.instanceUri,
    required this.unifediApiTimelineService,
    required this.timelineLocalPreferenceBloc,
  });

  static InstancePublicTimelineStatusListNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    required ITimelineLocalPreferenceBlocOld timelineLocalPreferenceBloc,
    required Uri instanceUri,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);
    var unifediApiTimelineService =
        remoteInstanceBloc.unifediApiManager.createTimelineService();

    var bloc = InstancePublicTimelineStatusListNetworkOnlyListBloc(
      timelineLocalPreferenceBloc: timelineLocalPreferenceBloc,
      instanceUri: instanceUri,
      unifediApiTimelineService: unifediApiTimelineService,
    )..addDisposable(unifediApiTimelineService);

    return bloc;
  }

  static Future<Widget> provideToContext(
    BuildContext context, {
    required ITimelineLocalPreferenceBlocOld timelineLocalPreferenceBloc,
    required Widget child,
    required Uri instanceUri,
  }) async =>
      DisposableProvider<IStatusNetworkOnlyListBloc>(
        create: (context) => InstancePublicTimelineStatusListNetworkOnlyListBloc
            .createFromContext(
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
    var onlyFromInstanceSupported =
        unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getPublicTimelineOnlyFromInstanceFeature,
    );
    var onlyRemoteInstanceSupported =
        unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getPublicTimelineOnlyRemoteFeature,
    );
    var excludeVisibilitiesSupported =
        unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getPublicTimelineExcludeVisibilitiesFeature,
    );
    var onlyMediaSupported = unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getPublicTimelineOnlyMediaFeature,
    );
    var replyVisibilityFilterSupported =
        unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getPublicTimelineReplyVisibilityFilterFeature,
    );
    var withMutedSupported = unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getPublicTimelineWithMutedFeature,
    );

    var onlyLocal = timeline.onlyLocal;

    var unifediApiStatuses = await unifediApiTimelineService.getPublicTimeline(
      onlyLocal: onlyLocal,
      onlyRemote: onlyRemoteInstanceSupported ? timeline.onlyRemote : null,
      onlyWithMedia: onlyMediaSupported ? timeline.onlyWithMedia : null,
      withMuted: withMutedSupported ? timeline.withMuted : null,
      onlyFromInstance:
          onlyFromInstanceSupported ? timeline.onlyFromInstance : null,
      excludeVisibilities:
          excludeVisibilitiesSupported ? timeline.excludeVisibilities : null,
      replyVisibilityFilter: replyVisibilityFilterSupported
          ? timeline.replyVisibilityFilter
          : null,
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
