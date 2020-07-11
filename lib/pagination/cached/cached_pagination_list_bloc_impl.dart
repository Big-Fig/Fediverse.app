import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/list/pagination_list_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("cached_pagination_list_bloc_impl.dart");

class CachedPaginationListBloc<TPage extends CachedPaginationPage<TItem>, TItem>
    extends PaginationListBloc<TPage, TItem> {
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
        }
      }
      loadMoreStateSubject.add(state);
      return state;
    } catch (e, stackTrace) {
      loadMoreStateSubject.add(PaginationListLoadingState.failed);
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
        }
      } else {
        if (newPage?.isActuallyRefreshedFromRemote == true) {
          state = PaginationListLoadingState.noData;
        } else {
          state = PaginationListLoadingState.failed;
        }
      }
      refreshStateSubject.add(state);
      return state;
    } catch (e, stackTrace) {
      refreshStateSubject.add(PaginationListLoadingState.failed);
      _logger.warning(
          () => "error during refreshWithoutController", e, stackTrace);
      rethrow;
    }
  }
}
