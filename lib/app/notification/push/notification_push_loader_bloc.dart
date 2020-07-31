import 'package:fedi/app/notification/push/notification_push_loader_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationPushLoaderBloc extends Disposable
    implements IAsyncInitLoadingBloc {

  static INotificationPushLoaderBloc of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<INotificationPushLoaderBloc>(context, listen: listen);


  NotificationPushLoaderNotification get launchOrResumePushLoaderNotification;

  Stream<NotificationPushLoaderNotification>
      get launchOrResumePushLoaderNotificationStream;
}
