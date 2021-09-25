import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';

import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/access/list/access_list_bloc.dart';
import 'package:fedi/app/access/local_preferences/access_local_preference_bloc_impl.dart';
import 'package:fedi/app/access/local_preferences_access_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/database/app_database_service_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/app/push/fedi_push_notification_model.dart';
import 'package:fedi/app/push/fedi_push_notification_model_impl.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_bloc.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:fedi/app/push/notification/handler/unhandled/local_preferences/notifications_push_handler_unhandled_local_preference_bloc.dart';
import 'package:fedi/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';
import 'package:fedi/app/push/notification/notification_model.dart';
import 'package:fedi/app/push/notification/rich/rich_notifications_service.dart';
import 'package:fedi/app/push/notification/rich/rich_notifications_service_background_message_impl.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/push_model.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fediverse_api/fediverse_api.dart';

var _logger = Logger('push_handler_bloc_impl.dart');

// todo: refactor all push notifications code
class NotificationsPushHandlerBloc extends DisposableOwner
    implements INotificationsPushHandlerBloc {
  final INotificationsPushHandlerUnhandledLocalPreferenceBloc
      unhandledLocalPreferencesBloc;
  final IFcmPushService fcmPushService;
  final IRichNotificationsService richNotificationsService;
  final IUnifediApiAccessListBloc instanceListBloc;
  final ICurrentUnifediApiAccessBloc currentInstanceBloc;
  final IConfigService configService;
  final IConnectionService connectionService;
  final ILocalPreferencesService localPreferencesService;

  final List<IPushRealTimeHandler> realTimeHandlers = [];

  NotificationsPushHandlerBloc({
    required this.localPreferencesService,
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
              data: FediPushNotification(
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

    var body = FediPushNotification.fromJson(data!);

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
    required FediPushNotification body,
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
    required FediPushNotification body,
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

    var unifediApiAccessLocalPreferenceBloc =
        UnifediApiAccessLocalPreferenceBloc(
      preferencesService: localPreferencesService,
      userAtHost: authInstance.userAtHost,
    );
    unifediApiAccessLocalPreferenceBloc.performAsyncInit();
    addDisposable(unifediApiAccessLocalPreferenceBloc);

    var localPreferencesUnifediApiAccessBloc =
        LocalPreferencesUnifediApiAccessBloc(
      accessLocalPreferenceBloc: unifediApiAccessLocalPreferenceBloc,
    );

    addDisposable(localPreferencesUnifediApiAccessBloc);

    var apiManager = authInstance.info!.typeAsUnifediApi.createApiManager(
      apiAccessBloc: localPreferencesUnifediApiAccessBloc,
      computeImpl: null,
    );

    addDisposable(apiManager);

    var unifediApiChatService = apiManager.createChatService();
    addDisposable(unifediApiChatService);

    var unifediApiStatusService = apiManager.createStatusService();
    addDisposable(unifediApiChatService);

    var unifediApiNotificationType = remoteNotification.typeAsUnifediApi;

    await unifediApiNotificationType.maybeMap<FutureOr>(
      chatMention: (_) async {
        var chatMessage = remoteNotification.chatMessage!;
        var unifediApiChatMessage = await unifediApiChatService.sendMessage(
          idempotencyKey: null,
          chatId: chatMessage.chatId,
          postChatMessage: UnifediApiPostChatMessage(
            content: notificationActionInput,
            mediaId: null,
          ),
        );
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
    required FediPushNotification body,
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

    var chatMessageRepository = PleromaChatMessageRepository(
      appDatabase: appDatabaseService.appDatabase,
      accountRepository: accountRepository,
    );
    disposableOwner.addDisposable(chatMessageRepository);

    var notificationRepository = NotificationRepository(
      appDatabase: appDatabaseService.appDatabase,
      accountRepository: accountRepository,
      statusRepository: statusRepository,
      chatMessageRepository: chatMessageRepository,
    );
    disposableOwner.addDisposable(notificationRepository);

    var authInstance = instanceListBloc.findInstanceByCredentials(
      host: body.server,
      acct: body.account,
    )!;

    var unifediApiAccessLocalPreferenceBloc =
        UnifediApiAccessLocalPreferenceBloc(
      preferencesService: localPreferencesService,
      userAtHost: authInstance.userAtHost,
    );
    unifediApiAccessLocalPreferenceBloc.performAsyncInit();
    addDisposable(unifediApiAccessLocalPreferenceBloc);

    var localPreferencesUnifediApiAccessBloc =
        LocalPreferencesUnifediApiAccessBloc(
      accessLocalPreferenceBloc: unifediApiAccessLocalPreferenceBloc,
    );

    addDisposable(localPreferencesUnifediApiAccessBloc);

    var apiManager = authInstance.info!.typeAsUnifediApi.createApiManager(
      apiAccessBloc: localPreferencesUnifediApiAccessBloc,
      computeImpl: null,
    );

    addDisposable(apiManager);

    var unifediApiMyAccountService = apiManager.createMyAccountService();
    addDisposable(unifediApiMyAccountService);

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
    }

    // await myAccountBloc.decreaseFollowingRequestCount();

    await disposableOwner.dispose();
  }

  Future<void> _handleNewMessage({
    required PushMessage pushMessage,
    required FediPushNotification body,
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
    UnifediApiAccess instance,
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
