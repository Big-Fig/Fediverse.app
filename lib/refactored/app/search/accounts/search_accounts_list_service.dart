import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/account/list/network_only/account_network_only_list_service.dart';
import 'package:fedi/refactored/app/search/input/search_input_bloc.dart';
import 'package:fedi/refactored/mastodon/search/mastodon_search_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/search/pleroma_search_model.dart';
import 'package:fedi/refactored/pleroma/search/pleroma_search_service.dart';
import 'package:flutter/widgets.dart';

class SearchAccountsListService extends IAccountNetworkOnlyListService {
  final IPleromaSearchService pleromaSearchService;

  final ISearchInputBloc searchInputBloc;

  SearchAccountsListService(
      {@required this.pleromaSearchService, @required this.searchInputBloc,});

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage(
      {@required int itemsCountPerPage, @required String minId, @required String maxId}) async {
    var query = searchInputBloc.searchText;
    List<IPleromaAccount> accounts;

    if(query?.isNotEmpty == true) {
      var searchResult = await pleromaSearchService.search(
          request: PleromaSearchRequest(type: MastodonSearchRequestType.accounts,
              minId: minId,
              maxId: maxId,
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
          pleromaSearchService: IPleromaSearchService.of(
              context, listen: false));
}
