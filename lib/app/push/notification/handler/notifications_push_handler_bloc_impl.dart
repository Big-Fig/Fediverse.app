import 'dart:async';

import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_bloc.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:fedi/app/push/notification/handler/unhandled/local_preferences/notifications_push_handler_unhandled_local_preference_bloc.dart';
import 'package:fedi/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';
import 'package:fedi/app/push/notification/rich/rich_notifications_service.dart';
import 'package:fedi/app/push/notification/rich/rich_notifications_service_background_message_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/push_model.dart';
import 'package:logging/logging.dart';

var _logger = Logger('push_handler_bloc_impl.dart');

class NotificationsPushHandlerBloc extends DisposableOwner
    implements INotificationsPushHandlerBloc {
  final INotificationsPushHandlerUnhandledLocalPreferenceBloc
      unhandledLocalPreferencesBloc;
  final IFcmPushService fcmPushService;
  final IRichNotificationsService richNotificationsService;
  final IAuthInstanceListBloc instanceListBloc;
  final ICurrentAuthInstanceBloc currentInstanceBloc;

  final List<IPushRealTimeHandler> realTimeHandlers = [];

  NotificationsPushHandlerBloc({
    required this.unhandledLocalPreferencesBloc,
    required this.currentInstanceBloc,
    required this.instanceListBloc,
    required this.fcmPushService,
    required this.richNotificationsService,
  }) {
    addDisposable(
      streamSubscription: fcmPushService.messageStream.listen(
        (pushMessage) async {
          await handlePushMessage(pushMessage);
        },
      ),
    );
    addDisposable(
      streamSubscription: richNotificationsService.messageStream.listen(
        (pushMessage) async {
          await handlePushMessage(pushMessage);
        },
      ),
    );
  }

  @override
  Future handleInitialMessage() async {
    var initialMessage = fcmPushService.initialMessage;
    if (initialMessage != null) {
      await handlePushMessage(initialMessage);
      fcmPushService.clearInitialMessage();
    }
  }

  Future handlePushMessage(PushMessage pushMessage) async {
    var data = pushMessage.data;
    if (data != null) {
      var isHaveNotificationId = data.containsKey('notification_id');
      if (isHaveNotificationId) {
        await _handlePushMessage(pushMessage);
      } else {
        _logger.warning(() => '$pushMessage dont have notification_id');
        var pleromaApiNotification = await loadNotificationForPushMessageData(
          data: data,
          createPushNotification: false,
        );

        if (pleromaApiNotification != null) {
          await _handlePushMessage(
            PushMessage(
              typeString: PushMessageType.foreground.toJsonValue(),
              notification: null,
              data: PleromaApiPushMessageBody(
                notificationId: pleromaApiNotification.id,
                server: data['server'],
                account: data['account'],
                notificationType: pleromaApiNotification.type,
                pleromaApiNotification:
                    pleromaApiNotification.toPleromaApiNotification(),
                notificationAction: null,
                notificationActionInput: null,
              ).toJson(),
            ),
          );
        }
      }
    } else {
      _logger
          .warning(() => 'cant handlePushMessage $pushMessage its dont data');
    }
  }

  Future<void> _handlePushMessage(
    PushMessage pushMessage,
  ) async {
    _logger.finest(() => '_handleSimplePushMessage $pushMessage');

    var data = pushMessage.data;

    var body = PleromaApiPushMessageBody.fromJson(data!);

    var pushMessageHandler = NotificationsPushHandlerMessage(
      pushMessage: pushMessage,
      body: body,
    );
    var handled = false;
    for (var handler in realTimeHandlers) {
      handled = await handler(pushMessageHandler);
      if (handled) {
        break;
      }
    }

    _logger.finest(() => 'handlePushMessage \n'
        '\t body =$body'
        '\t handled =$handled');

    if (!handled) {
      var instanceForMessage = instanceListBloc.findInstanceByCredentials(
        host: body.server,
        acct: body.account,
      );

      if (instanceForMessage != null) {
        _logger.finest(() => 'body = $body by \n'
            '\t instanceForMessage=$instanceForMessage');

        if (!currentInstanceBloc.isCurrentInstance(instanceForMessage)) {
          await unhandledLocalPreferencesBloc
              .addUnhandledMessage(pushMessageHandler);

          if (pushMessage.isLaunch) {
            // launch after click on notification
            if (currentInstanceBloc.currentInstance != instanceForMessage) {
              await currentInstanceBloc
                  .changeCurrentInstance(instanceForMessage);
            }
          }
        }
      } else {
        _logger.severe(() => 'Cant handle body = '
            '$body, because instance for message not found');
      }
    }
  }

  @override
  void addRealTimeHandler(IPushRealTimeHandler notificationsPushHandler) {
    realTimeHandlers.add(notificationsPushHandler);
  }

  @override
  void removeRealTimeHandler(
    IPushRealTimeHandler notificationsPushHandler,
  ) {
    realTimeHandlers.remove(notificationsPushHandler);
  }

  @override
  List<NotificationsPushHandlerMessage> loadUnhandledMessagesForInstance(
    AuthInstance instance,
  ) =>
      unhandledLocalPreferencesBloc.loadUnhandledMessagesForInstance(instance);

  @override
  Future<bool> markAsHandled(
    List<NotificationsPushHandlerMessage> messages,
  ) =>
      unhandledLocalPreferencesBloc.markAsHandled(messages);

  @override
  Future markAsLaunchMessage(
    NotificationsPushHandlerMessage message,
  ) async {
    var unhandledList = unhandledLocalPreferencesBloc.value;

    unhandledList.messages.remove(message);

    unhandledList.messages.add(
      message.copyWith(
        pushMessage: message.pushMessage.copyWith(
          typeString: PushMessageType.launch.toJsonValue(),
        ),
      ),
    );

    await unhandledLocalPreferencesBloc.setValue(
      NotificationsPushHandlerUnhandledList(
        messages: unhandledList.messages,
      ),
    );
  }
}
