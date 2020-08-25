import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/search/result/list/search_result_item_network_only_list_bloc.dart';
import 'package:fedi/app/search/result/pagination/search_result_item_network_only_pagination_bloc.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchResultItemNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<ISearchResultItem>
    implements ISearchResultItemNetworkOnlyPaginationBloc {
  final ISearchResultItemNetworkOnlyListBloc listService;

  SearchResultItemNetworkOnlyPaginationBloc(
      {@required this.listService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  static SearchResultItemNetworkOnlyPaginationBloc createFromContext(
          BuildContext context,
          {int itemsCountPerPage = 20,
          int maximumCachedPagesCount}) =>
      SearchResultItemNetworkOnlyPaginationBloc(
          maximumCachedPagesCount: maximumCachedPagesCount,
          itemsCountPerPage: itemsCountPerPage,
          listService: ISearchResultItemNetworkOnlyListBloc.of(context,
              listen: false));

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<ISearchResultItemNetworkOnlyPaginationBloc>(
      create: (context) =>
          SearchResultItemNetworkOnlyPaginationBloc.createFromContext(context),
      child: ProxyProvider<
          ISearchResultItemNetworkOnlyPaginationBloc,
          IPaginationBloc<PaginationPage<ISearchResultItem>,
              ISearchResultItem>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ISearchResultItemNetworkOnlyPaginationBloc,
            IPaginationBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      ),
    );
  }

  @override
  Future<List<ISearchResultItem>> loadItemsFromRemoteForPage(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required PaginationPage<ISearchResultItem> olderPage,
          @required PaginationPage<ISearchResultItem> newerPage}) =>
      listService.loadItemsFromRemoteForPage(
          itemsCountPerPage: itemsCountPerPage,
          // not used
          maxId: null,
          // not used
          minId: null,
          pageIndex: pageIndex);
}
