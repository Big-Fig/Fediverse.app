import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/suggestion/hashtag_list/network_only/my_account_featured_hashtag_suggestion_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/hashtag_model_adapter.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger(
  'my_account_featured_hashtag_suggestion_hashtag_list_network_only_list_bloc_impl.dart',
);

class MyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc
    extends DisposableOwner
    implements
        IMyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc {
  final IUnifediApiMyAccountService unifediApiMyAccountService;

  @override
  IUnifediApiService get unifediApi => unifediApiMyAccountService;

  MyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc({
    required this.unifediApiMyAccountService,
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

    var unifediHashtags = await unifediApiMyAccountService.getMySuggestedTags();
    List<IHashtag> result = unifediHashtags
        .map(
          (unifediHashtag) => unifediHashtag.toHashtag(),
        )
        .toList();

    _logger.finest(
      () => 'loadItemsFromRemoteForPage \n'
          'result ${result.length} ',
    );

    return result;
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
