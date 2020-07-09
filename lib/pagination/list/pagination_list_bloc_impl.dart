import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_model.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("pagination_list_bloc_impl.dart");

class PaginationListBloc<TPage extends PaginationPage<TItem>, TItem>
    extends AsyncInitLoadingBloc implements IPaginationListBloc<TPage, TItem> {
  final IPaginationBloc<TPage, TItem> paginationBloc;

  BehaviorSubject<PaginationListLoadingState> refreshStateSubject =
      BehaviorSubject.seeded(PaginationListLoadingState.initialized);

  @override
  Stream<PaginationListLoadingState> get refreshStateStream =>
      refreshStateSubject.stream;

  @override
  PaginationListLoadingState get refreshState => refreshStateSubject.value;

  BehaviorSubject<PaginationListLoadingState> loadMoreStateSubject =
      BehaviorSubject.seeded(PaginationListLoadingState.initialized);

  @override
  Stream<PaginationListLoadingState> get loadMoreStateStream =>
      loadMoreStateSubject.stream;

  @override
  PaginationListLoadingState get loadMoreState => loadMoreStateSubject.value;

  @override
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  PaginationListBloc({@required this.paginationBloc}) {
    addDisposable(streamSubscription: paginationBloc
        .isLoadedPagesInSequenceStream
        .listen((isLoadedInSequence) {
      if (!isLoadedInSequence) {
        throw "PaginationListBloc don't work with direct access "
            "pagination blocs";
      }
    }));
    addDisposable(subject: refreshStateSubject);
  }

  @override
  Stream<List<TItem>> get itemsStream => sortedPagesStream.map(mapToItemsList);

  @override
  List<TItem> get items => mapToItemsList(sortedPages);

  @override
  int get itemsCountPerPage => paginationBloc.itemsCountPerPage;

  @override
  Future internalAsyncInit() async {
    var page =
        await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);

    if (page == null) {
      _logger.severe(
          () => "failed to internalAsyncInit: fail to request first page");
    }
  }

  @override
  List<TPage> get sortedPages => paginationBloc.loadedPagesSortedByIndex;

  @override
  Stream<List<TPage>> get sortedPagesStream =>
      paginationBloc.loadedPagesSortedByIndexStream;

  @override
  Future<PaginationListLoadingState> loadMoreWithoutController() async {
    loadMoreStateSubject.add(PaginationListLoadingState.loading);

    try {
      PaginationListLoadingState state;
      var nextPageIndex = paginationBloc.loadedPagesMaximumIndex + 1;
      var nextPage = await paginationBloc.requestPage(
          pageIndex: nextPageIndex, forceToSkipCache: true);

      if (nextPage?.items?.isNotEmpty == true) {
        state = PaginationListLoadingState.loaded;
      } else {
        state = PaginationListLoadingState.noData;
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
    try {
      PaginationListLoadingState state;
      refreshStateSubject.add(PaginationListLoadingState.loading);
      var newPage = await paginationBloc.refreshWithoutController();

      if (newPage?.items?.isNotEmpty == true) {
        state = PaginationListLoadingState.loaded;
      } else {
        state = PaginationListLoadingState.noData;
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

  static List<TItem> mapToItemsList<TPage extends PaginationPage<TItem>, TItem>(
      List<TPage> sortedPages) {
    if (sortedPages?.isNotEmpty != true) {
      // null items and empty items is different states
      return null;
    }
    List<TItem> items = [];
    sortedPages.forEach((page) {
      items.addAll(page.items);
    });
    return items;
  }

  @override
  void refreshWithController() {
    // refresh controller if it attached
    if (refreshController.position != null) {
      try {
        refreshController.requestRefresh(needMove: false);
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
      refreshWithoutController();
    }
  }
}
