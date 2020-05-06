import 'package:fedi/refactored/app/status/scheduled/list/cached/scheduled_status_cached_list_service.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger =
    Logger("scheduledStatus_pagination_list_with_new_items_bloc_impl.dart");

class ScheduledStatusPaginationListWithNewItemsBloc<
        TPage extends PaginationPage<IScheduledStatus>>
    extends PaginationListWithNewItemsBloc<TPage, IScheduledStatus> {
  final IScheduledStatusCachedListService scheduledStatusCachedListService;

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
  int compareItems(IScheduledStatus a, IScheduledStatus b) {
    if (a == null && b == null) {
      return 0;
    }

    if (a != null && b == null) {
      return -1;
    }
    if (a == null && b != null) {
      return 1;
    }
    return a.remoteId.compareTo(b.remoteId);
  }
}
