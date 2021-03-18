import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';

abstract class SearchAdapterPaginationBloc<T> extends DisposableOwner
    implements IPaginationBloc<PaginationPage<T>, T> {
  final IPaginationBloc<PaginationPage<ISearchResultItem>, ISearchResultItem>
      searchResultItemPaginationBloc;

  SearchAdapterPaginationBloc({
    required this.searchResultItemPaginationBloc,
  });

  @override
  bool get isLoadedPagesInSequence =>
      searchResultItemPaginationBloc.isLoadedPagesInSequence;

  @override
  Stream<bool> get isLoadedPagesInSequenceStream =>
      searchResultItemPaginationBloc.isLoadedPagesInSequenceStream;

  @override
  int? get itemsCountPerPage =>
      searchResultItemPaginationBloc.itemsCountPerPage;

  @override
  List<int> get loadedPageIndexesSortedByIndex =>
      searchResultItemPaginationBloc.loadedPageIndexesSortedByIndex;

  @override
  Stream<List<int>> get loadedPageIndexesSortedByIndexStream =>
      searchResultItemPaginationBloc.loadedPageIndexesSortedByIndexStream;

  @override
  int? get loadedPagesMaximumIndex =>
      searchResultItemPaginationBloc.loadedPagesMaximumIndex;

  @override
  Stream<int?> get loadedPagesMaximumIndexStream =>
      searchResultItemPaginationBloc.loadedPagesMaximumIndexStream;

  @override
  int? get loadedPagesMinimumIndex =>
      searchResultItemPaginationBloc.loadedPagesMinimumIndex;

  @override
  Stream<int?> get loadedPagesMinimumIndexStream =>
      searchResultItemPaginationBloc.loadedPagesMinimumIndexStream;

  @override
  List<PaginationPage<T>> get loadedPagesSortedByIndex =>
      searchResultItemPaginationBloc.loadedPagesSortedByIndex
          .map(mapPage)
          .toList();

  @override
  Stream<List<PaginationPage<T>>> get loadedPagesSortedByIndexStream =>
      searchResultItemPaginationBloc.loadedPagesSortedByIndexStream
          .map((list) => list.map(mapPage).toList());

  @override
  Future<PaginationPage<T>> refreshWithoutController() async {
    var page = await searchResultItemPaginationBloc.refreshWithoutController();
    return mapPage(page);
  }

  @override
  Future<PaginationPage<T>> requestPage({
    required int pageIndex,
    required bool forceToSkipCache,
  }) async {
    var page = await searchResultItemPaginationBloc.requestPage(
      pageIndex: pageIndex,
      forceToSkipCache: forceToSkipCache,
    );
    return mapPage(page);
  }

  PaginationPage<T> mapPage(PaginationPage<ISearchResultItem> page);
}
