import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_model.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

Function eq = const ListEquality().equals;

var _logger = Logger("pagination_list_bloc_impl.dart");

class PaginationListBloc<TPage extends PaginationPage<TItem>, TItem>
    extends AsyncInitLoadingBloc implements IPaginationListBloc<TPage, TItem> {
  final IPaginationBloc<TPage, TItem> paginationBloc;

  StreamController<PaginationListLoadingError> refreshErrorStreamController =
      StreamController.broadcast();

  @override
  Stream<PaginationListLoadingError> get refreshErrorStream =>
      refreshErrorStreamController.stream;

  StreamController<PaginationListLoadingError> loadMoreErrorStreamController =
      StreamController.broadcast();

  @override
  Stream<PaginationListLoadingError> get loadMoreErrorStream =>
      loadMoreErrorStreamController.stream;

  BehaviorSubject<FediListSmartRefresherLoadingState> refreshStateSubject =
      BehaviorSubject.seeded(FediListSmartRefresherLoadingState.initialized);

  @override
  Stream<FediListSmartRefresherLoadingState> get refreshStateStream =>
      refreshStateSubject.stream;

  @override
  FediListSmartRefresherLoadingState? get refreshState =>
      refreshStateSubject.value;

  BehaviorSubject<FediListSmartRefresherLoadingState> loadMoreStateSubject =
      BehaviorSubject.seeded(FediListSmartRefresherLoadingState.initialized);

  @override
  Stream<FediListSmartRefresherLoadingState> get loadMoreStateStream =>
      loadMoreStateSubject.stream;

  @override
  FediListSmartRefresherLoadingState? get loadMoreState =>
      loadMoreStateSubject.value;

  @override
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final bool loadFromCacheDuringInit;

  PaginationListBloc({
    required this.paginationBloc,
    this.loadFromCacheDuringInit = true,
  }) {
    _logger.finest(() => "PaginationListBloc constructor");
    addDisposable(
      streamSubscription: paginationBloc.isLoadedPagesInSequenceStream.listen(
        (isLoadedInSequence) {
          if (!isLoadedInSequence) {
            throw "PaginationListBloc don't work with direct access "
                "pagination blocs";
          }
        },
      ),
    );
    addDisposable(subject: refreshStateSubject);
    addDisposable(subject: loadMoreStateSubject);
    addDisposable(streamController: refreshErrorStreamController);
    addDisposable(streamController: loadMoreErrorStreamController);
  }

  @override
  Stream<List<TItem>> get itemsStream =>
      sortedPagesStream.map((sortedPages) => mapToItemsList(sortedPages));

  @override
  Stream<List<TItem>> get itemsDistinctStream =>
      itemsStream.distinct((a, b) => eq(a, b));

  @override
  List<TItem> get items => mapToItemsList(sortedPages);

  @override
  int? get itemsCountPerPage => paginationBloc.itemsCountPerPage;

  @override
  Future internalAsyncInit() async {
    _logger.finest(() =>
        "internalAsyncInit loadFromCacheDuringInit $loadFromCacheDuringInit");

    if (loadFromCacheDuringInit) {
      try {
        var page = await paginationBloc.requestPage(
          pageIndex: 0,
          forceToSkipCache: false,
        );
      } catch (e, stackTrace) {
        _logger.severe(
          () => "failed to internalAsyncInit",
          e,
          stackTrace,
        );
      }
    }
  }

  @override
  List<TPage> get sortedPages => paginationBloc.loadedPagesSortedByIndex;

  @override
  Stream<List<TPage>> get sortedPagesStream =>
      paginationBloc.loadedPagesSortedByIndexStream;

  @override
  Future<FediListSmartRefresherLoadingState> loadMoreWithoutController() async {
    _logger.finest(() => "loadMoreWithoutController");
    loadMoreStateSubject.add(FediListSmartRefresherLoadingState.loading);

    try {
      FediListSmartRefresherLoadingState state;
      var nextPageIndex = paginationBloc.loadedPagesMaximumIndex! + 1;
      var nextPage = await paginationBloc.requestPage(
          pageIndex: nextPageIndex, forceToSkipCache: true);

      if (nextPage.items.isNotEmpty == true) {
        state = FediListSmartRefresherLoadingState.loaded;
      } else {
        state = FediListSmartRefresherLoadingState.noData;
      }
      loadMoreStateSubject.add(state);

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
    _logger.finest(() => "refreshWithoutController");
    try {
      FediListSmartRefresherLoadingState state;
      if (!refreshStateSubject.isClosed) {
        refreshStateSubject.add(FediListSmartRefresherLoadingState.loading);
      }
      var newPage = await paginationBloc.refreshWithoutController();

      if (newPage.items.isNotEmpty == true) {
        state = FediListSmartRefresherLoadingState.loaded;
      } else {
        state = FediListSmartRefresherLoadingState.noData;
      }
      if (!refreshStateSubject.isClosed) {
        refreshStateSubject.add(state);
      }
      return state;
    } catch (e, stackTrace) {
      if (!refreshStateSubject.isClosed) {
        refreshStateSubject.add(FediListSmartRefresherLoadingState.failed);
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

  static List<TItem>
      mapToItemsList<TPage extends PaginationPage<TItem>, TItem>(
          List<TPage> sortedPages) {
    List<TItem> items = [];
    sortedPages.forEach((page) {
      items.addAll(page.items);
    });
    return items;
  }

  @override
  Future refreshWithController() async {
    _logger.finest(() => "refreshWithController");
    // refresh controller if it attached
    if (refreshController.position != null) {
      try {
        return await refreshController.requestRefresh(needMove: false);
      } catch (e, stackTrace) {
        // ignore error, because it is related to refresh controller
        // internal wrong logic
        _logger.warning(
            () =>
                "error during refreshController.requestRefresh(needMove:false);",
            e,
            stackTrace);
      }
    } else {
      //otherwise refresh only bloc
      return await refreshWithoutController();
    }
  }
}
