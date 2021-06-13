import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger('status_pagination_list_with_new_items_bloc_impl.dart');

class StatusCachedPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IStatus>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IStatus> {
  final IStatusCachedListBloc statusCachedListBloc;
  final IMyAccountBloc myAccountBloc;
  final bool mergeOwnStatusesImmediately;

  StatusCachedPaginationListWithNewItemsBloc({
    required bool mergeNewItemsImmediately,
    required this.statusCachedListBloc,
    required this.myAccountBloc,
    required this.mergeOwnStatusesImmediately,
    required ICachedPaginationBloc<TPage, IStatus> paginationBloc,
  }) : super(
          mergeNewItemsImmediately: mergeNewItemsImmediately,
          paginationBloc: paginationBloc,
        ) {
    addDisposable(
      streamSubscription: statusCachedListBloc.settingsChangedStream.listen(
        (_) async {
          _logger.finest(() => 'settingsChangedStream ');
          await refreshWithController();
        },
      ),
    );

    if (mergeOwnStatusesImmediately) {
      addDisposable(
        streamSubscription: unmergedNewItemsStream.distinct().listen(
          (unmergedNewItems) {
            if (unmergedNewItems.isNotEmpty) {
              var firstUnmergedItem = unmergedNewItems.first;

              var isOwnFirstUnmergedItem =
                  myAccountBloc.checkIsStatusFromMe(firstUnmergedItem);

              if (isOwnFirstUnmergedItem) {
                mergeNewItems();
              }
            }
          },
        ),
      );
    }
  }

  @override
  Stream<List<IStatus>> watchItemsNewerThanItem(IStatus? item) {
    _logger.finest(() => 'watchItemsNewerThanItem item = $item');

    return statusCachedListBloc.watchLocalItemsNewerThanItem(item);
  }

  static Widget provideToContext<TPage extends CachedPaginationPage<IStatus>>(
    BuildContext context, {
    required bool mergeNewItemsImmediately,
    required bool mergeOwnStatusesImmediately,
    required Widget child,
  }) {
    return DisposableProvider<
        ICachedPaginationListWithNewItemsBloc<TPage, IStatus>>(
      create: (context) =>
          StatusCachedPaginationListWithNewItemsBloc.createFromContext<TPage>(
        context,
        mergeNewItemsImmediately: mergeNewItemsImmediately,
        mergeOwnStatusesImmediately: mergeOwnStatusesImmediately,
      ),
      child: ProxyProvider<
          ICachedPaginationListWithNewItemsBloc<TPage, IStatus>,
          ICachedPaginationListWithNewItemsBloc>(
        update: (context, value, previous) => value,
        child:
            CachedPaginationListWithNewItemsBlocProxyProvider<TPage, IStatus>(
          child: child,
        ),
      ),
    );
  }

  static StatusCachedPaginationListWithNewItemsBloc<TPage>
      createFromContext<TPage extends CachedPaginationPage<IStatus>>(
    BuildContext context, {
    required bool mergeNewItemsImmediately,
    required bool mergeOwnStatusesImmediately,
  }) {
    return StatusCachedPaginationListWithNewItemsBloc<TPage>(
      mergeOwnStatusesImmediately: mergeOwnStatusesImmediately,
      mergeNewItemsImmediately: mergeNewItemsImmediately,
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
      paginationBloc: Provider.of<ICachedPaginationBloc<TPage, IStatus>>(
        context,
        listen: false,
      ),
      statusCachedListBloc: IStatusCachedListBloc.of(
        context,
        listen: false,
      ),
    );
  }
}
