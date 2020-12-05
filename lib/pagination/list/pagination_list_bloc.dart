import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pagination/list/pagination_list_model.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class IPaginationListBloc<TPage extends PaginationPage<TItem>, TItem>
    implements IDisposable, IAsyncInitLoadingBloc {
  static IPaginationListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPaginationListBloc>(context, listen: listen);

  int get itemsCountPerPage;

  List<TPage> get sortedPages;

  Stream<List<TPage>> get sortedPagesStream;

  List<TItem> get items;

  Stream<List<TItem>> get itemsStream;

  Stream<List<TItem>> get itemsDistinctStream;

  Future<PaginationListLoadingState> refreshWithoutController();

  void refreshWithController();

  Future<PaginationListLoadingState> loadMoreWithoutController();

  RefreshController get refreshController;

  Stream<PaginationListLoadingState> get refreshStateStream;

  PaginationListLoadingState get refreshState;

  Stream<PaginationListLoadingState> get loadMoreStateStream;

  PaginationListLoadingState get loadMoreState;

  Stream<PaginationListLoadingError> get refreshErrorStream;

  Stream<PaginationListLoadingError> get loadMoreErrorStream;
}
