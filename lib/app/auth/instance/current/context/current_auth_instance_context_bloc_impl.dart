import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc_impl.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_local_preference_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/context/current_auth_instance_context_bloc.dart';
import 'package:fedi/app/chat/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/chat_new_messages_handler_bloc_impl.dart';
import 'package:fedi/app/chat/current/current_chat_bloc.dart';
import 'package:fedi/app/chat/current/current_chat_bloc_impl.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository_impl.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/chat/repository/chat_repository_impl.dart';
import 'package:fedi/app/chat/with_last_message/chat_with_last_message_repository.dart';
import 'package:fedi/app/chat/with_last_message/chat_with_last_message_repository_impl.dart';
import 'package:fedi/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/app/conversation/repository/conversation_repository_impl.dart';
import 'package:fedi/app/database/app_database_service_impl.dart';
import 'package:fedi/app/emoji/picker/category/custom/emoji_picker_custom_image_url_category_local_preference_bloc.dart';
import 'package:fedi/app/emoji/picker/category/custom/emoji_picker_custom_image_url_category_local_preference_bloc_impl.dart';
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_local_preference_bloc.dart';
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_local_preference_bloc_impl.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/app/push/subscription_settings/local_preferences/push_subscription_settings_local_preferences_bloc.dart';
import 'package:fedi/app/push/subscription_settings/local_preferences/push_subscription_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/push/subscription_settings/push_subscription_settings_bloc.dart';
import 'package:fedi/app/push/subscription_settings/push_subscription_settings_bloc_impl.dart';
import 'package:fedi/app/search/recent/recent_search_local_preference_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_local_preference_bloc_impl.dart';
import 'package:fedi/app/share/share_service.dart';
import 'package:fedi/app/share/share_service_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_impl.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service_impl.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_service_impl.dart';
import 'package:fedi/pleroma/account/public/pleroma_account_public_service.dart';
import 'package:fedi/pleroma/account/public/pleroma_account_public_service_impl.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service_impl.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service_impl.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_service.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_service_impl.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service_impl.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service_impl.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_service.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_service_impl.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_service.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_service_impl.dart';
import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/pleroma/push/pleroma_push_service.dart';
import 'package:fedi/pleroma/push/pleroma_push_service_impl.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service_impl.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/pleroma/search/pleroma_search_service.dart';
import 'package:fedi/pleroma/search/pleroma_search_service_impl.dart';
import 'package:fedi/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service_impl.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service_impl.dart';
import 'package:fedi/pleroma/status/scheduled/pleroma_scheduled_status_service.dart';
import 'package:fedi/pleroma/status/scheduled/pleroma_scheduled_status_service_impl.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service_impl.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service_impl.dart';
import 'package:fedi/provider/provider_context_bloc_impl.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:fedi/websockets/websockets_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("current_auth_instance_context_bloc_imp.dart");

class CurrentAuthInstanceContextBloc extends ProviderContextBloc
    implements ICurrentAuthInstanceContextBloc {
  final AuthInstance currentInstance;
  final ILocalPreferencesService preferencesService;
  final IConnectionService connectionService;
  final IPushRelayService pushRelayService;
  final IFcmPushService fcmPushService;
  final IPushHandlerBloc pushHandlerBloc;
  final IWebSocketsService webSocketsService;

  bool get isPleromaInstance => currentInstance.isPleromaInstance;

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

    var recentSearchLocalPreferenceBloc = RecentSearchLocalPreferenceBloc(
        currentInstance.userAtHost, preferencesService);

    addDisposable(disposable: recentSearchLocalPreferenceBloc);
    await globalProviderService.asyncInitAndRegister<
        IRecentSearchLocalPreferenceBloc>(recentSearchLocalPreferenceBloc);

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
    var scheduledStatusRepository =
        ScheduledStatusRepository(appDatabase: moorDatabaseService.appDatabase);
    addDisposable(disposable: scheduledStatusRepository);
    await globalProviderService.asyncInitAndRegister<
        IScheduledStatusRepository>(scheduledStatusRepository);
    var conversationRepository = ConversationRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository,
        statusRepository: statusRepository);
    addDisposable(disposable: conversationRepository);
    await globalProviderService
        .asyncInitAndRegister<IConversationRepository>(conversationRepository);

    var chatMessageRepository = ChatMessageRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository);
    addDisposable(disposable: chatMessageRepository);
    await globalProviderService
        .asyncInitAndRegister<IChatMessageRepository>(chatMessageRepository);

    var chatRepository = ChatRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository,
        chatMessageRepository: chatMessageRepository);
    addDisposable(disposable: chatRepository);
    await globalProviderService
        .asyncInitAndRegister<IChatRepository>(chatRepository);

    var notificationRepository = NotificationRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository,
        statusRepository: statusRepository,
        chatMessageRepository: chatMessageRepository);
    addDisposable(disposable: notificationRepository);
    await globalProviderService
        .asyncInitAndRegister<INotificationRepository>(notificationRepository);

    var chatWithLastMessageRepository = ChatWithLastMessageRepository(
      chatRepository: chatRepository,
      chatMessageRepository: chatMessageRepository,
    );
    addDisposable(disposable: chatWithLastMessageRepository);
    await globalProviderService.asyncInitAndRegister<
        IChatWithLastMessageRepository>(chatWithLastMessageRepository);

    var restService = RestService(baseUrl: currentInstance.url);
    addDisposable(disposable: restService);
    await globalProviderService.asyncInitAndRegister<IRestService>(restService);

    var pleromaRestService = PleromaRestService(
      restService: restService,
      connectionService: connectionService,
      isPleromaInstance: isPleromaInstance,
    );
    addDisposable(disposable: pleromaRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaRestService>(pleromaRestService);

    var pleromaAuthRestService = PleromaAuthRestService(
      restService: restService,
      connectionService: connectionService,
      accessToken: currentInstance.token.accessToken,
      isPleromaInstance: isPleromaInstance,
    );
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
    var pleromaScheduledStatusService =
        PleromaScheduledStatusService(restService: pleromaAuthRestService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaScheduledStatusService>(pleromaScheduledStatusService);
    addDisposable(disposable: pleromaScheduledStatusService);
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

    var pleromaChatService =
        PleromaChatService(restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaChatService>(pleromaChatService);
    addDisposable(disposable: pleromaChatService);

    var pleromaInstanceService =
        PleromaInstanceService(restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaInstanceService>(pleromaInstanceService);
    addDisposable(disposable: pleromaInstanceService);

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

    var pleromaPollService =
        PleromaPollService(restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaPollService>(pleromaPollService);
    addDisposable(disposable: pleromaPollService);

    var pleromaEmojiService =
        PleromaEmojiService(restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaEmojiService>(pleromaEmojiService);
    addDisposable(disposable: pleromaEmojiService);

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

    var emojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc =
        EmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc(
            preferencesService, userAtHost);
    addDisposable(
        disposable: emojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc);
    await globalProviderService.asyncInitAndRegister<
            IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc>(
        emojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc);

    var customEmojiPickerRecentCategoryLocalPreferenceBloc =
    EmojiPickerRecentCategoryLocalPreferenceBloc(
            preferencesService, userAtHost);
    addDisposable(
        disposable: customEmojiPickerRecentCategoryLocalPreferenceBloc);
    await globalProviderService.asyncInitAndRegister<
        IEmojiPickerRecentCategoryLocalPreferenceBloc>(
        customEmojiPickerRecentCategoryLocalPreferenceBloc);

    var timelineLocalPreferenceBloc =
        TimelineSettingsLocalPreferencesBloc(preferencesService, userAtHost);
    addDisposable(disposable: timelineLocalPreferenceBloc);
    await globalProviderService.asyncInitAndRegister<
        ITimelineSettingsLocalPreferencesBloc>(timelineLocalPreferenceBloc);
    var pushSubscriptionLocalPreferenceBloc =
        PushSubscriptionSettingsLocalPreferencesBloc(
            preferencesService, userAtHost);
    addDisposable(disposable: pushSubscriptionLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<IPushSubscriptionSettingsLocalPreferencesBloc>(
            pushSubscriptionLocalPreferenceBloc);

    var myAccountBloc = MyAccountBloc(
        pleromaMyAccountService: pleromaMyAccountService,
        myAccountLocalPreferenceBloc: myAccountLocalPreferenceBloc,
        accountRepository: accountRepository,
        instance: currentInstance);

    addDisposable(disposable: myAccountBloc);
    await globalProviderService
        .asyncInitAndRegister<IMyAccountBloc>(myAccountBloc);

    var pushSubscriptionBloc = PushSubscriptionSettingsBloc(
        pushRelayService: pushRelayService,
        localPreferencesBloc: pushSubscriptionLocalPreferenceBloc,
        pleromaPushService: pleromaPushService,
        currentInstance: currentInstance,
        fcmPushService: fcmPushService);

    addDisposable(disposable: pushSubscriptionBloc);
    await globalProviderService.asyncInitAndRegister<
        IPushSubscriptionSettingsBloc>(pushSubscriptionBloc);

    var isHaveSubscription = pushSubscriptionBloc.isHaveSubscription;
    if (!isHaveSubscription) {
      await pushSubscriptionBloc.subscribeWithDefaultPreferences();
    }

    var currentChatBloc = CurrentChatBloc();

    await globalProviderService
        .asyncInitAndRegister<ICurrentChatBloc>(currentChatBloc);

    addDisposable(disposable: currentChatBloc);

    var chatNewMessagesHandlerBloc = ChatNewMessagesHandlerBloc(
        chatRepository: chatRepository,
        currentChatBloc: currentChatBloc,
        pleromaChatService: pleromaChatService);

    addDisposable(disposable: chatNewMessagesHandlerBloc);

    await globalProviderService.asyncInitAndRegister<
        IChatNewMessagesHandlerBloc>(chatNewMessagesHandlerBloc);

    var notificationPushLoaderBloc = NotificationPushLoaderBloc(
        currentInstance: currentInstance,
        pushHandlerBloc: pushHandlerBloc,
        notificationRepository: notificationRepository,
        pleromaNotificationService: pleromaNotificationService,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc);

    addDisposable(disposable: notificationPushLoaderBloc);
    await globalProviderService.asyncInitAndRegister<
        INotificationPushLoaderBloc>(notificationPushLoaderBloc);

    var pleromaWebSocketsService = PleromaWebSocketsService(
        webSocketsService: webSocketsService,
        accessToken: currentInstance.token.accessToken,
        baseUri: currentInstance.url,
        connectionService: connectionService);

    addDisposable(disposable: pleromaWebSocketsService);
    await globalProviderService.asyncInitAndRegister<IPleromaWebSocketsService>(
        pleromaWebSocketsService);

    var myAccountSettingsLocalPreferenceBloc =
        MyAccountSettingsLocalPreferenceBloc(
            currentInstance.userAtHost, preferencesService);

    addDisposable(disposable: myAccountSettingsLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<IMyAccountSettingsLocalPreferenceBloc>(
            myAccountSettingsLocalPreferenceBloc);

    var myAccountSettingsBloc = MyAccountSettingsBloc(
        localPreferencesBloc: myAccountSettingsLocalPreferenceBloc);

    addDisposable(disposable: myAccountSettingsBloc);
    await globalProviderService
        .asyncInitAndRegister<IMyAccountSettingsBloc>(myAccountSettingsBloc);

    var shareService = ShareService();

    addDisposable(disposable: shareService);
    await globalProviderService
        .asyncInitAndRegister<IShareService>(shareService);
  }
}
