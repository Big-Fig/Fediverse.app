import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_service.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_service_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HashtagStatusListNetworkOnlyListBloc extends IStatusNetworkOnlyListBloc {
  final Uri instanceUri;
  final String hashtagName;
  final IPleromaApiTimelineService pleromaApiTimelineService;

  HashtagStatusListNetworkOnlyListBloc({
    required this.instanceUri,
    required this.pleromaApiTimelineService,
    required this.hashtagName,
  });

  static HashtagStatusListNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    required String hashtagName,
    required Uri instanceUri,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);
    var pleromaApiTimelineService = PleromaApiTimelineService(
      restService: remoteInstanceBloc.pleromaRestService,
    );

    var bloc = HashtagStatusListNetworkOnlyListBloc(
      hashtagName: hashtagName,
      instanceUri: instanceUri,
      pleromaApiTimelineService: pleromaApiTimelineService,
    );

    bloc.addDisposable(disposable: pleromaApiTimelineService);

    return bloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required String hashtagName,
    required Widget child,
    required Uri instanceUri,
  }) {
    return DisposableProvider<IStatusNetworkOnlyListBloc>(
      create: (context) =>
          HashtagStatusListNetworkOnlyListBloc.createFromContext(
        context,
        hashtagName: hashtagName,
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
    var pleromaStatuses = await pleromaApiTimelineService.getHashtagTimeline(
      hashtag: hashtagName,
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
