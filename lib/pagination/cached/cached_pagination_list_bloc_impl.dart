import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/list/pagination_list_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("cached_pagination_list_bloc_impl.dart");

class CachedPaginationListBloc<TPage extends CachedPaginationPage<TItem>, TItem>
    extends PaginationListBloc<TPage, TItem>
    implements ICachedPaginationListBloc<TPage, TItem> {
  CachedPaginationListBloc(
      {@required ICachedPaginationBloc<TPage, TItem> cachedPaginationBloc})
      : super(paginationBloc: cachedPaginationBloc);

  @override
  Future<PaginationListLoadingState> loadMoreWithoutController() async {
    loadMoreStateSubject.add(PaginationListLoadingState.loading);

    PaginationListLoadingState state;

    try {
      var nextPageIndex = paginationBloc.loadedPagesMaximumIndex + 1;
      CachedPaginationPage nextPage = await paginationBloc.requestPage(
          pageIndex: nextPageIndex, forceToSkipCache: true);
      if (nextPage?.items?.isNotEmpty == true) {
        state = PaginationListLoadingState.loaded;
      } else {
        if (nextPage?.isActuallyRefreshedFromRemote == true) {
          state = PaginationListLoadingState.noData;
        } else {
          state = PaginationListLoadingState.failed;
          if (!loadMoreErrorStreamController.isClosed) {
            loadMoreErrorStreamController.add(PaginationListLoadingError(
                error: CantUpdateFromNetworkException(), stackTrace: null));
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
        loadMoreStateSubject.add(PaginationListLoadingState.failed);
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
  Future<PaginationListLoadingState> refreshWithoutController() async {
    refreshStateSubject.add(PaginationListLoadingState.loading);

    try {
      PaginationListLoadingState state;
      CachedPaginationPage newPage =
          await paginationBloc.refreshWithoutController();

      if (newPage?.items?.isNotEmpty == true) {
        if (newPage?.isActuallyRefreshedFromRemote == true) {
          state = PaginationListLoadingState.loaded;
        } else {
          state = PaginationListLoadingState.failed;
          if (!loadMoreErrorStreamController.isClosed) {
            refreshErrorStreamController.add(PaginationListLoadingError(
                error: CantUpdateFromNetworkException(), stackTrace: null));
          }
        }
      } else {
        if (newPage?.isActuallyRefreshedFromRemote == true) {
          state = PaginationListLoadingState.noData;
        } else {
          state = PaginationListLoadingState.failed;
          if (!loadMoreErrorStreamController.isClosed) {
            refreshErrorStreamController.add(PaginationListLoadingError(
                error: CantUpdateFromNetworkException(), stackTrace: null));
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
        refreshStateSubject.add(PaginationListLoadingState.failed);
      }
      if (!refreshErrorStreamController.isClosed) {
        refreshErrorStreamController
            .add(PaginationListLoadingError(error: e, stackTrace: stackTrace));
      }
      _logger.warning(
          () => "error during refreshWithoutController", e, stackTrace);
      rethrow;
    }
  }
}
