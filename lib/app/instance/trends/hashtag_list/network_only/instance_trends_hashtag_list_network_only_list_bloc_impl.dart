import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/hashtag_model_adapter.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/trends/hashtag_list/network_only/instance_trends_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/trends/pleroma_api_trends_service.dart';
import 'package:logging/logging.dart';

final _logger =
    Logger('instance_trends_hashtag_list_network_only_list_bloc_impl.dart');

class InstanceTrendsHashtagListNetworkOnlyListBloc extends DisposableOwner
    implements IInstanceTrendsHashtagListNetworkOnlyListBloc {
  final IPleromaApiTrendsService pleromaApiTrendsService;

  @override
  IPleromaApi get pleromaApi => pleromaApiTrendsService;

  @override
  final InstanceLocation instanceLocation;

  @override
  final Uri? remoteInstanceUriOrNull;

  InstanceTrendsHashtagListNetworkOnlyListBloc({
    required this.pleromaApiTrendsService,
    required this.instanceLocation,
    required this.remoteInstanceUriOrNull,
  });

  @override
  Future<List<IHashtag>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required String? minId,
    required String? maxId,
  }) async {
    if (minId != null || maxId != null) {
      // don't support pagination
      return [];
    }

    var pleromaHashtags = await pleromaApiTrendsService.getTrendingTags();
    List<IHashtag> result = pleromaHashtags
        .map(
          (pleromaHashtag) => pleromaHashtag.toHashtag(),
        )
        .toList();

    _logger.finest(() => 'loadItemsFromRemoteForPage \n'
        'result ${result.length} ');

    return result;
  }
}
