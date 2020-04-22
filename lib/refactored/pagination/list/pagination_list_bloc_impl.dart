import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("pagination_list_bloc_impl.dart");

abstract class PaginationListBloc<TPage extends PaginationPage<TItem>, TItem>
    extends AsyncInitLoadingBloc implements IPaginationListBloc<TPage, TItem> {
  final IPaginationBloc<TPage, TItem> paginationBloc;
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
  }

  @override
  Stream<List<TItem>> get itemsStream => sortedPagesStream.map(mapToItemsList);

  @override
  List<TItem> get items => mapToItemsList(sortedPages);

  @override
  int get itemsCountPerPage => paginationBloc.itemsCountPerPage;

  Stream<PaginationRefreshState> get refreshStateStream =>
      paginationBloc.refreshStateStream;

  PaginationRefreshState get refreshState => paginationBloc.refreshState;

  @override
  Future<bool> loadMore() async {
    var nextPageIndex = paginationBloc.loadedPagesMaximumIndex + 1;
    var nextPage = await paginationBloc.requestPage(
        pageIndex: nextPageIndex, forceToUpdateFromNetwork: true);
    var success = nextPage?.items?.isNotEmpty == true;
    return success;
  }

  @override
  Future internalAsyncInit() async {
    var page = await paginationBloc.requestPage(
        pageIndex: 0, forceToUpdateFromNetwork: false);

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

  bool isRefreshedAtLeastOnce = false;

  @override
  Future<bool> refresh() async {
    isRefreshedAtLeastOnce = true;
    var newPage = await paginationBloc.refresh();

    return newPage != null;
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
}
