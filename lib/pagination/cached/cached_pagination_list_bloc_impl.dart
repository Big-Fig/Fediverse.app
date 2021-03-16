import 'package:fedi/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/list/pagination_list_model.dart';
import 'package:logging/logging.dart';

var _logger = Logger("cached_pagination_list_bloc_impl.dart");

class CachedPaginationListBloc<TPage extends CachedPaginationPage<TItem>, TItem>
    extends PaginationListBloc<TPage, TItem>
    implements ICachedPaginationListBloc<TPage, TItem> {
  CachedPaginationListBloc({
    required ICachedPaginationBloc<TPage, TItem> cachedPaginationBloc,
  }) : super(paginationBloc: cachedPaginationBloc);

  @override
  Future<FediListSmartRefresherLoadingState> loadMoreWithoutController() async {
    loadMoreStateSubject.add(FediListSmartRefresherLoadingState.loading);

    FediListSmartRefresherLoadingState state;

    try {

      var nextPageIndex = paginationBloc.loadedPagesMaximumIndex! + 1;
      CachedPaginationPage nextPage = await paginationBloc.requestPage(
        pageIndex: nextPageIndex,
        forceToSkipCache: true,
      );
      if (nextPage.items.isNotEmpty == true) {
        state = FediListSmartRefresherLoadingState.loaded;
      } else {
        if (nextPage.isActuallyRefreshedFromRemote == true) {
          state = FediListSmartRefresherLoadingState.noData;
        } else {
          state = FediListSmartRefresherLoadingState.failed;
          if (!loadMoreErrorStreamController.isClosed) {
            loadMoreErrorStreamController.add(
              PaginationListLoadingError(
                error: CantUpdateFromNetworkException(),
                stackTrace: null,
              ),
            );
          }
        }
      }
      if (!loadMoreStateSubject.isClosed) {
        loadMoreStateSubject.add(state);
      }

      return state;
    } catch (e, stackTrace) {
      // todo: refactor copy-pasted code
      if (!loadMoreStateSubject.isClosed) {
        loadMoreStateSubject.add(FediListSmartRefresherLoadingState.failed);
      }

      if (!loadMoreErrorStreamController.isClosed) {
        loadMoreErrorStreamController
            .add(PaginationListLoadingError(error: e, stackTrace: stackTrace));
      }

      _logger.warning(
          () => "error during loadMoreWithoutController", e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<FediListSmartRefresherLoadingState> refreshWithoutController() async {
    refreshStateSubject.add(FediListSmartRefresherLoadingState.loading);

    try {
      FediListSmartRefresherLoadingState state;
      CachedPaginationPage newPage =
          await paginationBloc.refreshWithoutController();

      if (newPage.items.isNotEmpty == true) {
        if (newPage.isActuallyRefreshedFromRemote == true) {
          state = FediListSmartRefresherLoadingState.loaded;
        } else {
          state = FediListSmartRefresherLoadingState.failed;
          if (!loadMoreErrorStreamController.isClosed) {
            refreshErrorStreamController.add(
              PaginationListLoadingError(
                error: CantUpdateFromNetworkException(),
                stackTrace: null,
              ),
            );
          }
        }
      } else {
        if (newPage.isActuallyRefreshedFromRemote == true) {
          state = FediListSmartRefresherLoadingState.noData;
        } else {
          state = FediListSmartRefresherLoadingState.failed;
          if (!loadMoreErrorStreamController.isClosed) {
            refreshErrorStreamController.add(
              PaginationListLoadingError(
                error: CantUpdateFromNetworkException(),
                stackTrace: null,
              ),
            );
          }
        }
      }
      if (!refreshStateSubject.isClosed) {
        refreshStateSubject.add(state);
      }

      return state;
    } catch (e, stackTrace) {
      // todo: refactor copy-pasted code
      if (!refreshStateSubject.isClosed) {
        refreshStateSubject.add(
          FediListSmartRefresherLoadingState.failed,
        );
      }
      if (!refreshErrorStreamController.isClosed) {
        refreshErrorStreamController.add(
          PaginationListLoadingError(
            error: e,
            stackTrace: stackTrace,
          ),
        );
      }
      _logger.warning(
          () => "error during refreshWithoutController", e, stackTrace);
      rethrow;
    }
  }
}
