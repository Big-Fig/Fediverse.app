import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_model.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_bloc.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:fedi/app/push/notification/notification_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_service.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:logging/logging.dart';

import 'package:rxdart/rxdart.dart';

var _logger = Logger('notification_push_loader_bloc_impl.dart');

class NotificationPushLoaderBloc extends AsyncInitLoadingBloc
    implements INotificationPushLoaderBloc {
  final AuthInstance currentInstance;
  final INotificationsPushHandlerBloc notificationsPushHandlerBloc;
  final IPleromaApiNotificationService pleromaNotificationService;

  final INotificationRepository notificationRepository;
  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;
  final IPleromaChatMessageRepository chatMessageRepository;
  final IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;
  final IMyAccountBloc myAccountBloc;
  final IPleromaApiMyAccountService pleromaApiMyAccountService;
  final IPleromaApiChatService pleromaApiChatService;
  final IPleromaApiAuthStatusService pleromaApiAuthStatusService;

  BehaviorSubject<NotificationPushLoaderNotification?>
      launchPushLoaderNotificationSubject = BehaviorSubject();

  @override
  NotificationPushLoaderNotification? get launchPushLoaderNotification =>
      launchPushLoaderNotificationSubject.valueOrNull;

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
    required this.notificationsPushHandlerBloc,
    required this.pleromaNotificationService,
    required this.notificationRepository,
    required this.chatNewMessagesHandlerBloc,
    required this.myAccountBloc,
    required this.accountRepository,
    required this.pleromaApiMyAccountService,
    required this.pleromaApiAuthStatusService,
    required this.pleromaApiChatService,
    required this.statusRepository,
    required this.chatMessageRepository,
  }) {
    notificationsPushHandlerBloc.addRealTimeHandler(handlePush);
    launchPushLoaderNotificationSubject.disposeWith(this);

    addCustomDisposable(
      () => notificationsPushHandlerBloc.removeRealTimeHandler(
        handlePush,
      ),
    );

    _handledNotificationsStreamController.disposeWith(this);
  }

  // todo: refactor
  // ignore: long-method
  Future<bool> handlePush(
    NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  ) async {
    var pleromaPushMessage = notificationsPushHandlerMessage.body;

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

      IPleromaApiNotification? remoteNotification =
          pleromaPushMessage.pleromaApiNotification;

      // if we have only remoteNotificationId
      // in case we have decrypted push notifications
      // via old PushRelay server or on Flutter side(not implemented yet)
      remoteNotification ??= await pleromaNotificationService.getNotification(
        notificationRemoteId: remoteNotificationId,
      );

      handled = true;

      if (notificationsPushHandlerMessage.pushMessage.isAction) {
        await _handleNewAction(
          remoteNotification: remoteNotification,
          notificationsPushHandlerMessage: notificationsPushHandlerMessage,
        );
      } else {
        await _handleNewMessage(
          remoteNotification: remoteNotification,
          notificationsPushHandlerMessage: notificationsPushHandlerMessage,
        );
      }
    } else {
      handled = false;
    }

    return handled;
  }

  Future<void> _handleNewAction({
    required IPleromaApiNotification remoteNotification,
    required NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  }) async {
    var notificationActionType =
        notificationsPushHandlerMessage.body.notificationActionType!;

    switch (notificationActionType) {
      case NotificationActionType.acceptFollowRequest:
        await _handleNewFollowRequestAction(
          remoteNotification: remoteNotification,
          notificationsPushHandlerMessage: notificationsPushHandlerMessage,
          accept: true,
        );
        break;
      case NotificationActionType.rejectFollowRequest:
        await _handleNewFollowRequestAction(
          remoteNotification: remoteNotification,
          notificationsPushHandlerMessage: notificationsPushHandlerMessage,
          accept: false,
        );
        break;
      case NotificationActionType.reply:
        await _handleNewReplyAction(
          remoteNotification: remoteNotification,
          notificationsPushHandlerMessage: notificationsPushHandlerMessage,
        );
        break;
    }
  }

  Future<void> _handleNewReplyAction({
    required IPleromaApiNotification remoteNotification,
    required NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  }) async {
    var notificationActionInput =
        notificationsPushHandlerMessage.body.notificationActionInput;

    if (notificationActionInput?.isNotEmpty != true) {
      _logger.warning(() =>
          'cant _handleNewReplyAction notificationActionInput empty or null');

      return;
    }

    var pleromaApiNotificationType = remoteNotification.typeAsPleromaApi;
    switch (pleromaApiNotificationType) {
      case PleromaApiNotificationType.pleromaChatMention:
        var chatMessage = remoteNotification.chatMessage!;
        var pleromaApiChatMessage = await pleromaApiChatService.sendMessage(
          chatId: chatMessage.chatId,
          data: PleromaApiChatMessageSendData(
            content: notificationActionInput,
            idempotencyKey: null,
            mediaId: null,
          ),
        );
        await chatMessageRepository.upsertInRemoteType(pleromaApiChatMessage);
        break;

      case PleromaApiNotificationType.mention:
        var status = remoteNotification.status!;
        var directConversationId = status.pleroma?.directConversationId;
        var pleromaApiStatus = await pleromaApiAuthStatusService.postStatus(
          data: PleromaApiPostStatus(
            contentType: null,
            expiresInSeconds: null,
            inReplyToConversationId: directConversationId?.toString(),
            inReplyToId: status.id,
            // todo: get lang from config
            language: null,
            visibility: status.visibility,
            mediaIds: null,
            poll: null,
            preview: null,
            sensitive: false,
            spoilerText: null,
            status: notificationActionInput,
            to: [
              status.account.acct,
            ],
          ),
        );
        await statusRepository.upsertInRemoteType(pleromaApiStatus);
        break;

      default:
        _logger.warning(() => 'cant _handleNewReplyAction '
            'invalid pleromaApiNotificationType $pleromaApiNotificationType');
        break;
    }
  }

  Future<void> _handleNewFollowRequestAction({
    required IPleromaApiNotification remoteNotification,
    required NotificationsPushHandlerMessage notificationsPushHandlerMessage,
    required bool accept,
  }) async {
    var pleromaApiAccount = remoteNotification.account!;
    var accountRemoteId = pleromaApiAccount.id;

    IPleromaApiAccountRelationship pleromaApiAccountRelationship;
    if (accept) {
      pleromaApiAccountRelationship =
          await pleromaApiMyAccountService.acceptFollowRequest(
        accountRemoteId: accountRemoteId,
      );
    } else {
      pleromaApiAccountRelationship =
          await pleromaApiMyAccountService.rejectFollowRequest(
        accountRemoteId: accountRemoteId,
      );
    }

    await _processFollowRequestAction(
      pleromaApiAccount: pleromaApiAccount,
      accountRelationship: pleromaApiAccountRelationship,
    );
  }

  // todo: refactor copy-pasted code
  Future _processFollowRequestAction({
    required IPleromaApiAccount pleromaApiAccount,
    required IPleromaApiAccountRelationship accountRelationship,
  }) async {
    var localAccount = pleromaApiAccount.toDbAccountWrapper().copyWith(
          pleromaRelationship: accountRelationship,
        );
    pleromaApiAccount = localAccount.toPleromaApiAccount();

    await notificationRepository.batch((batch) {
      notificationRepository.dismissFollowRequestNotificationsFromAccount(
        account: localAccount,
        batchTransaction: batch,
      );
      accountRepository.upsertInRemoteTypeBatch(
        pleromaApiAccount,
        batchTransaction: batch,
      );
    });

    await myAccountBloc.decreaseFollowingRequestCount();
  }

  Future<void> _handleNewMessage({
    required IPleromaApiNotification remoteNotification,
    required NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  }) async {
    var all = await notificationRepository.countAll();
    _logger.finest(() => 'all $all');

    var remoteNotificationId = remoteNotification.id;

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
    if (notificationsPushHandlerMessage.pushMessage.isLaunch) {
      if (notification != null) {
        launchPushLoaderNotificationSubject.add(
          NotificationPushLoaderNotification(
            notification: notification,
            notificationsPushHandlerMessage: notificationsPushHandlerMessage,
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
      // ignore: unawaited_futures
        myAccountBloc.refreshFromNetwork(
          isNeedPreFetchRelationship: false,
        );
    }

    if (notification != null) {
      _handledNotificationsStreamController.add(
        NotificationPushLoaderNotification(
          notification: notification,
          notificationsPushHandlerMessage: notificationsPushHandlerMessage,
        ),
      );
    }
  }

  @override
  Future internalAsyncInit() async {
    var unhandledMessages = notificationsPushHandlerBloc
        .loadUnhandledMessagesForInstance(currentInstance);

    var handledMessages = <NotificationsPushHandlerMessage>[];

    for (var message in unhandledMessages) {
      var success = await handlePush(message);
      if (success) {
        handledMessages.add(message);
      }
    }

    await notificationsPushHandlerBloc.markAsHandled(handledMessages);

    await notificationsPushHandlerBloc.handleInitialMessage();
  }
}
