import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("status_pagination_list_with_new_items_bloc_impl.dart");

class StatusCachedPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IStatus>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IStatus> {
  final IStatusCachedListBloc statusCachedListBloc;

  StatusCachedPaginationListWithNewItemsBloc(
      {@required bool mergeNewItemsImmediately,
      @required this.statusCachedListBloc,
      @required IPaginationBloc<TPage, IStatus> paginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: paginationBloc) {
    addDisposable(streamSubscription:
        statusCachedListBloc.settingsChangedStream.listen((changed) async {
      if (changed == true) {
        refreshWithController();
      }
    }));
  }

  @override
  Stream<List<IStatus>> watchItemsNewerThanItem(IStatus item) {
    _logger.finest(() => "watchItemsNewerThanItem item = $item");
    return statusCachedListBloc.watchLocalItemsNewerThanItem(item);
  }

  @override
  int compareItemsToSort(IStatus a, IStatus b) {
    if (a == null && b == null) {
      return 0;
    }

    if (a != null && b == null) {
      return 1;
    }
    if (a == null && b != null) {
      return -1;
    }
    return a.remoteId.compareTo(b.remoteId);
  }

  @override
  bool isItemsEqual(IStatus a, IStatus b) => a.remoteId == b.remoteId;

  static Widget provideToContext<TPage extends CachedPaginationPage<IStatus>>(
      BuildContext context,
      {@required bool mergeNewItemsImmediately,
      @required Widget child}) {
    return DisposableProvider<
        ICachedPaginationListWithNewItemsBloc<TPage, IStatus>>(
      create: (context) =>
          StatusCachedPaginationListWithNewItemsBloc._createFromContext<TPage>(
              context,
              mergeNewItemsImmediately: mergeNewItemsImmediately),
      child: ProxyProvider<
          ICachedPaginationListWithNewItemsBloc<TPage, IStatus>,
          ICachedPaginationListWithNewItemsBloc>(
        update: (context, value, previous) => value,
        child:
            CachedPaginationListWithNewItemsBlocProxyProvider<TPage, IStatus>(
                child: child),
      ),
    );
  }

  static StatusCachedPaginationListWithNewItemsBloc<TPage>
      _createFromContext<TPage extends CachedPaginationPage<IStatus>>(
          BuildContext context,
          {@required bool mergeNewItemsImmediately}) {
    return StatusCachedPaginationListWithNewItemsBloc<TPage>(
        mergeNewItemsImmediately: mergeNewItemsImmediately,
        paginationBloc: Provider.of<IPaginationBloc<TPage, IStatus>>(context,
            listen: false),
        statusCachedListBloc: IStatusCachedListBloc.of(context, listen: false));
  }
}
