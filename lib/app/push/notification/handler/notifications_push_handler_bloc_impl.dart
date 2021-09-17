import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/database/app_database_service_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_bloc.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:fedi/app/push/notification/handler/unhandled/local_preferences/notifications_push_handler_unhandled_local_preference_bloc.dart';
import 'package:fedi/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';
import 'package:fedi/app/push/notification/notification_model.dart';
import 'package:fedi/app/push/notification/rich/rich_notifications_service.dart';
import 'package:fedi/app/push/notification/rich/rich_notifications_service_background_message_impl.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/push_model.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('push_handler_bloc_impl.dart');

// todo: refactor all push notifications code
class NotificationsPushHandlerBloc extends DisposableOwner
    implements INotificationsPushHandlerBloc {
  final INotificationsPushHandlerUnhandledLocalPreferenceBloc
      unhandledLocalPreferencesBloc;
  final IFcmPushService fcmPushService;
  final IRichNotificationsService richNotificationsService;
  final IAuthInstanceListBloc instanceListBloc;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final IConfigService configService;
  final IConnectionService connectionService;

  final List<IPushRealTimeHandler> realTimeHandlers = [];

  NotificationsPushHandlerBloc({
    required this.unhandledLocalPreferencesBloc,
    required this.currentInstanceBloc,
    required this.instanceListBloc,
    required this.fcmPushService,
    required this.richNotificationsService,
    required this.configService,
    required this.connectionService,
  }) {
    fcmPushService.messageStream.listen(
      (pushMessage) async {
        await handlePushMessage(pushMessage);
      },
    ).disposeWith(this);
    richNotificationsService.messageStream.listen(
      (pushMessage) async {
        await handlePushMessage(pushMessage);
      },
    ).disposeWith(this);
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
        var unifediApiNotification = await loadNotificationForPushMessageData(
          data: data,
          createPushNotification: false,
        );

        if (unifediApiNotification != null) {
          await _handlePushMessage(
            PushMessage(
              typeString: PushMessageType.foreground.toJsonValue(),
              notification: null,
              data: UnifediApiPushMessageBody(
                notificationId: unifediApiNotification.id,
                server: data['server'],
                account: data['account'],
                notificationType: unifediApiNotification.type,
                unifediApiNotification:
                    unifediApiNotification.toUnifediApiNotification(),
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

    var body = UnifediApiPushMessageBody.fromJson(data!);

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
      if (body.notificationAction?.toNotificationActionType() != null) {
        await _handleNewAction(
          pushMessage: pushMessage,
          body: body,
        );
      } else {
        await _handleNewMessage(
          pushMessage: pushMessage,
          body: body,
        );
      }
    }
  }

  // todo: refactor copy-pasted code
  Future<void> _handleNewAction({
    required PushMessage pushMessage,
    required UnifediApiPushMessageBody body,
  }) async {
    var remoteNotification = body.unifediApiNotification!;

    var notificationActionType =
        body.notificationAction!.toNotificationActionType();

    switch (notificationActionType) {
      case NotificationActionType.acceptFollowRequest:
        await _handleNewFollowRequestAction(
          remoteNotification: remoteNotification,
          pushMessage: pushMessage,
          body: body,
          accept: true,
        );
        break;
      case NotificationActionType.rejectFollowRequest:
        await _handleNewFollowRequestAction(
          remoteNotification: remoteNotification,
          pushMessage: pushMessage,
          body: body,
          accept: false,
        );
        break;
      case NotificationActionType.reply:
        await _handleNewReplyAction(
          remoteNotification: remoteNotification,
          pushMessage: pushMessage,
          body: body,
        );
        break;
    }
  }

  // ignore: long-method
  Future<void> _handleNewReplyAction({
    required IUnifediApiNotification remoteNotification,
    required PushMessage pushMessage,
    required UnifediApiPushMessageBody body,
  }) async {
    var notificationActionInput = body.notificationActionInput;

    if (notificationActionInput?.isNotEmpty != true) {
      _logger.warning(() =>
          'cant _handleNewReplyAction notificationActionInput empty or null');

      return;
    }

    var disposableOwner = DisposableOwner();

    var userAtHost = body.userAtHost;
    var appDatabaseService = AppDatabaseService.forUserAtHost(
      userAtHost: userAtHost,
      configService: configService,
    );
    await appDatabaseService.performAsyncInit();
    disposableOwner.addDisposable(appDatabaseService);

    var accountRepository = AccountRepository(
      appDatabase: appDatabaseService.appDatabase,
    );
    disposableOwner.addDisposable(accountRepository);

    var statusRepository = StatusRepository(
      appDatabase: appDatabaseService.appDatabase,
      accountRepository: accountRepository,
    );
    disposableOwner.addDisposable(statusRepository);

    var chatMessageRepository = PleromaChatMessageRepository(
      appDatabase: appDatabaseService.appDatabase,
      accountRepository: accountRepository,
    );
    disposableOwner.addDisposable(chatMessageRepository);

    var authInstance = instanceListBloc.findInstanceByCredentials(
      host: body.server,
      acct: body.account,
    )!;

    var restService = RestService(baseUri: authInstance.uri);
    addDisposable(restService);

    var unifediApiAuthRestService = UnifediApiAuthRestService(
      restService: restService,
      connectionService: connectionService,
      accessToken: authInstance.token!.accessToken,
      isPleroma: authInstance.isPleroma,
    );
    addDisposable(unifediApiAuthRestService);

    var unifediApiChatService = UnifediApiChatService(
      restApiAuthService: unifediApiAuthRestService,
    );
    addDisposable(unifediApiChatService);

    var unifediApiStatusService = UnifediApiStatusService(
      authRestService: unifediApiAuthRestService,
    );
    addDisposable(unifediApiChatService);

    var unifediApiNotificationType = remoteNotification.typeAsUnifediApi;

    await unifediApiNotificationType.maybeMap<FutureOr>(
      chatMention: (_) async {
        var chatMessage = remoteNotification.chatMessage!;
        var unifediApiChatMessage = await unifediApiChatService.sendMessage(
          chatId: chatMessage.chatId,
          data: UnifediApiChatMessageSendData(
            content: notificationActionInput,
            idempotencyKey: null,
            mediaId: null,
          ),
        );
        await chatMessageRepository.upsertInRemoteType(unifediApiChatMessage);
      },
      mention: (_) async {
        var status = remoteNotification.status!;
        var directConversationId = status.pleroma?.directConversationId;
        var unifediApiStatus = await unifediApiStatusService.postStatus(
          data: UnifediApiPostStatus(
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
        await statusRepository.upsertInRemoteType(unifediApiStatus);
      },
      orElse: () async => _logger.warning(
        () => 'cant _handleNewReplyAction '
            'invalid unifediApiNotificationType $unifediApiNotificationType',
      ),
    );
  }

  // todo: refactor copy-pasted code
  // ignore: long-method
  Future<void> _handleNewFollowRequestAction({
    required IUnifediApiNotification remoteNotification,
    required PushMessage pushMessage,
    required UnifediApiPushMessageBody body,
    required bool accept,
  }) async {
    var unifediApiAccount = remoteNotification.account!;
    var accountRemoteId = unifediApiAccount.id;

    var disposableOwner = DisposableOwner();

    var userAtHost = body.userAtHost;
    var appDatabaseService = AppDatabaseService.forUserAtHost(
      userAtHost: userAtHost,
      configService: configService,
    );
    await appDatabaseService.performAsyncInit();
    disposableOwner.addDisposable(appDatabaseService);

    var accountRepository = AccountRepository(
      appDatabase: appDatabaseService.appDatabase,
    );
    disposableOwner.addDisposable(accountRepository);

    var statusRepository = StatusRepository(
      appDatabase: appDatabaseService.appDatabase,
      accountRepository: accountRepository,
    );
    disposableOwner.addDisposable(statusRepository);

    var pleromaChatMessageRepository = PleromaChatMessageRepository(
      appDatabase: appDatabaseService.appDatabase,
      accountRepository: accountRepository,
    );
    disposableOwner.addDisposable(pleromaChatMessageRepository);

    var notificationRepository = NotificationRepository(
      appDatabase: appDatabaseService.appDatabase,
      accountRepository: accountRepository,
      statusRepository: statusRepository,
      chatMessageRepository: pleromaChatMessageRepository,
    );
    disposableOwner.addDisposable(notificationRepository);

    var authInstance = instanceListBloc.findInstanceByCredentials(
      host: body.server,
      acct: body.account,
    )!;

    var restService = RestService(baseUri: authInstance.uri);
    addDisposable(restService);

    var unifediApiAuthRestService = UnifediApiAuthRestService(
      restService: restService,
      connectionService: connectionService,
      accessToken: authInstance.token!.accessToken,
      isPleroma: authInstance.isPleroma,
    );
    addDisposable(unifediApiAuthRestService);

    var unifediApiMyAccountService = UnifediApiMyAccountService(
      restApiAuthService: unifediApiAuthRestService,
    );
    addDisposable(unifediApiMyAccountService);

    IUnifediApiAccountRelationship unifediApiAccountRelationship;
    if (accept) {
      unifediApiAccountRelationship =
          await unifediApiMyAccountService.acceptFollowRequest(
        accountRemoteId: accountRemoteId,
      );
    } else {
      unifediApiAccountRelationship =
          await unifediApiMyAccountService.rejectFollowRequest(
        accountRemoteId: accountRemoteId,
      );
    }

    var localAccount = unifediApiAccount.toDbAccountWrapper().copyWith(
          relationship: unifediApiAccountRelationship,
        );
    unifediApiAccount = localAccount.toUnifediApiAccount();

    await notificationRepository.batch((batch) {
      notificationRepository.dismissFollowRequestNotificationsFromAccount(
        account: localAccount,
        batchTransaction: batch,
      );
      accountRepository.upsertInRemoteTypeBatch(
        unifediApiAccount,
        batchTransaction: batch,
      );
    });

    // await myAccountBloc.decreaseFollowingRequestCount();

    await disposableOwner.dispose();
  }

  Future<void> _handleNewMessage({
    required PushMessage pushMessage,
    required UnifediApiPushMessageBody body,
  }) async {
    var instanceForMessage = instanceListBloc.findInstanceByCredentials(
      host: body.server,
      acct: body.account,
    );

    if (instanceForMessage != null) {
      _logger.finest(() => 'body = $body by \n'
          '\t instanceForMessage=$instanceForMessage');

      var isForCurrentInstance =
          currentInstanceBloc.isCurrentInstance(instanceForMessage);
      if (!isForCurrentInstance) {
        await unhandledLocalPreferencesBloc.addUnhandledMessage(
          NotificationsPushHandlerMessage(
            body: body,
            pushMessage: pushMessage,
          ),
        );

        if (pushMessage.isLaunch) {
          // launch after click on notification
          if (currentInstanceBloc.currentInstance != instanceForMessage) {
            await currentInstanceBloc.changeCurrentInstance(instanceForMessage);
          }
        }
      }
    } else {
      _logger.severe(() => 'Cant handle body = '
          '$body, because instance for message not found');
    }
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
