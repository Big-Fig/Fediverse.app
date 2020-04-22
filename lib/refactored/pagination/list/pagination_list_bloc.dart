import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class IPaginationListBloc<TPage extends PaginationPage<TItem>, TItem>
    implements Disposable, IAsyncInitLoadingBloc {
  int get itemsCountPerPage;

  List<TItem> get items;

  Stream<List<TItem>> get itemsStream;

  List<TPage> get sortedPages;

  Stream<List<TPage>> get sortedPagesStream;

  Stream<PaginationRefreshState> get refreshStateStream;

  PaginationRefreshState get refreshState;

  bool get isRefreshedAtLeastOnce;

  Future<bool> refresh();

  Future<bool> loadMore();

  RefreshController get refreshController;
}
