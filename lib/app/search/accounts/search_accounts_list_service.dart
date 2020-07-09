import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_service.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/mastodon/search/mastodon_search_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/search/pleroma_search_model.dart';
import 'package:fedi/pleroma/search/pleroma_search_service.dart';
import 'package:flutter/widgets.dart';

class SearchAccountsListService extends IAccountNetworkOnlyListService {
  final IPleromaSearchService pleromaSearchService;

  final ISearchInputBloc searchInputBloc;

  SearchAccountsListService({
    @required this.pleromaSearchService,
    @required this.searchInputBloc,
  });

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required String minId,
      @required String maxId}) async {
    var query = searchInputBloc.confirmedSearchTerm;
    List<IPleromaAccount> accounts;

    if (query?.isNotEmpty == true) {
      var offset = pageIndex * itemsCountPerPage;
      if (offset > 0) {
        //hack because backend include last item in next page too
        offset += 1;
      }
      var searchResult = await pleromaSearchService.search(
          request: PleromaSearchRequest(
              type: MastodonSearchRequestType.accounts,
              offset: offset,
              resolve: true,
              limit: itemsCountPerPage,
              query: query));

      accounts = searchResult.accounts;
    } else {
      accounts = [];
    }

    return accounts.map(mapRemoteAccountToLocalAccount).toList();
  }

  @override
  IPleromaApi get pleromaApi => pleromaSearchService;

  static SearchAccountsListService createFromContext(BuildContext context) =>
      SearchAccountsListService(
          searchInputBloc: ISearchInputBloc.of(context, listen: false),
          pleromaSearchService:
              IPleromaSearchService.of(context, listen: false));
}
