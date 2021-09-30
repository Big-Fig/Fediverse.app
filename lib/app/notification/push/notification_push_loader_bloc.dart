import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/notification/push/notification_push_loader_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationPushLoaderBloc extends IDisposable
    implements IAsyncInitLoadingBloc {
  static INotificationPushLoaderBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<INotificationPushLoaderBloc>(context, listen: listen);

  NotificationPushLoaderNotification? get launchPushLoaderNotification;

  Stream<NotificationPushLoaderNotification?>
      get launchPushLoaderNotificationStream;

  Stream<NotificationPushLoaderNotification> get handledNotificationsStream;
}
