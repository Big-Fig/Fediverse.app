import 'package:fedi/disposable/disposable_owner.dart';

import 'package:fedi/pagination/pagination_model.dart';

abstract class IPaginationListBloc<TPage extends PaginationPage<TItem>, TItem>
    implements DisposableOwner {

  int get itemsCountPerPage;

  List<TItem> get items;
  Stream<List<TItem>> get itemsStream;

  List<TPage> get sortedPages;
  Stream<List<TPage>> get sortedPagesStream;

  Stream<PaginationRefreshState> get refreshStateStream;

  PaginationRefreshState get refreshState;

  Future<TPage> refresh();

  Future<TPage> loadMore();
}
