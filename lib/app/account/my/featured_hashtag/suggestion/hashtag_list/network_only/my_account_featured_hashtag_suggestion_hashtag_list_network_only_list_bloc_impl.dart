import 'package:fedi/app/account/my/featured_hashtag/suggestion/hashtag_list/network_only/my_account_featured_hashtag_suggestion_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/hashtag_model_adapter.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:logging/logging.dart';

final _logger = Logger(
  'my_account_featured_hashtag_suggestion_hashtag_list_network_only_list_bloc_impl.dart',
);

class MyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc
    extends DisposableOwner
    implements
        IMyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc {
  final IPleromaApiFeaturedTagsService pleromaApiFeaturedTagsService;

  @override
  IPleromaApi get pleromaApi => pleromaApiFeaturedTagsService;

  MyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc({
    required this.pleromaApiFeaturedTagsService,
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

    var pleromaHashtags =
        await pleromaApiFeaturedTagsService.getSuggestedTags();
    List<IHashtag> result = pleromaHashtags
        .map(
          (pleromaHashtag) => pleromaHashtag.toHashtag(),
        )
        .toList();

    _logger.finest(() => 'loadItemsFromRemoteForPage \n'
        'result ${result.length} ');

    return result;
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
