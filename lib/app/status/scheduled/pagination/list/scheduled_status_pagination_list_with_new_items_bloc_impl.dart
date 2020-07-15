import 'package:fedi/app/status/scheduled/list/cached/scheduled_status_cached_list_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger =
    Logger("scheduledStatus_pagination_list_with_new_items_bloc_impl.dart");

class ScheduledStatusPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IScheduledStatus>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IScheduledStatus> {
  final IScheduledStatusCachedListBloc scheduledStatusCachedListService;

  ScheduledStatusPaginationListWithNewItemsBloc(
      {@required bool mergeNewItemsImmediately,
      @required this.scheduledStatusCachedListService,
      @required IPaginationBloc<TPage, IScheduledStatus> paginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: paginationBloc);

  @override
  Stream<List<IScheduledStatus>> watchItemsNewerThanItem(
      IScheduledStatus item) {
    _logger.finest(() => "watchItemsNewerThanItem item = $item");
    return scheduledStatusCachedListService.watchLocalItemsNewerThanItem(item);
  }

  @override
  int compareItemsToSort(IScheduledStatus a, IScheduledStatus b) {
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
  bool isItemsEqual(IScheduledStatus a, IScheduledStatus b) =>
      a.remoteId == b.remoteId;

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<
        ICachedPaginationListWithNewItemsBloc<
            CachedPaginationPage<IScheduledStatus>, IScheduledStatus>>(
      create: (context) => ScheduledStatusPaginationListWithNewItemsBloc(
        scheduledStatusCachedListService:
            IScheduledStatusCachedListBloc.of(context, listen: false),
        mergeNewItemsImmediately: false,
        paginationBloc: Provider.of<
            IPaginationBloc<PaginationPage<IScheduledStatus>,
                IScheduledStatus>>(context, listen: false),
      ),
      child: CachedPaginationListWithNewItemsBlocProxyProvider<
          CachedPaginationPage<IScheduledStatus>,
          IScheduledStatus>(child: child),
    );
  }
}
