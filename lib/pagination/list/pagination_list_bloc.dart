import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class IPaginationListBloc<TPage extends PaginationPage<TItem>, TItem>
    implements Disposable, IAsyncInitLoadingBloc {
  int get itemsCountPerPage;

  bool get isRefreshedAtLeastOnce;

  List<TPage> get sortedPages;

  Stream<List<TPage>> get sortedPagesStream;

  List<TItem> get items;

  Stream<List<TItem>> get itemsStream;

  Future<bool> refresh();

  Future<bool> loadMore();

  RefreshController get refreshController;

  Stream<RefreshStatus> get refreshControllerRefreshStatusStream;
  RefreshStatus get refreshControllerRefreshStatus;
}
