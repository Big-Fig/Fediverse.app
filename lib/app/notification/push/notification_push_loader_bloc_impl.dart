import 'dart:async';

import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_model.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/app/push/handler/push_handler_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_service.dart';
import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("notification_push_loader_bloc_impl.dart");

class NotificationPushLoaderBloc extends AsyncInitLoadingBloc
    implements INotificationPushLoaderBloc {
  final AuthInstance currentInstance;
  final IPushHandlerBloc pushHandlerBloc;
  final IPleromaNotificationService pleromaNotificationService;

  final INotificationRepository notificationRepository;
  final IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;
  final IMyAccountBloc myAccountBloc;

  BehaviorSubject<NotificationPushLoaderNotification>
      launchOrResumePushLoaderNotificationSubject = BehaviorSubject();

  @override
  NotificationPushLoaderNotification get launchOrResumePushLoaderNotification =>
      launchOrResumePushLoaderNotificationSubject.value;

  @override
  Stream<NotificationPushLoaderNotification>
      get launchOrResumePushLoaderNotificationStream =>
          launchOrResumePushLoaderNotificationSubject.stream;

  final StreamController<NotificationPushLoaderNotification>
      _handledNotificationsStreamController = StreamController.broadcast();

  @override
  Stream<NotificationPushLoaderNotification> get handledNotificationsStream =>
      _handledNotificationsStreamController.stream;

  NotificationPushLoaderBloc({
    @required this.currentInstance,
    @required this.pushHandlerBloc,
    @required this.pleromaNotificationService,
    @required this.notificationRepository,
    @required this.chatNewMessagesHandlerBloc,
    @required this.myAccountBloc,
  }) {
    pushHandlerBloc.addRealTimeHandler(handlePush);
    addDisposable(subject: launchOrResumePushLoaderNotificationSubject);
    addDisposable(
      disposable: CustomDisposable(
        () async {
          pushHandlerBloc.removeRealTimeHandler(handlePush);
        },
      ),
    );
    addDisposable(streamController: _handledNotificationsStreamController);
  }

  Future<bool> handlePush(PushHandlerMessage pushHandlerMessage) async {
    PleromaPushMessageBody pleromaPushMessage = pushHandlerMessage.body;

    var isForCurrentInstance = currentInstance.isInstanceWithHostAndAcct(
      host: pleromaPushMessage.server,
      acct: pleromaPushMessage.account,
    );

    _logger.finest(() => "handlePush \n"
        "\t isForCurrentInstance = $isForCurrentInstance"
        "\t pleromaPushMessage = $pleromaPushMessage");
    bool handled;
    if (isForCurrentInstance) {
      String remoteNotificationId = pleromaPushMessage.notificationId;
      var remoteNotification = await pleromaNotificationService.getNotification(
        notificationRemoteId: remoteNotificationId,
      );

      handled = true;
      if (remoteNotification != null) {
        var all = await notificationRepository.countAll();
        _logger.finest(() => "all ${all}");

        var alreadyExistNotification =
            await notificationRepository.findByRemoteId(remoteNotificationId);

        _logger.finest(() => "handlePush \n"
            "\t remoteNotification = $remoteNotification");

        _logger.finest(() => "handlePush \n"
            "\t remoteNotificationId = $remoteNotificationId \n"
            "\t alreadyExistNotification = $alreadyExistNotification");

        var unread = alreadyExistNotification?.unread ?? true;

        await notificationRepository
            .upsertRemoteNotification(remoteNotification, unread: unread);

        if (pushHandlerMessage.pushMessage.isLaunch) {
          launchOrResumePushLoaderNotificationSubject.add(
            NotificationPushLoaderNotification(
              notification: await notificationRepository.findByRemoteId(
                remoteNotification.id,
              ),
              pushHandlerMessage: pushHandlerMessage,
            ),
          );
        }

        // todo: remove temp hack unread should be redesigned
        // Also, we should fetch chat info if chat not exist locally
        var chatMessage = remoteNotification.chatMessage;
        if (chatMessage != null) {
          await chatNewMessagesHandlerBloc.handleNewMessage(chatMessage);
        }

        var pleromaNotificationType = remoteNotification.typePleroma;

        // refresh to update followRequestCount
        if (pleromaNotificationType == PleromaNotificationType.followRequest) {
          unawaited(
            myAccountBloc.refreshFromNetwork(
              isNeedPreFetchRelationship: false,
            ),
          );
        }

        _handledNotificationsStreamController.add(
          NotificationPushLoaderNotification(
            notification: await notificationRepository.findByRemoteId(
              remoteNotification.id,
            ),
            pushHandlerMessage: pushHandlerMessage,
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
    var unhandledMessages =
        pushHandlerBloc.loadUnhandledMessagesForInstance(currentInstance);

    var handledMessages = <PushHandlerMessage>[];

    for (var message in unhandledMessages) {
      var success = await handlePush(message);
      if (success) {
        handledMessages.add(message);
      }
    }

    await pushHandlerBloc.markAsHandled(handledMessages);
  }
}
