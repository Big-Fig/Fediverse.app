import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/refactored/app/account/my/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/auth/instance/current/context/current_auth_instance_context_bloc.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository_impl.dart';
import 'package:fedi/refactored/app/notification/push/notification_push_loader_bloc_impl.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/refactored/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_bloc_impl.dart';
import 'package:fedi/refactored/app/push/subscription/push_subscription_bloc.dart';
import 'package:fedi/refactored/app/push/subscription/push_subscription_bloc_impl.dart';
import 'package:fedi/refactored/app/share/share_service.dart';
import 'package:fedi/refactored/app/share/share_service_impl.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_impl.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/refactored/connection/connection_service.dart';
import 'package:fedi/refactored/database/moor/moor_database_service_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_service_impl.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service_impl.dart';
import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_service.dart';
import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_service_impl.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_service_impl.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_service_impl.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_service.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_service_impl.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_service.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_service_impl.dart';
import 'package:fedi/refactored/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/refactored/pleroma/rest/auth/pleroma_auth_rest_service_impl.dart';
import 'package:fedi/refactored/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/refactored/pleroma/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/refactored/pleroma/search/pleroma_search_service.dart';
import 'package:fedi/refactored/pleroma/search/pleroma_search_service_impl.dart';
import 'package:fedi/refactored/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service.dart';
import 'package:fedi/refactored/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service_impl.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service_impl.dart';
import 'package:fedi/refactored/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/refactored/pleroma/timeline/pleroma_timeline_service_impl.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service_impl.dart';
import 'package:fedi/refactored/provider/provider_context_bloc_impl.dart';
import 'package:fedi/refactored/push/fcm/fcm_push_service.dart';
import 'package:fedi/refactored/push/relay/push_relay_service.dart';
import 'package:fedi/refactored/rest/rest_service.dart';
import 'package:fedi/refactored/rest/rest_service_impl.dart';
import 'package:fedi/refactored/websockets/websockets_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("app_context_bloc_impl.dart");

class CurrentAuthInstanceContextBloc extends ProviderContextBloc
    implements ICurrentAuthInstanceContextBloc {
  final AuthInstance currentInstance;
  final ILocalPreferencesService preferencesService;
  final IConnectionService connectionService;
  final IPushRelayService pushRelayService;
  final IFcmPushService fcmPushService;
  final IPushHandlerBloc pushHandlerBloc;
  final IWebSocketsService webSocketsService;

  CurrentAuthInstanceContextBloc({
    @required this.webSocketsService,
    @required this.currentInstance,
    @required this.preferencesService,
    @required this.connectionService,
    @required this.pushRelayService,
    @required this.fcmPushService,
    @required this.pushHandlerBloc,
  });

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");

    await fcmPushService.askPermissions();

    var globalProviderService = this;

    var userAtHost = currentInstance.userAtHost;
    var moorDatabaseService = MoorDatabaseService(dbName: userAtHost);
    addDisposable(disposable: moorDatabaseService);
    await globalProviderService
        .asyncInitAndRegister<MoorDatabaseService>(moorDatabaseService);

    var accountRepository =
        AccountRepository(appDatabase: moorDatabaseService.appDatabase);
    addDisposable(disposable: accountRepository);
    await globalProviderService
        .asyncInitAndRegister<IAccountRepository>(accountRepository);

    var statusRepository = StatusRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository);
    addDisposable(disposable: statusRepository);
    await globalProviderService
        .asyncInitAndRegister<IStatusRepository>(statusRepository);
    var conversationRepository = ConversationRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository,
        statusRepository: statusRepository);
    addDisposable(disposable: conversationRepository);
    await globalProviderService
        .asyncInitAndRegister<IConversationRepository>(conversationRepository);

    var notificationRepository = NotificationRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository,
        statusRepository: statusRepository);
    addDisposable(disposable: notificationRepository);
    await globalProviderService
        .asyncInitAndRegister<INotificationRepository>(notificationRepository);

    var restService = RestService(baseUrl: currentInstance.url);
    addDisposable(disposable: restService);
    await globalProviderService.asyncInitAndRegister<IRestService>(restService);

    var pleromaRestService = PleromaRestService(
        restService: restService, connectionService: connectionService);
    addDisposable(disposable: pleromaRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaRestService>(pleromaRestService);

    var pleromaAuthRestService = PleromaAuthRestService(
        restService: restService,
        connectionService: connectionService,
        accessToken: currentInstance.token.accessToken);
    addDisposable(disposable: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaAuthRestService>(pleromaAuthRestService);

    var pleromaMediaAttachmentService =
        PleromaMediaAttachmentService(restService: pleromaAuthRestService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaMediaAttachmentService>(pleromaMediaAttachmentService);
    addDisposable(disposable: pleromaMediaAttachmentService);
    var pleromaMyAccountService =
        PleromaMyAccountService(restService: pleromaAuthRestService);
    await globalProviderService.asyncInitAndRegister<IPleromaMyAccountService>(
        pleromaMyAccountService);
    addDisposable(disposable: pleromaMyAccountService);
    var pleromaAccountPublicService =
        PleromaAccountPublicService(restService: pleromaAuthRestService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaAccountPublicService>(pleromaAccountPublicService);
    addDisposable(disposable: pleromaAccountPublicService);
    var pleromaAccountService =
        PleromaAccountService(restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaAccountService>(pleromaAccountService);
    addDisposable(disposable: pleromaAccountService);
    var pleromaTimelineService =
        PleromaTimelineService(restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaTimelineService>(pleromaTimelineService);
    addDisposable(disposable: pleromaTimelineService);
    var pleromaStatusService =
        PleromaStatusService(restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaStatusService>(pleromaStatusService);
    addDisposable(disposable: pleromaStatusService);
    var pleromaStatusEmojiReactionService =
        PleromaStatusEmojiReactionService(restService: pleromaAuthRestService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaStatusEmojiReactionService>(pleromaStatusEmojiReactionService);
    addDisposable(disposable: pleromaStatusEmojiReactionService);
    var pleromaConversationService =
        PleromaConversationService(restService: pleromaAuthRestService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaConversationService>(pleromaConversationService);
    addDisposable(disposable: pleromaConversationService);
    var pleromaSearchService =
        PleromaSearchService(restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaSearchService>(pleromaSearchService);
    addDisposable(disposable: pleromaSearchService);

    var pleromaNotificationService =
        PleromaNotificationService(restService: pleromaAuthRestService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaNotificationService>(pleromaNotificationService);
    addDisposable(disposable: pleromaNotificationService);

    var pleromaPushService = PleromaPushService(
        keys: PleromaPushSubscriptionKeys(
            p256dh:
                "BEpPCn0cfs3P0E0fY-gyOuahx5dW5N8quUowlrPyfXlMa6tABLqqcSpOpMnC1-o_UB_s4R8NQsqMLbASjnqSbqw=",
            auth: "T5bhIIyre5TDC1LyX4mFAQ=="),
        restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaPushService>(pleromaPushService);
    addDisposable(disposable: pleromaPushService);

    var myAccountLocalPreferenceBloc =
        MyAccountLocalPreferenceBloc(preferencesService, userAtHost);
    addDisposable(disposable: myAccountLocalPreferenceBloc);
    await globalProviderService.asyncInitAndRegister<
        IMyAccountLocalPreferenceBloc>(myAccountLocalPreferenceBloc);

    var timelineLocalPreferenceBloc =
        TimelineLocalPreferencesBloc(preferencesService, userAtHost);
    addDisposable(disposable: timelineLocalPreferenceBloc);
    await globalProviderService.asyncInitAndRegister<
        ITimelineLocalPreferencesBloc>(timelineLocalPreferenceBloc);
    var pushSubscriptionLocalPreferenceBloc =
        PushSubscriptionLocalPreferencesBloc(preferencesService, userAtHost);
    addDisposable(disposable: pushSubscriptionLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<IPushSubscriptionLocalPreferencesBloc>(
            pushSubscriptionLocalPreferenceBloc);

    var myAccountBloc = MyAccountBloc(
        pleromaMyAccountService: pleromaMyAccountService,
        myAccountLocalPreferenceBloc: myAccountLocalPreferenceBloc,
        accountRepository: accountRepository,
        instance: currentInstance);

    addDisposable(disposable: myAccountBloc);
    await globalProviderService
        .asyncInitAndRegister<IMyAccountBloc>(myAccountBloc);

    var pushSubscriptionBloc = PushSubscriptionBloc(
        pushRelayService: pushRelayService,
        pushSubscriptionLocalPreferencesBloc:
            pushSubscriptionLocalPreferenceBloc,
        pleromaPushService: pleromaPushService,
        currentInstance: currentInstance,
        fcmPushService: fcmPushService);

    addDisposable(disposable: pushSubscriptionBloc);
    await globalProviderService
        .asyncInitAndRegister<IPushSubscriptionBloc>(pushSubscriptionBloc);

    var isHaveSubscription = pushSubscriptionBloc.isHaveSubscription;
    if (!isHaveSubscription) {
      await pushSubscriptionBloc.subscribeWithDefaultPreferences();
    }

    var notificationPushLoaderBloc = NotificationPushLoaderBloc(
        currentInstance: currentInstance,
        pushHandlerBloc: pushHandlerBloc,
        notificationRepository: notificationRepository,
        pleromaNotificationService: pleromaNotificationService);

    addDisposable(disposable: notificationPushLoaderBloc);

    var pleromaWebSocketsService = PleromaWebSocketsService(
        webSocketsService: webSocketsService,
        accessToken: currentInstance.token.accessToken,
        baseUri: currentInstance.url);

    addDisposable(disposable: pleromaWebSocketsService);
    await globalProviderService.asyncInitAndRegister<IPleromaWebSocketsService>(
        pleromaWebSocketsService);

    var shareService = ShareService();

    addDisposable(disposable: shareService);
    await globalProviderService
        .asyncInitAndRegister<IShareService>(shareService);
  }
}
