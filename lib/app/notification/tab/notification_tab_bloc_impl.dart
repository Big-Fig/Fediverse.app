import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc_impl.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/pagination/cached/notification_cached_pagination_bloc.dart';
import 'package:fedi/app/notification/pagination/cached/notification_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/notification/pagination/list/notification_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/tab/notification_tab_bloc.dart';
import 'package:fedi/app/notification/tab/notification_tab_exclude_helper.dart';
import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_service.dart';
import 'package:flutter/widgets.dart';

class NotificationTabBloc extends AsyncInitLoadingBloc
    implements INotificationTabBloc {
  final NotificationTab tab;
  INotificationCachedListBloc notificationCachedListBloc;
  INotificationCachedPaginationBloc notificationCachedPaginationBloc;

  final INotificationRepository notificationRepository;
  final IPleromaNotificationService pleromaNotificationService;
  final IFilterRepository filterRepository;

  @override
  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<INotification>,
      INotification> paginationListWithNewItemsBloc;

  NotificationTabBloc({
    @required this.tab,
    @required this.notificationRepository,
    @required this.pleromaNotificationService,
    @required this.filterRepository,
  });

  INotificationCachedListBloc createListService() => NotificationCachedListBloc(
        notificationRepository: notificationRepository,
        pleromaNotificationService: pleromaNotificationService,
        excludeTypes: NotificationTabExcludeHelper.mapTabToExcludeTypes(tab),
        filterRepository: filterRepository,
      );

  @override
  Future internalAsyncInit() async {
    notificationCachedListBloc = createListService();
    await notificationCachedListBloc.performAsyncInit();
    addDisposable(disposable: notificationCachedListBloc);

    notificationCachedPaginationBloc = NotificationCachedPaginationBloc(
        itemsCountPerPage: 20,
        maximumCachedPagesCount: null,
        notificationListService: notificationCachedListBloc);
    addDisposable(disposable: notificationCachedPaginationBloc);

    paginationListWithNewItemsBloc =
        NotificationCachedPaginationListWithNewItemsBloc<
                CachedPaginationPage<INotification>>(
            paginationBloc: notificationCachedPaginationBloc,
            mergeNewItemsImmediately: false,
            cachedListBloc: notificationCachedListBloc);
    addDisposable(disposable: paginationListWithNewItemsBloc);
  }
}
