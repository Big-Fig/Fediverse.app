import 'package:fedi/refactored/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/pagination/cached/notification_cached_pagination_bloc.dart';
import 'package:fedi/refactored/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/refactored/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NotificationCachedPaginationBloc
    extends CachedPleromaPaginationBloc<INotification>
    implements INotificationCachedPaginationBloc {
  final INotificationCachedListBloc notificationListService;

  NotificationCachedPaginationBloc(
      {@required this.notificationListService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => notificationListService.pleromaApi;

  @override
  Future<List<INotification>> loadLocalItems(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required CachedPaginationPage<INotification> olderPage,
          @required CachedPaginationPage<INotification> newerPage}) =>
      notificationListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items?.first,
        olderThan: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedPaginationPage<INotification> olderPage,
      @required CachedPaginationPage<INotification> newerPage}) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return notificationListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items?.first,
      olderThan: newerPage?.items?.last,
    );
  }

  static NotificationCachedPaginationBloc createFromContext(
          BuildContext context,
          {int itemsCountPerPage = 20,
          int maximumCachedPagesCount}) =>
      NotificationCachedPaginationBloc(
          notificationListService: Provider.of<INotificationCachedListBloc>(
              context,
              listen: false),
          itemsCountPerPage: itemsCountPerPage,
          maximumCachedPagesCount: maximumCachedPagesCount);
}
