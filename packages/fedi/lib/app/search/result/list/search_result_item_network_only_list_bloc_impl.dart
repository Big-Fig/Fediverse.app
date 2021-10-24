import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model_adapter.dart';
import 'package:fedi/app/hashtag/list/hashtag_list_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/result/list/search_result_item_network_only_list_bloc.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class SearchResultItemNetworkOnlyListBloc
    extends ISearchResultItemNetworkOnlyListBloc {
  final IUnifediApiSearchService unifediSearchService;

  final ISearchInputBloc searchInputBloc;

  SearchResultItemNetworkOnlyListBloc({
    required this.unifediSearchService,
    required this.searchInputBloc,
  });

  @override
  Future<List<ISearchResultItem>> loadItemsFromRemoteForPage({
    required int? itemsCountPerPage,
    required int pageIndex,
    required String? minId,
    required String? maxId,
  }) async {
    var query = searchInputBloc.confirmedSearchTerm;
    var resultItems = <ISearchResultItem>[];

    if (query?.isNotEmpty == true) {
      var offset = pageIndex * itemsCountPerPage!;
      if (offset > 0) {
        //hack because backend include last item in next page too
        offset += 1;
      }
      var searchResult = await unifediSearchService.search(
        offset: offset,
        resolve: true,
        query: query!,
        type: null,
        pagination: UnifediApiPagination(
          limit: itemsCountPerPage,
          minId: null,
          maxId: null,
        ),
        excludeUnreviewed: null,
        accountId: null,
        following: null,
      );

      for (final status in searchResult.statuses) {
        resultItems.add(
          SearchResultItem.status(
            status.toDbStatusPopulatedWrapper(),
          ),
        );
      }

      for (final account in searchResult.accounts) {
        resultItems.add(
          SearchResultItem.account(
            account.toDbAccountWrapper(),
          ),
        );
      }

      for (final hashtag in searchResult.hashtags) {
        resultItems.add(
          SearchResultItem.hashtag(
            hashtag.toHashtag(),
          ),
        );
      }
    }

    return resultItems;
  }

  @override
  IUnifediApiService get unifediApi => unifediSearchService;

  static SearchResultItemNetworkOnlyListBloc createFromContext(
    BuildContext context,
  ) =>
      SearchResultItemNetworkOnlyListBloc(
        searchInputBloc: ISearchInputBloc.of(
          context,
          listen: false,
        ),
        unifediSearchService: Provider.of<IUnifediApiSearchService>(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<ISearchResultItemNetworkOnlyListBloc>(
        create: SearchResultItemNetworkOnlyListBloc.createFromContext,
        child: ProxyProvider<ISearchResultItemNetworkOnlyListBloc,
            IStatusListBloc>(
          update: (context, value, _) => value,
          child: ProxyProvider<ISearchResultItemNetworkOnlyListBloc,
              IAccountListBloc>(
            update: (context, value, _) => value,
            child: ProxyProvider<ISearchResultItemNetworkOnlyListBloc,
                IHashtagListBloc>(
              update: (context, value, _) => value,
              child: child,
            ),
          ),
        ),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
