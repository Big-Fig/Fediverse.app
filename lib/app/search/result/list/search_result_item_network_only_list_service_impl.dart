import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/result/list/search_result_item_network_only_list_bloc.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/search/pleroma_search_model.dart';
import 'package:fedi/pleroma/search/pleroma_search_service.dart';
import 'package:flutter/widgets.dart';

class SearchResultItemsNetworkOnlyListBloc
    extends ISearchResultItemNetworkOnlyListBloc {
  final IPleromaSearchService pleromaSearchService;

  final ISearchInputBloc searchInputBloc;

  SearchResultItemsNetworkOnlyListBloc({
    @required this.pleromaSearchService,
    @required this.searchInputBloc,
  });

  @override
  Future<List<ISearchResultItem>> loadItemsFromRemoteForPage(
      {@required int itemsCountPerPage,
      @required int pageIndex,
      @required String minId,
      @required String maxId}) async {
    var query = searchInputBloc.confirmedSearchTerm;
    List<ISearchResultItem> resultItems = [];

    if (query?.isNotEmpty == true) {
      var offset = pageIndex * itemsCountPerPage;
      if (offset > 0) {
        //hack because backend include last item in next page too
        offset += 1;
      }
      var searchResult = await pleromaSearchService.search(
          request: PleromaSearchRequest(
              type: null,
              offset: offset,
              resolve: true,
              limit: itemsCountPerPage,
              query: query));

      searchResult.statuses.forEach((status) {
        resultItems
            .add(SearchResultItem.status(mapRemoteStatusToLocalStatus(status)));
      });
      searchResult.accounts.forEach((account) {
        resultItems.add(
            SearchResultItem.account(mapRemoteAccountToLocalAccount(account)));
      });

      searchResult.hashtags.forEach((hashtag) {
        resultItems.add(SearchResultItem.hashtag(Hashtag(
          name: hashtag.name,
          url: hashtag.url,
          history: hashtag.history,
        )));
      });
    }

    return resultItems;
  }

  @override
  IPleromaApi get pleromaApi => pleromaSearchService;

  static SearchResultItemsNetworkOnlyListBloc createFromContext(
          BuildContext context) =>
      SearchResultItemsNetworkOnlyListBloc(
          searchInputBloc: ISearchInputBloc.of(context, listen: false),
          pleromaSearchService:
              IPleromaSearchService.of(context, listen: false));

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<ISearchResultItemNetworkOnlyListBloc>(
      create: (context) =>
          SearchResultItemsNetworkOnlyListBloc.createFromContext(context),
      child: child,
    );
  }
}
