import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class IPaginationBloc<TPage extends PaginationPage<TItem>, TItem>
    implements DisposableOwner {
  int get loadedPagesMinimumIndex;

  Stream<bool> get isLoadedPagesInSequenceStream;

  bool get isLoadedPagesInSequence;

  Stream<int> get loadedPagesMinimumIndexStream;

  int get loadedPagesMaximumIndex;

  Stream<int> get loadedPagesMaximumIndexStream;

  List<TPage> get loadedPagesSortedByIndex;

  Stream<List<TPage>> get loadedPagesSortedByIndexStream;

  List<int> get loadedPageIndexesSorted;

  Stream<List<int>> get loadedPageIndexesSortedStream;

  Future<TPage> requestPage({@required int pageIndex});

  Future<TPage> refresh();

  int get itemsCountPerPage;
}
