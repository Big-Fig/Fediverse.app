import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/pagination_bloc_impl.dart';

abstract class CachedPaginationBloc<TPage extends CachedPaginationPage<TItem>,
        TItem> extends PaginationBloc<TPage, TItem>
    implements ICachedPaginationBloc<TPage, TItem> {
  CachedPaginationBloc({
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  bool get isPossibleToLoadFromNetwork;

  @override
  Future<TPage> loadPage({
    required bool forceToSkipCache,
    required int pageIndex,
    required TPage? previousPage,
    required TPage? nextPage,
  }) async {
    var isActuallyRefreshed;
    if (forceToSkipCache) {
      if (isPossibleToLoadFromNetwork) {
        isActuallyRefreshed = await refreshItemsFromRemoteForPage(
            pageIndex: pageIndex,
            olderPage: nextPage,
            newerPage: previousPage,
            itemsCountPerPage: itemsCountPerPage);
      } else {
        isActuallyRefreshed = false;
      }
    } else {
      isActuallyRefreshed = false;
    }

    List<TItem> loadedItems = await loadLocalItems(
      pageIndex: pageIndex,
      itemsCountPerPage: itemsCountPerPage,
      olderPage: nextPage,
      newerPage: previousPage,
    );

    return createPage(
      pageIndex: pageIndex,
      loadedItems: loadedItems,
      isActuallyRefreshed: isActuallyRefreshed,
    );
  }

  Future refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required TPage? olderPage,
    required TPage? newerPage,
  });

  Future<List<TItem>> loadLocalItems({
    required int pageIndex,
    required int? itemsCountPerPage,
    required TPage? olderPage,
    required TPage? newerPage,
  });

  TPage createPage({
    required int pageIndex,
    required List<TItem> loadedItems,
    required bool isActuallyRefreshed,
  });
}
