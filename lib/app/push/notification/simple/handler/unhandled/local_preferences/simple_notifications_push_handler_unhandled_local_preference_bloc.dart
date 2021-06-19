import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/notification/simple/handler/simple_notifications_push_handler_model.dart';
import 'package:fedi/app/push/notification/simple/handler/unhandled/simple_notifications_push_handler_unhandled_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISimpleNotificationsPushHandlerUnhandledLocalPreferenceBloc
    implements LocalPreferenceBloc<SimpleNotificationsPushHandlerUnhandledList> {
  static ISimpleNotificationsPushHandlerUnhandledLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ISimpleNotificationsPushHandlerUnhandledLocalPreferenceBloc>(
        context,
        listen: listen,
      );

  Future addUnhandledMessage(SimpleNotificationsPushHandlerMessage simpleNotificationsPushHandlerMessage);

  Future<bool> markAsHandled(List<SimpleNotificationsPushHandlerMessage> messages);

  List<SimpleNotificationsPushHandlerMessage> loadUnhandledMessagesForInstance(
    AuthInstance instance,
  );
}
