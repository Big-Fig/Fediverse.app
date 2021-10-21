import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:fedi/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class INotificationsPushHandlerUnhandledLocalPreferenceBloc
    implements LocalPreferenceBloc<NotificationsPushHandlerUnhandledList> {
  static INotificationsPushHandlerUnhandledLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<INotificationsPushHandlerUnhandledLocalPreferenceBloc>(
        context,
        listen: listen,
      );

  Future<void> addUnhandledMessage(
    NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  );

  Future<void> markAsHandled(List<NotificationsPushHandlerMessage> messages);

  List<NotificationsPushHandlerMessage> loadUnhandledMessagesForInstance(
    UnifediApiAccess instance,
  );
}
