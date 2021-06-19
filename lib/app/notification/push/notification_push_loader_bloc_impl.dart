import 'dart:async';

import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_model.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/push/notification/simple/handler/simple_notifications_push_handler_bloc.dart';
import 'package:fedi/app/push/notification/simple/handler/simple_notifications_push_handler_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_service.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('notification_push_loader_bloc_impl.dart');

class NotificationPushLoaderBloc extends AsyncInitLoadingBloc
    implements INotificationPushLoaderBloc {
  final AuthInstance currentInstance;
  final ISimpleNotificationsPushHandlerBloc simpleNotificationsPushHandlerBloc;
  final IPleromaApiNotificationService pleromaNotificationService;

  final INotificationRepository notificationRepository;
  final IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;
  final IMyAccountBloc myAccountBloc;

  BehaviorSubject<NotificationPushLoaderNotification>
      launchPushLoaderNotificationSubject = BehaviorSubject();

  @override
  NotificationPushLoaderNotification? get launchPushLoaderNotification =>
      launchPushLoaderNotificationSubject.value;

  @override
  Stream<NotificationPushLoaderNotification?>
      get launchPushLoaderNotificationStream =>
          launchPushLoaderNotificationSubject.stream;

  final StreamController<NotificationPushLoaderNotification>
      _handledNotificationsStreamController = StreamController.broadcast();

  @override
  Stream<NotificationPushLoaderNotification> get handledNotificationsStream =>
      _handledNotificationsStreamController.stream;

  NotificationPushLoaderBloc({
    required this.currentInstance,
    required this.simpleNotificationsPushHandlerBloc,
    required this.pleromaNotificationService,
    required this.notificationRepository,
    required this.chatNewMessagesHandlerBloc,
    required this.myAccountBloc,
  }) {
    simpleNotificationsPushHandlerBloc.addRealTimeHandler(handlePush);
    addDisposable(subject: launchPushLoaderNotificationSubject);
    addDisposable(
      disposable: CustomDisposable(
        () async {
          simpleNotificationsPushHandlerBloc.removeRealTimeHandler(handlePush);
        },
      ),
    );
    addDisposable(streamController: _handledNotificationsStreamController);
  }

  // todo: refactor
  // ignore: long-method
  Future<bool> handlePush(
    SimpleNotificationsPushHandlerMessage simpleNotificationsPushHandlerMessage,
  ) async {
    var pleromaPushMessage = simpleNotificationsPushHandlerMessage.body;

    var isForCurrentInstance = currentInstance.isInstanceWithHostAndAcct(
      host: pleromaPushMessage.server,
      acct: pleromaPushMessage.account,
    );

    _logger.finest(() => 'handlePush \n'
        '\t isForCurrentInstance = $isForCurrentInstance'
        '\t pleromaPushMessage = $pleromaPushMessage');
    bool handled;
    if (isForCurrentInstance) {
      var remoteNotificationId = pleromaPushMessage.notificationId;
      var remoteNotification = await pleromaNotificationService.getNotification(
        notificationRemoteId: remoteNotificationId,
      );

      handled = true;
      var all = await notificationRepository.countAll();
      _logger.finest(() => 'all $all');

      var alreadyExistNotification = await notificationRepository
          .findByRemoteIdInAppType(remoteNotificationId);

      _logger.finest(() => 'handlePush \n'
          '\t remoteNotification = $remoteNotification');

      _logger.finest(() => 'handlePush \n'
          '\t remoteNotificationId = $remoteNotificationId \n'
          '\t alreadyExistNotification = $alreadyExistNotification');

      var unread = alreadyExistNotification?.unread ?? true;

      await notificationRepository.upsertRemoteNotification(
        remoteNotification,
        unread: unread,
        batchTransaction: null,
      );

      var notification = await notificationRepository.findByRemoteIdInAppType(
        remoteNotification.id,
      );
      if (simpleNotificationsPushHandlerMessage.pushMessage.isLaunch) {
        if (notification != null) {
          launchPushLoaderNotificationSubject.add(
            NotificationPushLoaderNotification(
              notification: notification,
              simpleNotificationsPushHandlerMessage:
                  simpleNotificationsPushHandlerMessage,
            ),
          );
        }
      }

      var chatMessage = remoteNotification.chatMessage;
      if (chatMessage != null) {
        await chatNewMessagesHandlerBloc.handleNewMessage(chatMessage);
      }

      var pleromaNotificationType = remoteNotification.typeAsPleromaApi;

      // refresh to update followRequestCount
      if (pleromaNotificationType == PleromaApiNotificationType.followRequest) {
        unawaited(
          myAccountBloc.refreshFromNetwork(
            isNeedPreFetchRelationship: false,
          ),
        );
      }

      if (notification != null) {
        _handledNotificationsStreamController.add(
          NotificationPushLoaderNotification(
            notification: notification,
            simpleNotificationsPushHandlerMessage:
                simpleNotificationsPushHandlerMessage,
          ),
        );
      }
    } else {
      handled = false;
    }

    return handled;
  }

  @override
  Future internalAsyncInit() async {
    var unhandledMessages = simpleNotificationsPushHandlerBloc
        .loadUnhandledMessagesForInstance(currentInstance);

    var handledMessages = <SimpleNotificationsPushHandlerMessage>[];

    for (var message in unhandledMessages) {
      var success = await handlePush(message);
      if (success) {
        handledMessages.add(message);
      }
    }

    await simpleNotificationsPushHandlerBloc.markAsHandled(handledMessages);

    await simpleNotificationsPushHandlerBloc.handleInitialMessage();
  }
}
