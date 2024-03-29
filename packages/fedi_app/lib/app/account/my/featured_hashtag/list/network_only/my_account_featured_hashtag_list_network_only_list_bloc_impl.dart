import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/list/network_only/my_account_featured_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/my_account_featured_hashtag_model_adapter.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger =
    Logger('featured_hashtag_hashtag_list_network_only_list_bloc_impl.dart');

class AccountFeaturedHashtagListNetworkOnlyListBloc extends DisposableOwner
    implements IAccountFeaturedHashtagListNetworkOnlyListBloc {
  final IUnifediApiMyAccountService unifediApiMyAccountService;

  @override
  IUnifediApiService get unifediApi => unifediApiMyAccountService;

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;

  AccountFeaturedHashtagListNetworkOnlyListBloc({
    required this.unifediApiMyAccountService,
  });

  @override
  Future<List<IMyAccountFeaturedHashtag>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required String? minId,
    required String? maxId,
  }) async {
    if (minId != null || maxId != null) {
      // don't support pagination
      return [];
    }

    var unifediFeaturedHashtags =
        await unifediApiMyAccountService.getMyAccountFeaturedTags(
      pagination: null,
    );
    List<IMyAccountFeaturedHashtag> result = unifediFeaturedHashtags
        .map(
          (unifediFeaturedHashtag) =>
              unifediFeaturedHashtag.toMyAccountFeaturedHashtag(),
        )
        .toList();

    _logger.finest(
      () => 'loadItemsFromRemoteForPage \n'
          'result ${result.length} ',
    );

    return result;
  }
}
