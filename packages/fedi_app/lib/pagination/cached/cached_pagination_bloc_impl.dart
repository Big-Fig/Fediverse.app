import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/pagination_bloc_impl.dart';

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
    bool isActuallyRefreshed;
    if (forceToSkipCache) {
      if (isPossibleToLoadFromNetwork) {
        await refreshItemsFromRemoteForPage(
          pageIndex: pageIndex,
          olderPage: nextPage,
          newerPage: previousPage,
          itemsCountPerPage: itemsCountPerPage,
        );
        isActuallyRefreshed = true;
      } else {
        isActuallyRefreshed = false;
      }
    } else {
      isActuallyRefreshed = false;
    }

    var loadedItems = await loadLocalItems(
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

  Future<void> refreshItemsFromRemoteForPage({
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
