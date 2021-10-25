import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPaginationBloc<TPage extends PaginationPage<TItem>, TItem>
    implements DisposableOwner {
  static IPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPaginationBloc>(
        context,
        listen: listen,
      );

  int get loadedPagesCount;

  int? get loadedPagesMinimumIndex;

  Stream<int?> get loadedPagesMinimumIndexStream;

  int? get loadedPagesMaximumIndex;

  Stream<int?> get loadedPagesMaximumIndexStream;

  bool get isLoadedPagesInSequence;

  Stream<bool> get isLoadedPagesInSequenceStream;

  List<int> get loadedPageIndexesSortedByIndex;

  Stream<List<int>> get loadedPageIndexesSortedByIndexStream;

  List<TPage> get loadedPagesSortedByIndex;

  Stream<List<TPage>> get loadedPagesSortedByIndexStream;

  int? get itemsCountPerPage;

  Future<TPage> refreshWithoutController();

  Future<TPage> requestPage({
    required int pageIndex,
    required bool forceToSkipCache,
  });
}
