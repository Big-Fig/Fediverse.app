import 'dart:async';

import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
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
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service_impl.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service_impl.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service_impl.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service_impl.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/push_model.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:logging/logging.dart';

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
      if (body.notificationActionType != null) {
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
    required PleromaApiPushMessageBody body,
  }) async {
    var remoteNotification = body.pleromaApiNotification!;

    var notificationActionType = body.notificationActionType!;

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
    required IPleromaApiNotification remoteNotification,
    required PushMessage pushMessage,
    required PleromaApiPushMessageBody body,
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

    var pleromaApiAuthRestService = PleromaApiAuthRestService(
      restService: restService,
      connectionService: connectionService,
      accessToken: authInstance.token!.accessToken,
      isPleroma: authInstance.isPleroma,
    );
    addDisposable(pleromaApiAuthRestService);

    var pleromaApiChatService = PleromaApiChatService(
      restApiAuthService: pleromaApiAuthRestService,
    );
    addDisposable(pleromaApiChatService);

    var pleromaApiAuthStatusService = PleromaApiAuthStatusService(
      authRestService: pleromaApiAuthRestService,
    );
    addDisposable(pleromaApiChatService);

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

  // todo: refactor copy-pasted code
  // ignore: long-method
  Future<void> _handleNewFollowRequestAction({
    required IPleromaApiNotification remoteNotification,
    required PushMessage pushMessage,
    required PleromaApiPushMessageBody body,
    required bool accept,
  }) async {
    var pleromaApiAccount = remoteNotification.account!;
    var accountRemoteId = pleromaApiAccount.id;

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

    var pleromaApiAuthRestService = PleromaApiAuthRestService(
      restService: restService,
      connectionService: connectionService,
      accessToken: authInstance.token!.accessToken,
      isPleroma: authInstance.isPleroma,
    );
    addDisposable(pleromaApiAuthRestService);

    var pleromaApiMyAccountService = PleromaApiMyAccountService(
      restApiAuthService: pleromaApiAuthRestService,
    );
    addDisposable(pleromaApiMyAccountService);

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

    var localAccount = pleromaApiAccount.toDbAccountWrapper().copyWith(
          pleromaRelationship: pleromaApiAccountRelationship,
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

    // await myAccountBloc.decreaseFollowingRequestCount();

    await disposableOwner.dispose();
  }

  Future<void> _handleNewMessage({
    required PushMessage pushMessage,
    required PleromaApiPushMessageBody body,
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
