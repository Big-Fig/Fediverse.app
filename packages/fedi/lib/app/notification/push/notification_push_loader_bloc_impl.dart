import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/unifedi/message/repository/unifedi_chat_message_repository.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_model.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_bloc.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:fedi/app/push/notification/notification_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('notification_push_loader_bloc_impl.dart');

class NotificationPushLoaderBloc extends AsyncInitLoadingBloc
    implements INotificationPushLoaderBloc {
  final UnifediApiAccess currentInstance;
  final INotificationsPushHandlerBloc notificationsPushHandlerBloc;
  final IUnifediApiNotificationService unifediNotificationService;

  final INotificationRepository notificationRepository;
  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;
  final IUnifediChatMessageRepository chatMessageRepository;
  final IUnifediChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;
  final IMyAccountBloc myAccountBloc;
  final IUnifediApiMyAccountService unifediApiMyAccountService;
  final IUnifediApiChatService unifediApiChatService;
  final IUnifediApiStatusService unifediApiStatusService;

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
    required this.unifediNotificationService,
    required this.notificationRepository,
    required this.chatNewMessagesHandlerBloc,
    required this.myAccountBloc,
    required this.accountRepository,
    required this.unifediApiMyAccountService,
    required this.unifediApiStatusService,
    required this.unifediApiChatService,
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
    var unifediPushMessage = notificationsPushHandlerMessage.body;

    var isForCurrentInstance = currentInstance.isInstanceWithHostAndAcct(
      host: unifediPushMessage.server,
      acct: unifediPushMessage.account,
    );

    _logger.finest(
      () => 'handlePush \n'
          '\t isForCurrentInstance = $isForCurrentInstance'
          '\t unifediPushMessage = $unifediPushMessage',
    );
    bool handled;
    if (isForCurrentInstance) {
      var remoteNotificationId = unifediPushMessage.notificationId;

      var remoteNotification = unifediPushMessage.unifediApiNotification;

      // if we have only remoteNotificationId
      // in case we have decrypted push notifications
      // via old PushRelay server or on Flutter side(not implemented yet)
      remoteNotification ??= (await unifediNotificationService.getNotification(
        notificationId: remoteNotificationId,
      ))
          .toUnifediApiNotification();

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
    required IUnifediApiNotification remoteNotification,
    required NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  }) async {
    var notificationActionType = notificationsPushHandlerMessage
        .body.notificationAction!
        .toNotificationActionType();

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
    required IUnifediApiNotification remoteNotification,
    required NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  }) async {
    var notificationActionInput =
        notificationsPushHandlerMessage.body.notificationActionInput;

    if (notificationActionInput?.isNotEmpty != true) {
      _logger.warning(
        () =>
            'cant _handleNewReplyAction notificationActionInput empty or null',
      );

      return;
    }

    var unifediApiNotificationType = remoteNotification.typeAsUnifediApi;

    await unifediApiNotificationType.maybeWhen(
      chatMention: (_) async {
        var chatMessage = remoteNotification.chatMessage!;
        var unifediApiChatMessage = await unifediApiChatService.sendMessage(
          chatId: chatMessage.chatId,
          postChatMessage: UnifediApiPostChatMessage(
            content: notificationActionInput,
            mediaId: null,
          ),
          idempotencyKey: null,
        );
        // ignore: avoid-ignoring-return-values
        await chatMessageRepository.upsertInRemoteType(unifediApiChatMessage);
      },
      mention: (_) async {
        var status = remoteNotification.status!;
        var directConversationId = status.directConversationId;
        var unifediApiStatus = await unifediApiStatusService.postStatus(
          idempotencyKey: null,
          postStatus: UnifediApiPostStatus(
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
        // ignore: avoid-ignoring-return-values
        await statusRepository.upsertInRemoteType(unifediApiStatus);
      },
      orElse: () async => _logger.warning(
        () => 'cant _handleNewReplyAction '
            'invalid unifediApiNotificationType $unifediApiNotificationType',
      ),
    );
  }

  Future<void> _handleNewFollowRequestAction({
    required IUnifediApiNotification remoteNotification,
    required NotificationsPushHandlerMessage notificationsPushHandlerMessage,
    required bool accept,
  }) async {
    var unifediApiAccount = remoteNotification.account!;
    var accountRemoteId = unifediApiAccount.id;

    IUnifediApiAccountRelationship? unifediApiAccountRelationship;
    if (accept) {
      unifediApiAccountRelationship =
          await unifediApiMyAccountService.acceptMyAccountFollowRequest(
        accountId: accountRemoteId,
      );
    } else {
      unifediApiAccountRelationship =
          await unifediApiMyAccountService.rejectMyAccountFollowRequest(
        accountId: accountRemoteId,
      );
    }
    if (unifediApiAccountRelationship != null) {
      await _processFollowRequestAction(
        unifediApiAccount: unifediApiAccount,
        accountRelationship: unifediApiAccountRelationship,
      );
    }
  }

  // todo: refactor copy-pasted code
  Future<void> _processFollowRequestAction({
    required IUnifediApiAccount unifediApiAccount,
    required IUnifediApiAccountRelationship accountRelationship,
  }) async {
    var localAccount = unifediApiAccount.toDbAccountWrapper().copyWithTemp(
          relationship: accountRelationship,
        );
    var actualUnifediApiAccount = localAccount.toUnifediApiAccount();

    await notificationRepository.batch((batch) {
      notificationRepository.dismissFollowRequestNotificationsFromAccount(
        account: localAccount,
        batchTransaction: batch,
      );
      accountRepository.upsertInRemoteTypeBatch(
        actualUnifediApiAccount,
        batchTransaction: batch,
      );
    });

    await myAccountBloc.decreaseFollowingRequestCount();
  }

  Future<void> _handleNewMessage({
    required IUnifediApiNotification remoteNotification,
    required NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  }) async {
    var all = await notificationRepository.countAll();
    _logger.finest(() => 'all $all');

    var remoteNotificationId = remoteNotification.id;

    var alreadyExistNotification = await notificationRepository
        .findByRemoteIdInAppType(remoteNotificationId);

    _logger.finest(
      () => 'handlePush \n'
          '\t remoteNotificationId = $remoteNotificationId \n'
          '\t alreadyExistNotification = $alreadyExistNotification',
    );

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

    var unifediApiNotificationType = remoteNotification.typeAsUnifediApi;

    // refresh to update followRequestCount
    if (unifediApiNotificationType ==
        UnifediApiNotificationType.followRequestValue) {
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
  Future<void> internalAsyncInit() async {
    var unhandledMessages = notificationsPushHandlerBloc
        .loadUnhandledMessagesForInstance(currentInstance);

    var handledMessages = <NotificationsPushHandlerMessage>[];

    for (final message in unhandledMessages) {
      var success = await handlePush(message);
      if (success) {
        handledMessages.add(message);
      }
    }

    await notificationsPushHandlerBloc.markAsHandled(handledMessages);

    await notificationsPushHandlerBloc.handleInitialMessage();
  }
}
