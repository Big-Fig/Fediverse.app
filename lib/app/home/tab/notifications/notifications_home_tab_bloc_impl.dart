import 'package:fedi/app/home/tab/home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_service.dart';

class NotificationsHomeTabBloc extends HomeTabBloc
    implements INotificationsHomeTabBloc {
  final IPleromaApiNotificationService pleromaNotificationService;
  final INotificationRepository notificationRepository;

  NotificationsHomeTabBloc({
    required this.pleromaNotificationService,
    required this.notificationRepository,
  });

  @override
  Future dismissAll() async {
    await notificationRepository.dismissAll();
    await pleromaNotificationService.dismissAll();
  }

  @override
  Future markAllAsRead() async {
    await notificationRepository.markAllAsRead();

    if (pleromaNotificationService.isPleroma) {
      var newestNotification = await notificationRepository.getOldestOrderByRemoteId();
      if (newestNotification != null) {
        await pleromaNotificationService.markAsReadList(
          maxNotificationRemoteId: newestNotification.remoteId,
        );
      }
    }
  }
}
