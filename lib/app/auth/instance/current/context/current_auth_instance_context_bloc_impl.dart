import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/context/current_auth_instance_context_bloc.dart';
import 'package:fedi/app/cache/database/database_cache_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/cache/files/files_cache_model.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/cache/files/files_cache_service_impl.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_bloc.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/global/global_files_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/current/conversation_chat_current_bloc.dart';
import 'package:fedi/app/chat/conversation/current/conversation_chat_current_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_impl.dart';
import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_repository.dart';
import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/current/pleroma_chat_current_bloc.dart';
import 'package:fedi/app/chat/pleroma/current/pleroma_chat_current_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/repository/pleroma_chat_with_last_message_repository.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/repository/pleroma_chat_with_last_message_repository_impl.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc_impl.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preferences_bloc.dart';
import 'package:fedi/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preferences_bloc.dart';
import 'package:fedi/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/context/app_context_bloc_impl.dart';
import 'package:fedi/app/database/app_database_service_impl.dart';
import 'package:fedi/app/emoji/picker/category/custom/emoji_picker_custom_image_url_category_local_preference_bloc.dart';
import 'package:fedi/app/emoji/picker/category/custom/emoji_picker_custom_image_url_category_local_preference_bloc_impl.dart';
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_local_preference_bloc.dart';
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_local_preference_bloc_impl.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/media/settings/local_preferences/global/global_media_settings_local_preferences_bloc.dart';
import 'package:fedi/app/media/settings/local_preferences/instance/instance_media_settings_local_preferences_bloc.dart';
import 'package:fedi/app/media/settings/local_preferences/instance/instance_media_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_bloc_impl.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preferences_bloc.dart';
import 'package:fedi/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preferences_bloc.dart';
import 'package:fedi/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc_impl.dart';
import 'package:fedi/app/push/fcm/fcm_push_permission_asked_local_preferences_bloc.dart';
import 'package:fedi/app/push/fcm/fcm_push_permission_asked_local_preferences_bloc_impl.dart';
import 'package:fedi/app/push/fcm/fcm_push_permission_checker_bloc.dart';
import 'package:fedi/app/push/fcm/fcm_push_permission_checker_bloc_impl.dart';
import 'package:fedi/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/app/push/settings/local_preferences/instance/instance_push_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preferences_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc_impl.dart';
import 'package:fedi/app/search/recent/recent_search_local_preference_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_local_preference_bloc_impl.dart';
import 'package:fedi/app/share/select_account/recent/local_preferences/recent_share_select_account_local_preference_bloc.dart';
import 'package:fedi/app/share/select_account/recent/local_preferences/recent_share_select_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_impl.dart';
import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/post/settings/local_preferences/instance/instance_post_status_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/post/settings/local_preferences/instance/instance_post_status_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_impl.dart';
import 'package:fedi/app/status/sensitive/display_time_storage/status_sensitive_display_time_storage_bloc.dart';
import 'package:fedi/app/status/sensitive/display_time_storage/status_sensitive_display_time_storage_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preferences_bloc.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/instance/instance_web_sockets_settings_local_preferences_bloc.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/instance/instance_web_sockets_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc_impl.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/database/database_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/account/auth/pleroma_auth_account_service.dart';
import 'package:fedi/pleroma/account/auth/pleroma_auth_account_service_impl.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service_impl.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/account/public/pleroma_account_public_service.dart';
import 'package:fedi/pleroma/account/public/pleroma_account_public_service_impl.dart';
import 'package:fedi/pleroma/announcement/pleroma_announcement_service.dart';
import 'package:fedi/pleroma/announcement/pleroma_announcement_service_impl.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_service.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_service_impl.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service_impl.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service_impl.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_service.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_service_impl.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_service.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_service_impl.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service_impl.dart';
import 'package:fedi/pleroma/list/pleroma_list_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_service_impl.dart';
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
import 'package:fedi/pleroma/status/auth/pleroma_auth_status_service.dart';
import 'package:fedi/pleroma/status/auth/pleroma_auth_status_service_impl.dart';
import 'package:fedi/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service_impl.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/status/scheduled/pleroma_scheduled_status_service.dart';
import 'package:fedi/pleroma/status/scheduled/pleroma_scheduled_status_service_impl.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service_impl.dart';
import 'package:fedi/pleroma/web_sockets/pleroma_web_sockets_service.dart';
import 'package:fedi/pleroma/web_sockets/pleroma_web_sockets_service_impl.dart';
import 'package:fedi/provider/provider_context_bloc_impl.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:fedi/web_sockets/service/web_sockets_service.dart';
import 'package:fedi/web_sockets/service/web_sockets_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("current_auth_instance_context_bloc_imp.dart");

class CurrentAuthInstanceContextBloc extends ProviderContextBloc
    implements ICurrentAuthInstanceContextBloc {
  final AuthInstance currentInstance;
  final AppContextBloc appContextBloc;

  bool get isPleromaInstance => currentInstance.isPleromaInstance;

  CurrentAuthInstanceContextBloc({
    @required this.currentInstance,
    @required this.appContextBloc,
  });

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");

    ILocalPreferencesService preferencesService = appContextBloc.get();
    IConnectionService connectionService = appContextBloc.get();
    IPushRelayService pushRelayService = appContextBloc.get();
    IFcmPushService fcmPushService = appContextBloc.get();
    IPushHandlerBloc pushHandlerBloc = appContextBloc.get();

    var globalProviderService = this;

    var userAtHost = currentInstance.userAtHost;

    var fcmPushPermissionAskedLocalPreferencesBloc =
        FcmPushPermissionAskedLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );

    addDisposable(disposable: fcmPushPermissionAskedLocalPreferencesBloc);
    await globalProviderService
        .asyncInitAndRegister<IFcmPushPermissionAskedLocalPreferencesBloc>(
            fcmPushPermissionAskedLocalPreferencesBloc);

    var recentSearchLocalPreferenceBloc = RecentSearchLocalPreferenceBloc(
      preferencesService,
      userAtHost: currentInstance.userAtHost,
    );

    addDisposable(disposable: recentSearchLocalPreferenceBloc);
    await globalProviderService.asyncInitAndRegister<
        IRecentSearchLocalPreferenceBloc>(recentSearchLocalPreferenceBloc);

    var moorDatabaseService = AppDatabaseService(dbName: userAtHost);
    addDisposable(disposable: moorDatabaseService);
    await globalProviderService
        .asyncInitAndRegister<AppDatabaseService>(moorDatabaseService);
    await globalProviderService
        .asyncInitAndRegister<IDatabaseService>(moorDatabaseService);

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

    var draftStatusRepository =
        DraftStatusRepository(appDatabase: moorDatabaseService.appDatabase);
    addDisposable(disposable: draftStatusRepository);
    await globalProviderService
        .asyncInitAndRegister<IDraftStatusRepository>(draftStatusRepository);

    var conversationRepository = ConversationChatRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository,
        statusRepository: statusRepository);
    addDisposable(disposable: conversationRepository);
    await globalProviderService.asyncInitAndRegister<
        IConversationChatRepository>(conversationRepository);

    var chatMessageRepository = PleromaChatMessageRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository);
    addDisposable(disposable: chatMessageRepository);
    await globalProviderService.asyncInitAndRegister<
        IPleromaChatMessageRepository>(chatMessageRepository);

    var chatRepository = PleromaChatRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository,
        chatMessageRepository: chatMessageRepository);
    addDisposable(disposable: chatRepository);
    await globalProviderService
        .asyncInitAndRegister<IPleromaChatRepository>(chatRepository);

    var notificationRepository = NotificationRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository,
        statusRepository: statusRepository,
        chatMessageRepository: chatMessageRepository);
    addDisposable(disposable: notificationRepository);
    await globalProviderService
        .asyncInitAndRegister<INotificationRepository>(notificationRepository);

    var pleromaChatWithLastMessageRepository =
        PleromaChatWithLastMessageRepository(
      chatRepository: chatRepository,
      chatMessageRepository: chatMessageRepository,
    );
    addDisposable(disposable: pleromaChatWithLastMessageRepository);
    await globalProviderService
        .asyncInitAndRegister<IPleromaChatWithLastMessageRepository>(
            pleromaChatWithLastMessageRepository);

    var conversationChatWithLastMessageRepository =
        ConversationChatWithLastMessageRepository(
      conversationChatRepository: conversationRepository,
      statusRepository: statusRepository,
    );
    addDisposable(disposable: conversationChatWithLastMessageRepository);
    await globalProviderService
        .asyncInitAndRegister<IConversationChatWithLastMessageRepository>(
            conversationChatWithLastMessageRepository);

    var restService = RestService(baseUri: currentInstance.uri);
    addDisposable(disposable: restService);
    await globalProviderService.asyncInitAndRegister<IRestService>(restService);

    var pleromaRestService = PleromaRestService(
      restService: restService,
      connectionService: connectionService,
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

    var pleromaCaptchaService =
        PleromaCaptchaService(restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaCaptchaService>(pleromaCaptchaService);
    addDisposable(disposable: pleromaCaptchaService);

    var pleromaAnnouncementsService =
        PleromaAnnouncementService(restService: pleromaAuthRestService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaAnnouncementService>(pleromaAnnouncementsService);
    addDisposable(disposable: pleromaAnnouncementsService);

    var pleromaMediaAttachmentService =
        PleromaMediaAttachmentService(restService: pleromaAuthRestService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaMediaAttachmentService>(pleromaMediaAttachmentService);
    addDisposable(disposable: pleromaMediaAttachmentService);

    var pleromaListService =
        PleromaListService(restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaListService>(pleromaListService);
    addDisposable(disposable: pleromaListService);

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
        PleromaAuthAccountService(authRestService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaAccountService>(pleromaAccountService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaAuthAccountService>(pleromaAccountService);

    addDisposable(disposable: pleromaAccountService);
    var pleromaTimelineService =
        PleromaTimelineService(restService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaTimelineService>(pleromaTimelineService);
    addDisposable(disposable: pleromaTimelineService);

    var pleromaStatusService =
        PleromaAuthStatusService(authRestService: pleromaAuthRestService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaStatusService>(pleromaStatusService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaAuthStatusService>(pleromaStatusService);

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

    var myAccountLocalPreferenceBloc = MyAccountLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    );
    addDisposable(disposable: myAccountLocalPreferenceBloc);
    await globalProviderService.asyncInitAndRegister<
        IMyAccountLocalPreferenceBloc>(myAccountLocalPreferenceBloc);

    var emojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc =
        EmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    );
    addDisposable(
        disposable: emojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc);
    await globalProviderService.asyncInitAndRegister<
            IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc>(
        emojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc);

    var customEmojiPickerRecentCategoryLocalPreferenceBloc =
        EmojiPickerRecentCategoryLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    );
    addDisposable(
        disposable: customEmojiPickerRecentCategoryLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<IEmojiPickerRecentCategoryLocalPreferenceBloc>(
            customEmojiPickerRecentCategoryLocalPreferenceBloc);

    var timelinesHomeTabStorageLocalPreferencesBloc =
        TimelinesHomeTabStorageLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );
    addDisposable(disposable: timelinesHomeTabStorageLocalPreferencesBloc);
    await globalProviderService
        .asyncInitAndRegister<ITimelinesHomeTabStorageLocalPreferencesBloc>(
            timelinesHomeTabStorageLocalPreferencesBloc);

    var instancePushSettingsLocalPreferenceBloc =
        InstancePushSettingsLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );
    addDisposable(disposable: instancePushSettingsLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<IPushSettingsLocalPreferencesBloc>(
            instancePushSettingsLocalPreferenceBloc);

    var myAccountBloc = MyAccountBloc(
        pleromaMyAccountService: pleromaMyAccountService,
        myAccountLocalPreferenceBloc: myAccountLocalPreferenceBloc,
        accountRepository: accountRepository,
        instance: currentInstance);

    addDisposable(disposable: myAccountBloc);
    await globalProviderService
        .asyncInitAndRegister<IMyAccountBloc>(myAccountBloc);

    var pushSettingsBloc = PushSettingsBloc(
      pushRelayService: pushRelayService,
      instanceLocalPreferencesBloc: instancePushSettingsLocalPreferenceBloc,
      pleromaPushService: pleromaPushService,
      currentInstance: currentInstance,
      fcmPushService: fcmPushService,
    );

    addDisposable(disposable: pushSettingsBloc);
    await globalProviderService
        .asyncInitAndRegister<IPushSettingsBloc>(pushSettingsBloc);

    var currentPleromaChatBloc = PleromaChatCurrentBloc();

    await globalProviderService
        .asyncInitAndRegister<IPleromaChatCurrentBloc>(currentPleromaChatBloc);

    addDisposable(disposable: currentPleromaChatBloc);
    var currentConversationChatBloc = ConversationChatCurrentBloc();

    await globalProviderService.asyncInitAndRegister<
        IConversationChatCurrentBloc>(currentConversationChatBloc);

    addDisposable(disposable: currentConversationChatBloc);

    var chatNewMessagesHandlerBloc = PleromaChatNewMessagesHandlerBloc(
        chatRepository: chatRepository,
        currentChatBloc: currentPleromaChatBloc,
        pleromaChatService: pleromaChatService);

    await globalProviderService.asyncInitAndRegister<
        IPleromaChatNewMessagesHandlerBloc>(chatNewMessagesHandlerBloc);
    addDisposable(disposable: chatNewMessagesHandlerBloc);
    var conversationChatNewMessagesHandlerBloc =
        ConversationChatNewMessagesHandlerBloc(
            conversationRepository: conversationRepository,
            currentChatBloc: currentConversationChatBloc,
            conversationChatService: pleromaConversationService);

    await globalProviderService
        .asyncInitAndRegister<IConversationChatNewMessagesHandlerBloc>(
            conversationChatNewMessagesHandlerBloc);
    addDisposable(disposable: conversationChatNewMessagesHandlerBloc);

    var notificationPushLoaderBloc = NotificationPushLoaderBloc(
        currentInstance: currentInstance,
        pushHandlerBloc: pushHandlerBloc,
        notificationRepository: notificationRepository,
        pleromaNotificationService: pleromaNotificationService,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc);

    addDisposable(disposable: notificationPushLoaderBloc);
    await globalProviderService.asyncInitAndRegister<
        INotificationPushLoaderBloc>(notificationPushLoaderBloc);

    if (timelinesHomeTabStorageLocalPreferencesBloc
            .value?.timelineIds?.isNotEmpty !=
        true) {
      var remoteLists = await pleromaListService.getLists();

      var timelines = [
        Timeline.home(
          label: null,
          id: "home",
          isPossibleToDelete: false,
          settings: TimelineSettings.createDefaultHomeSettings(),
        ),
        Timeline.public(
          label: null,
          id: "local",
          settings: TimelineSettings.createDefaultPublicSettings().copyWith(
            onlyLocal: true,
          ),
        ),
        Timeline.public(
          label: null,
          id: "public",
          settings: TimelineSettings.createDefaultPublicSettings().copyWith(
            onlyLocal: false,
          ),
        ),
        if (remoteLists?.isNotEmpty == true)
          ...remoteLists.map((remoteList) => Timeline.customList(
                remoteList: remoteList,
                settings: TimelineSettings.createDefaultCustomListSettings(
                  onlyInRemoteList: remoteList,
                ),
              )),
      ];
      var storage = TimelinesHomeTabStorage(
        timelineIds: timelines
            .map(
              (timeline) => timeline.id,
            )
            .toList(),
      );

      for (var timeline in timelines) {
        var timelineLocalPreferencesBloc = TimelineLocalPreferencesBloc.byId(
          preferencesService,
          userAtHost: currentInstance.userAtHost,
          timelineId: timeline.id,
          defaultValue: null,
        );
        await timelineLocalPreferencesBloc.performAsyncInit();
        await timelineLocalPreferencesBloc.setValue(timeline);
        await timelineLocalPreferencesBloc.dispose();
      }

      await timelinesHomeTabStorageLocalPreferencesBloc.setValue(storage);
    }

    var fcmPushPermissionCheckerBloc = FcmPushPermissionCheckerBloc(
      fcmPushService: fcmPushService,
      fcmPushPermissionAskedLocalPreferencesBloc:
          fcmPushPermissionAskedLocalPreferencesBloc,
      pushSettingsBloc: pushSettingsBloc,
    );

    addDisposable(disposable: fcmPushPermissionCheckerBloc);
    await globalProviderService.asyncInitAndRegister<
        IFcmPushPermissionCheckerBloc>(fcmPushPermissionCheckerBloc);

    var instanceChatSettingsLocalPreferencesBloc =
        InstanceChatSettingsLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );

    await globalProviderService
        .asyncInitAndRegister<IInstanceChatSettingsLocalPreferencesBloc>(
            instanceChatSettingsLocalPreferencesBloc);
    addDisposable(disposable: instanceChatSettingsLocalPreferencesBloc);

    var instanceMediaSettingsLocalPreferencesBloc =
        InstanceMediaSettingsLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );
    await globalProviderService
        .asyncInitAndRegister<IInstanceMediaSettingsLocalPreferencesBloc>(
            instanceMediaSettingsLocalPreferencesBloc);
    addDisposable(disposable: instanceMediaSettingsLocalPreferencesBloc);

    var instanceToastSettingsLocalPreferencesBloc =
        InstanceToastSettingsLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );

    await globalProviderService
        .asyncInitAndRegister<IInstanceToastSettingsLocalPreferencesBloc>(
            instanceToastSettingsLocalPreferencesBloc);
    addDisposable(disposable: instanceToastSettingsLocalPreferencesBloc);

    var instancePostStatusSettingsLocalPreferencesBloc =
        InstancePostStatusSettingsLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );

    await globalProviderService
        .asyncInitAndRegister<IInstancePostStatusSettingsLocalPreferencesBloc>(
            instancePostStatusSettingsLocalPreferencesBloc);
    addDisposable(disposable: instancePostStatusSettingsLocalPreferencesBloc);

    var instanceStatusSensitiveSettingsLocalPreferencesBloc =
        InstanceStatusSensitiveSettingsLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );

    await globalProviderService.asyncInitAndRegister<
            IInstanceStatusSensitiveSettingsLocalPreferencesBloc>(
        instanceStatusSensitiveSettingsLocalPreferencesBloc);
    addDisposable(
        disposable: instanceStatusSensitiveSettingsLocalPreferencesBloc);

    var instanceWebSocketsSettingsLocalPreferencesBloc =
        InstanceWebSocketsSettingsLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );

    await globalProviderService
        .asyncInitAndRegister<IInstanceWebSocketsSettingsLocalPreferencesBloc>(
            instanceWebSocketsSettingsLocalPreferencesBloc);
    addDisposable(disposable: instanceWebSocketsSettingsLocalPreferencesBloc);

    var instancePaginationSettingsLocalPreferencesBloc =
        InstancePaginationSettingsLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );

    await globalProviderService
        .asyncInitAndRegister<IInstancePaginationSettingsLocalPreferencesBloc>(
            instancePaginationSettingsLocalPreferencesBloc);
    addDisposable(disposable: instancePaginationSettingsLocalPreferencesBloc);

    var instanceFilesCacheSettingsLocalPreferencesBloc =
        InstanceFilesCacheSettingsLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );

    await globalProviderService
        .asyncInitAndRegister<IInstanceFilesCacheSettingsLocalPreferencesBloc>(
            instanceFilesCacheSettingsLocalPreferencesBloc);
    addDisposable(disposable: instanceFilesCacheSettingsLocalPreferencesBloc);

    var instanceDatabaseCacheSettingsLocalPreferencesBloc =
        InstanceDatabaseCacheSettingsLocalPreferencesBloc(
      preferencesService,
      userAtHost: userAtHost,
    );

    await globalProviderService.asyncInitAndRegister<
            IInstanceDatabaseCacheSettingsLocalPreferencesBloc>(
        instanceDatabaseCacheSettingsLocalPreferencesBloc);
    addDisposable(
        disposable: instanceDatabaseCacheSettingsLocalPreferencesBloc);

    var chatSettingsBloc = ChatSettingsBloc(
      instanceLocalPreferencesBloc: instanceChatSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalChatSettingsLocalPreferencesBloc>(),
    );

    await globalProviderService
        .asyncInitAndRegister<IChatSettingsBloc>(chatSettingsBloc);
    addDisposable(disposable: chatSettingsBloc);

    var mediaSettingsBloc = MediaSettingsBloc(
      instanceLocalPreferencesBloc: instanceMediaSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalMediaSettingsLocalPreferencesBloc>(),
    );
    await globalProviderService
        .asyncInitAndRegister<IMediaSettingsBloc>(mediaSettingsBloc);
    addDisposable(disposable: mediaSettingsBloc);

    var toastSettingsBloc = ToastSettingsBloc(
      instanceLocalPreferencesBloc: instanceToastSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalToastSettingsLocalPreferencesBloc>(),
    );

    await globalProviderService
        .asyncInitAndRegister<IToastSettingsBloc>(toastSettingsBloc);
    addDisposable(disposable: toastSettingsBloc);

    var postStatusSettingsBloc = PostStatusSettingsBloc(
      instanceLocalPreferencesBloc:
          instancePostStatusSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalPostStatusSettingsLocalPreferencesBloc>(),
    );

    await globalProviderService
        .asyncInitAndRegister<IPostStatusSettingsBloc>(postStatusSettingsBloc);
    addDisposable(disposable: postStatusSettingsBloc);

    var statusSensitiveSettingsBloc = StatusSensitiveSettingsBloc(
      instanceLocalPreferencesBloc:
          instanceStatusSensitiveSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc: appContextBloc
          .get<IGlobalStatusSensitiveSettingsLocalPreferencesBloc>(),
    );

    await globalProviderService.asyncInitAndRegister<
        IStatusSensitiveSettingsBloc>(statusSensitiveSettingsBloc);
    addDisposable(disposable: statusSensitiveSettingsBloc);

    var webSocketsSettingsBloc = WebSocketsSettingsBloc(
      instanceLocalPreferencesBloc:
          instanceWebSocketsSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalWebSocketsSettingsLocalPreferencesBloc>(),
    );

    await globalProviderService
        .asyncInitAndRegister<IWebSocketsSettingsBloc>(webSocketsSettingsBloc);
    addDisposable(disposable: webSocketsSettingsBloc);

    var paginationSettingsBloc = PaginationSettingsBloc(
      instanceLocalPreferencesBloc:
          instancePaginationSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalPaginationSettingsLocalPreferencesBloc>(),
    );

    await globalProviderService
        .asyncInitAndRegister<IPaginationSettingsBloc>(paginationSettingsBloc);
    addDisposable(disposable: paginationSettingsBloc);

    var databaseCacheSettingsBloc = DatabaseCacheSettingsBloc(
      instanceLocalPreferencesBloc:
          instanceDatabaseCacheSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc: appContextBloc
          .get<IGlobalDatabaseCacheSettingsLocalPreferencesBloc>(),
    );

    await globalProviderService.asyncInitAndRegister<
        IDatabaseCacheSettingsBloc>(databaseCacheSettingsBloc);
    addDisposable(disposable: databaseCacheSettingsBloc);

    var filesCacheSettingsBloc = FilesCacheSettingsBloc(
      instanceLocalPreferencesBloc:
          instanceFilesCacheSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalFilesCacheSettingsLocalPreferencesBloc>(),
    );

    await globalProviderService
        .asyncInitAndRegister<IFilesCacheSettingsBloc>(filesCacheSettingsBloc);
    addDisposable(disposable: filesCacheSettingsBloc);

    var statusSensitiveDisplayTimeStorageBloc =
        StatusSensitiveDisplayTimeStorageBloc();

    await globalProviderService
        .asyncInitAndRegister<IStatusSensitiveDisplayTimeStorageBloc>(
            statusSensitiveDisplayTimeStorageBloc);
    addDisposable(disposable: statusSensitiveDisplayTimeStorageBloc);

    var webSocketsService =
        WebSocketsService(configBloc: webSocketsSettingsBloc);
    await globalProviderService
        .asyncInitAndRegister<IWebSocketsService>(webSocketsService);
    addDisposable(disposable: webSocketsService);

    var pleromaWebSocketsService = PleromaWebSocketsService(
        webSocketsService: webSocketsService,
        accessToken: currentInstance.token.accessToken,
        baseUri: currentInstance.uri,
        connectionService: connectionService);

    addDisposable(disposable: pleromaWebSocketsService);
    await globalProviderService.asyncInitAndRegister<IPleromaWebSocketsService>(
        pleromaWebSocketsService);

    var webSocketsHandlerManagerBloc = WebSocketsHandlerManagerBloc(
      pleromaWebSocketsService: pleromaWebSocketsService,
      conversationRepository: conversationRepository,
      notificationRepository: notificationRepository,
      statusRepository: statusRepository,
      chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
      conversationChatNewMessagesHandlerBloc:
          conversationChatNewMessagesHandlerBloc,
    );

    addDisposable(disposable: webSocketsHandlerManagerBloc);
    await globalProviderService.asyncInitAndRegister<
        IWebSocketsHandlerManagerBloc>(webSocketsHandlerManagerBloc);

    var timelinesHomeTabStorageBloc = TimelinesHomeTabStorageBloc(
      preferences: timelinesHomeTabStorageLocalPreferencesBloc,
      authInstance: currentInstance,
      preferencesService: preferencesService,
    );

    addDisposable(disposable: timelinesHomeTabStorageBloc);
    await globalProviderService.asyncInitAndRegister<
        ITimelinesHomeTabStorageBloc>(timelinesHomeTabStorageBloc);

    var recentShareSelectAccountLocalPreferenceBloc =
        RecentShareSelectAccountLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    );

    addDisposable(disposable: recentShareSelectAccountLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<IRecentShareSelectAccountLocalPreferenceBloc>(
            recentShareSelectAccountLocalPreferenceBloc);

    var pleromaFilterService = PleromaFilterService(
      restService: pleromaAuthRestService,
    );

    addDisposable(disposable: pleromaFilterService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaFilterService>(pleromaFilterService);

    var filterRepository = FilterRepository(
      appDatabase: moorDatabaseService.appDatabase,
    );

    addDisposable(disposable: filterRepository);
    await globalProviderService
        .asyncInitAndRegister<IFilterRepository>(filterRepository);

    var filesCacheService = FilesCacheService(
      connectionService: connectionService,
      key: userAtHost,
      stalePeriod: filesCacheSettingsBloc.filesCacheAgeLimitType?.toDuration(),
      maxNrOfCacheObjects:
          filesCacheSettingsBloc.filesCacheSizeLimitCountType?.toCount(),
    );
    addDisposable(disposable: filesCacheService);
    await globalProviderService
        .asyncInitAndRegister<IFilesCacheService>(filesCacheService);

    await moorDatabaseService.clearByLimits(
      ageLimit: databaseCacheSettingsBloc.ageLimit?.toDuration(),
      entriesCountByTypeLimit:
          databaseCacheSettingsBloc.entriesCountByTypeLimit?.toCount(),
    );
  }
}
