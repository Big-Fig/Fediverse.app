import 'package:fedi_app/app/home/tab/home_tab_bloc_impl.dart';
import 'package:fedi_app/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:fedi_app/app/notification/repository/notification_repository.dart';
import 'package:unifedi_api/unifedi_api.dart';

class NotificationsHomeTabBloc extends HomeTabBloc
    implements INotificationsHomeTabBloc {
  final IUnifediApiNotificationService unifediNotificationService;
  final INotificationRepository notificationRepository;

  NotificationsHomeTabBloc({
    required this.unifediNotificationService,
    required this.notificationRepository,
  });

  @override
  Future<void> dismissAll() async {
    await notificationRepository.dismissAll();
    await unifediNotificationService.dismissAll();
  }

  @override
  Future<void> markAllAsRead() async {
    await notificationRepository.markAllAsRead();

    if (unifediNotificationService.isPleroma) {
      var newestNotification =
          await notificationRepository.getNewestOrderByRemoteId();
      if (newestNotification != null) {
        // todo: check which notifications actually read
        // ignore: avoid-ignoring-return-values
        await unifediNotificationService.markAsReadList(
          maxNotificationId: newestNotification.remoteId,
        );
      }
    }
  }
}
