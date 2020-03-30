import 'package:fedi/refactored/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/refactored/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class NetworkOnlyPaginationBloc<
        TPage extends PaginationPage<TItem>,
        TItem> extends PaginationBloc<TPage, TItem>
    implements IPaginationBloc<TPage, TItem> {
  NetworkOnlyPaginationBloc(
      {@required int itemsCountPerPage, @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  bool get isPossibleToLoadFromNetwork;

  @override
  Future<TPage> loadPage({
    @required bool forceToUpdateFromNetwork,
    @required int pageIndex,
    @required TPage previousPage,
    @required TPage nextPage,
  }) async {


    List<TItem> loadedItems = await loadItemsFromRemoteForPage(
        pageIndex: pageIndex,
        itemsCountPerPage: itemsCountPerPage,
        olderPage: nextPage,
        newerPage: previousPage);

    return createPage(
        pageIndex: pageIndex,
        itemsCountPerPage: itemsCountPerPage,
        loadedItems: loadedItems);
  }

  Future<List<TItem>> loadItemsFromRemoteForPage({
    @required int pageIndex,
    @required int itemsCountPerPage,
    @required TPage olderPage,
    @required TPage newerPage,
  });


  TPage createPage(
      {@required int pageIndex,
        @required List<TItem> loadedItems,  @required int itemsCountPerPage});

}
