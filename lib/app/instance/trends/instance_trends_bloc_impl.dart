import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_bloc.dart';
import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_bloc_impl.dart';
import 'package:fedi/app/hashtag/pagination/network_only/hashtag_network_only_pagination_bloc.dart';
import 'package:fedi/app/hashtag/pagination/network_only/hashtag_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/instance/trends/hashtag_list/network_only/instance_trends_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/app/instance/trends/hashtag_list/network_only/instance_trends_hashtag_list_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/trends/instance_trends_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

import 'package:rxdart/rxdart.dart';

abstract class InstanceTrendsBloc extends DisposableOwner
    implements IInstanceTrendsBloc {
  @override
  final Uri instanceUri;

  final BehaviorSubject<IUnifediApiInstance?> instanceSubject;
  final IPaginationSettingsBloc paginationSettingsBloc;
  final IConnectionService connectionService;
  InstanceTrendsBloc({
    required IUnifediApiInstance? initialInstance,
    required this.connectionService,
    required this.instanceUri,
    required this.paginationSettingsBloc,
  }) : instanceSubject = BehaviorSubject.seeded(initialInstance) {
    instanceSubject.disposeWith(this);

    instanceTrendsHashtagListNetworkOnlyListBloc =
        InstanceTrendsHashtagListNetworkOnlyListBloc(
      unifediApiInstanceService: unifediApiInstanceService,
      remoteInstanceUriOrNull: instanceUri,
      instanceLocation: instanceLocation,
    );

    instanceTrendsHashtagListNetworkOnlyPaginationBloc =
        HashtagNetworkOnlyPaginationBloc(
      connectionService: connectionService,
      listBloc: instanceTrendsHashtagListNetworkOnlyListBloc,
      maximumCachedPagesCount: null,
      paginationSettingsBloc: paginationSettingsBloc,
    );
    hashtagPaginationListBloc = HashtagPaginationListBloc(
      paginationBloc: instanceTrendsHashtagListNetworkOnlyPaginationBloc,
    );

    addDisposable(instanceTrendsHashtagListNetworkOnlyListBloc);
    addDisposable(
      instanceTrendsHashtagListNetworkOnlyPaginationBloc,
    );
    addDisposable(hashtagPaginationListBloc);

    // ignore: unawaited_futures
    hashtagPaginationListBloc.refreshWithoutController();
  }

  IUnifediApiInstanceService get unifediApiInstanceService;

  @override
  IUnifediApiInstance? get instance => instanceSubject.value;

  @override
  Stream<IUnifediApiInstance?> get instanceStream => instanceSubject.stream;

  @override
  bool get isPleroma => instance!.typeAsUnifediApi.isPleroma;

  @override
  bool get isMastodon => instance!.typeAsUnifediApi.isMastodon;

  @override
  // ignore: avoid-late-keyword
  late IInstanceTrendsHashtagListNetworkOnlyListBloc
      instanceTrendsHashtagListNetworkOnlyListBloc;

  @override
  // ignore: avoid-late-keyword
  late IHashtagNetworkOnlyPaginationBloc
      instanceTrendsHashtagListNetworkOnlyPaginationBloc;

  @override
  // ignore: avoid-late-keyword
  late IHashtagPaginationListBloc hashtagPaginationListBloc;
}
