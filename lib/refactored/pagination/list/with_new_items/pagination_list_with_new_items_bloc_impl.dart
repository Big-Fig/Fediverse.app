import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

class PaginationListWithNewItemsBloc<TPage extends PaginationPage<TItem>, TItem>
    extends AsyncInitLoadingBloc
    implements IPaginationListWithNewItemsBloc<TPage, TItem> {
  final IPaginationListBloc<TPage, TItem> paginationListBloc;
  final Stream<List<TItem>> newItemsStream;

  @override
  final bool mergeNewItemsImmediately;

  // ignore: close_sinks
  BehaviorSubject<List<TItem>> _unmergedNewItemsSubject =
      BehaviorSubject.seeded([]);

  // ignore: close_sinks
  BehaviorSubject<List<TItem>> _mergedNewItemsSubject =
      BehaviorSubject.seeded([]);

  PaginationListWithNewItemsBloc(
      {@required this.paginationListBloc,
      @required this.mergeNewItemsImmediately,
      @required this.newItemsStream}) {
    addDisposable(subject: _unmergedNewItemsSubject);
    addDisposable(subject: _mergedNewItemsSubject);
    addDisposable(streamSubscription: newItemsStream.listen((newItems) {
      addNewUnmergedItems(newItems);
    }));
  }

  addNewUnmergedItems(List<TItem> newItems) {
    if (mergeNewItemsImmediately) {
      _mergedNewItemsSubject.add([...newItems, ...mergedNewItems]);
    } else {
      _unmergedNewItemsSubject.add([...newItems, ...unmergedNewItems]);
    }
  }

  @override
  Future internalAsyncInit() async {
    await paginationListBloc.performAsyncInit();
  }

  @override
  List<TItem> get items => [...mergedNewItems, ...paginationListBloc.items];

  @override
  Stream<List<TItem>> get itemsStream => Rx.combineLatest2(
      mergedNewItemsStream,
      paginationListBloc.itemsStream,
      (mergedNewItems, items) => [...mergedNewItems, ...items]);

  @override
  Future<bool> loadMore() => paginationListBloc.loadMore();

  @override
  bool get isHaveUnmergedNewItems => unmergedNewItemsCount > 0;

  @override
  Stream<bool> get isHaveUnmergedNewItemsStream => unmergedNewItemsCountStream
      .map((isHaveUnmergedNewItems) => unmergedNewItemsCount > 0);

  @override
  List<TItem> get unmergedNewItems => _unmergedNewItemsSubject.value;

  @override
  Stream<List<TItem>> get unmergedNewItemsStream =>
      _unmergedNewItemsSubject.stream;

  @override
  int get unmergedNewItemsCount => unmergedNewItems?.length ?? 0;

  @override
  Stream<int> get unmergedNewItemsCountStream => unmergedNewItemsStream
      .map((unmergedNewItems) => unmergedNewItems?.length ?? 0);

  @override
  bool get isHaveMergedNewItems => mergedNewItemsCount > 0;

  @override
  Stream<bool> get isHaveMergedNewItemsStream => mergedNewItemsCountStream
      .map((isHaveMergedNewItems) => mergedNewItemsCount > 0);

  @override
  List<TItem> get mergedNewItems => _mergedNewItemsSubject.value;

  @override
  Stream<List<TItem>> get mergedNewItemsStream => _mergedNewItemsSubject.stream;

  @override
  int get mergedNewItemsCount => mergedNewItems?.length ?? 0;

  @override
  Stream<int> get mergedNewItemsCountStream =>
      mergedNewItemsStream.map((mergedNewItems) => mergedNewItems?.length ?? 0);

  @override
  mergeNewItems() {
    _mergedNewItemsSubject.add([...unmergedNewItems, ...mergedNewItems]);
    _unmergedNewItemsSubject.add([]);
  }

  @override
  Future<bool> refresh() {
    clear();
    return paginationListBloc.refresh();
  }

  @override
  bool get isRefreshedAtLeastOnce => paginationListBloc.isRefreshedAtLeastOnce;

  @override
  RefreshController get refreshController =>
      paginationListBloc.refreshController;

  @override
  PaginationRefreshState get refreshState => paginationListBloc.refreshState;

  @override
  Stream<PaginationRefreshState> get refreshStateStream =>
      paginationListBloc.refreshStateStream;

  @override
  List<TPage> get sortedPages => paginationListBloc.sortedPages;

  @override
  Stream<List<TPage>> get sortedPagesStream =>
      paginationListBloc.sortedPagesStream;

  @override
  int get itemsCountPerPage => paginationListBloc.itemsCountPerPage;

  void clear() {
    _mergedNewItemsSubject.add([]);
    _unmergedNewItemsSubject.add([]);
  }
}
