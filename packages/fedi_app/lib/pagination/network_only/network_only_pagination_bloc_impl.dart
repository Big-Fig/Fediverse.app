import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi_app/pagination/pagination_bloc_impl.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:logging/logging.dart';

var _logger = Logger('network_only_pagination_bloc_impl.dart');

abstract class NetworkOnlyPaginationBloc<TPage extends PaginationPage<TItem>,
        TItem> extends PaginationBloc<TPage, TItem>
    implements INetworkOnlyPaginationBloc<TPage, TItem> {
  NetworkOnlyPaginationBloc({
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
    _logger.finest(
      () => 'loadPage \n'
          '\t pageIndex=$pageIndex'
          '\t previousPage=$previousPage'
          '\t nextPage=$nextPage',
    );

    var loadedItems = await loadItemsFromRemoteForPage(
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

  Future<List<TItem>> loadItemsFromRemoteForPage({
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
