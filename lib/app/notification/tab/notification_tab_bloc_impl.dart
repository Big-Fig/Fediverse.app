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
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_service.dart';

class NotificationTabBloc extends AsyncInitLoadingBloc
    implements INotificationTabBloc {
  final NotificationTab tab;
  // ignore: avoid-late-keyword
  late INotificationCachedListBloc notificationCachedListBloc;
  // ignore: avoid-late-keyword
  late INotificationCachedPaginationBloc notificationCachedPaginationBloc;

  final INotificationRepository notificationRepository;
  final IPleromaApiNotificationService pleromaNotificationService;
  final IFilterRepository filterRepository;
  final IPaginationSettingsBloc paginationSettingsBloc;

  @override
  // ignore: avoid-late-keyword
  late ICachedPaginationListWithNewItemsBloc<
      CachedPaginationPage<INotification>,
      INotification> paginationListWithNewItemsBloc;

  NotificationTabBloc({
    required this.tab,
    required this.notificationRepository,
    required this.pleromaNotificationService,
    required this.filterRepository,
    required this.paginationSettingsBloc,
  });

  INotificationCachedListBloc createListService() => NotificationCachedListBloc(
        notificationRepository: notificationRepository,
        pleromaNotificationService: pleromaNotificationService,
        excludeTypes: NotificationTabExcludeHelper.mapTabToExcludeTypes(
          tab: tab,
        ),
        filterRepository: filterRepository,
      );

  @override
  Future internalAsyncInit() async {
    notificationCachedListBloc = createListService();
    await notificationCachedListBloc.performAsyncInit();

    notificationCachedPaginationBloc = NotificationCachedPaginationBloc(
      maximumCachedPagesCount: null,
      notificationListService: notificationCachedListBloc,
      paginationSettingsBloc: paginationSettingsBloc,
    );

    paginationListWithNewItemsBloc =
        NotificationCachedPaginationListWithNewItemsBloc<
            CachedPaginationPage<INotification>>(
      cachedPaginationBloc: notificationCachedPaginationBloc,
      mergeNewItemsImmediately: false,
      cachedListBloc: notificationCachedListBloc,
    );

    addDisposable(notificationCachedListBloc);
    addDisposable(notificationCachedPaginationBloc);
    addDisposable(
      paginationListWithNewItemsBloc,
    );
  }
}
