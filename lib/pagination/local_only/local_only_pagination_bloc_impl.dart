import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pagination/local_only/local_only_pagination_bloc.dart';
import 'package:fedi/pagination/pagination_bloc_impl.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:logging/logging.dart';

var _logger = Logger("local_only_pagination_bloc_impl.dart");

abstract class LocalOnlyPaginationBloc<TPage extends PaginationPage<TItem>,
        TItem> extends PaginationBloc<TPage, TItem>
    implements ILocalOnlyPaginationBloc<TPage, TItem> {
  LocalOnlyPaginationBloc({
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  Future<TPage> loadPage({
    required bool forceToSkipCache,
    required int pageIndex,
    required TPage? previousPage,
    required TPage? nextPage,
  }) async {
    _logger.finest(() => "loadPage \n"
        "\t pageIndex=$pageIndex"
        "\t previousPage=$previousPage"
        "\t nextPage=$nextPage");

    List<TItem> loadedItems = await loadItemsFromLocalForPage(
      pageIndex: pageIndex,
      itemsCountPerPage: itemsCountPerPage,
      olderPage: nextPage,
      newerPage: previousPage,
    );

    return createPage(
      pageIndex: pageIndex,
      itemsCountPerPage: itemsCountPerPage,
      loadedItems: loadedItems,
    );
  }

  Future<List<TItem>> loadItemsFromLocalForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required TPage? olderPage,
    required TPage? newerPage,
  });

  TPage createPage({
    required int pageIndex,
    required List<TItem> loadedItems,
    required int? itemsCountPerPage,
  });
}
