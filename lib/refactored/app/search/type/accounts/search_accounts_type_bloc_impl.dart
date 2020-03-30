import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/search/input/search_input_bloc.dart';
import 'package:fedi/refactored/app/search/tab/accounts/search_accounts_tab_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/network_only/network_only_pagination_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:fedi/refactored/pleroma/search/pleroma_search_model.dart';
import 'package:fedi/refactored/pleroma/search/pleroma_search_service.dart';
import 'package:flutter/widgets.dart';

class SearchAccountsTabBloc
    extends NetworkOnlyPaginationBloc<PaginationPage<IAccount>, IAccount>
    implements ISearchAccountsTabBloc {
  final ISearchInputBloc searchInputBloc;
  final IPleromaSearchService pleromaSearchService;
  final IPaginationListBloc<IAccount> paginationListBloc;

  SearchAccountsTabBloc({
    @required this.pleromaSearchService,
    @required this.searchInputBloc,
  }): paginationListBloc = Net;

  @override
  bool get isPossibleToLoadFromNetwork => pleromaSearchService.isApiReadyToUse;

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage(
      {int pageIndex,
      int itemsCountPerPage,
      PaginationPage<IAccount> olderPage,
      PaginationPage<IAccount> newerPage}) async {

    var searchResult = await pleromaSearchService.search(
        request: PleromaSearchRequest(
            minId: olderPage?.items?.last?.remoteId,
            maxId: newerPage?.items?.first?.remoteId,
            limit: itemsCountPerPage,
            query: searchInputBloc.searchText));

    return searchResult.accounts.map(mapRemoteAccountToLocalAccount).toList();
  }

  @override
  PaginationPage<IAccount> createPage(
          {int pageIndex, List<IAccount> loadedItems, int itemsCountPerPage}) =>
      PaginationPage(
          pageIndex: pageIndex,
          items: loadedItems,
          requestedLimitPerPage: itemsCountPerPage);
}
