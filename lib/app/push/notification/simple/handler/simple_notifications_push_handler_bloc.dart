import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/notification/simple/handler/simple_notifications_push_handler_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef IPushRealTimeHandler = Future<bool> Function(
  SimpleNotificationsPushHandlerMessage simpleNotificationsPushHandlerMessage,
);

abstract class ISimpleNotificationsPushHandlerBloc extends IDisposable {
  static ISimpleNotificationsPushHandlerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ISimpleNotificationsPushHandlerBloc>(context, listen: listen);

  List<SimpleNotificationsPushHandlerMessage> loadUnhandledMessagesForInstance(
    AuthInstance instance,
  );

  Future handleInitialMessage();

  Future<bool> markAsHandled(List<SimpleNotificationsPushHandlerMessage> messages);

  Future markAsLaunchMessage(SimpleNotificationsPushHandlerMessage message);

  void addRealTimeHandler(IPushRealTimeHandler simpleNotificationsPushHandler);

  void removeRealTimeHandler(IPushRealTimeHandler simpleNotificationsPushHandler);
}
