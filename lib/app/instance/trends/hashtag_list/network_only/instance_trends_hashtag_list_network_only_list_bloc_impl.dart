import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/hashtag_model_adapter.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/trends/hashtag_list/network_only/instance_trends_hashtag_list_network_only_list_bloc.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger =
    Logger('instance_trends_hashtag_list_network_only_list_bloc_impl.dart');

class InstanceTrendsHashtagListNetworkOnlyListBloc extends DisposableOwner
    implements IInstanceTrendsHashtagListNetworkOnlyListBloc {
  final IUnifediApiInstanceService unifediApiInstanceService;

  @override
  IUnifediApiService get unifediApi => unifediApiInstanceService;

  @override
  final InstanceLocation instanceLocation;

  @override
  final Uri? remoteInstanceUriOrNull;

  InstanceTrendsHashtagListNetworkOnlyListBloc({
    required this.unifediApiInstanceService,
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

    var pleromaHashtags = await unifediApiInstanceService.getTrendingTags(
      limit: null,
    );

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
