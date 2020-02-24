import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

class PaginationListBloc<TPage extends PaginationPage<TItem>, TItem>
    extends DisposableOwner implements IPaginationListBloc<TPage, TItem> {
  final IPaginationBloc<TPage, TItem> paginationBloc;

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

  Stream<PaginationRefreshState> get refreshStateStream => paginationBloc.refreshStateStream;

  PaginationRefreshState get refreshState => paginationBloc.refreshState;

  @override
  Future<TPage> loadMore() {
    var nextPageIndex = paginationBloc.loadedPagesMaximumIndex + 1;
    return paginationBloc.requestPage(pageIndex: nextPageIndex);
  }

  @override
  List<TPage> get sortedPages => paginationBloc.loadedPagesSortedByIndex;

  @override
  Stream<List<TPage>> get sortedPagesStream =>
      paginationBloc.loadedPagesSortedByIndexStream;

  @override
  Future<TPage> refresh() => paginationBloc.refresh();

  static List<TItem> mapToItemsList<TPage extends PaginationPage<TItem>, TItem>(
      List<TPage> sortedPages) {
    List<TItem> items = [];
    sortedPages.forEach((page) {
      items.addAll(page.items);
    });
    return items;
  }
}
