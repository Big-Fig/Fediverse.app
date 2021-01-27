import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model_adapter.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/result/list/search_result_item_network_only_list_bloc.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/search/pleroma_search_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchResultItemNetworkOnlyListBloc
    extends ISearchResultItemNetworkOnlyListBloc {
  final IPleromaSearchService pleromaSearchService;

  final ISearchInputBloc searchInputBloc;

  SearchResultItemNetworkOnlyListBloc({
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
        offset: offset,
        resolve: true,
        query: query,
        type: null,
        pagination: PleromaPaginationRequest(
          limit: itemsCountPerPage,
        ),
      );

      searchResult.statuses.forEach((status) {
        resultItems
            .add(SearchResultItem.status(mapRemoteStatusToLocalStatus(status)));
      });
      searchResult.accounts.forEach((account) {
        resultItems.add(
            SearchResultItem.account(mapRemoteAccountToLocalAccount(account)));
      });

      searchResult.hashtags.forEach((hashtag) {
        resultItems.add(
          SearchResultItem.hashtag(
            mapRemoteHashtagToLocalHashtag(hashtag),
          ),
        );
      });
    }

    return resultItems;
  }

  @override
  IPleromaApi get pleromaApi => pleromaSearchService;

  static SearchResultItemNetworkOnlyListBloc createFromContext(
          BuildContext context) =>
      SearchResultItemNetworkOnlyListBloc(
          searchInputBloc: ISearchInputBloc.of(context, listen: false),
          pleromaSearchService:
              IPleromaSearchService.of(context, listen: false));

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<ISearchResultItemNetworkOnlyListBloc>(
      create: (context) =>
          SearchResultItemNetworkOnlyListBloc.createFromContext(context),
      child:
          ProxyProvider<ISearchResultItemNetworkOnlyListBloc, IStatusListBloc>(
        update: (context, value, _) => value,
        child: ProxyProvider<ISearchResultItemNetworkOnlyListBloc,
            IAccountListBloc>(
          update: (context, value, _) => value,
          child: child,
        ),
      ),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri get remoteInstanceUriOrNull => null;
}
