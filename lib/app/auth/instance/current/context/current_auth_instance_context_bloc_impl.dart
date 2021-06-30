import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/context/current_auth_instance_context_bloc.dart';
import 'package:fedi/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preference_bloc.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preference_bloc.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/cache/files/files_cache_service_impl.dart';
import 'package:fedi/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_bloc.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/global/global_files_cache_settings_local_preference_bloc.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preference_bloc.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preference_bloc_impl.dart';
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
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc.dart';
import 'package:fedi/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preference_bloc.dart';
import 'package:fedi/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/context/app_context_bloc.dart';
import 'package:fedi/app/database/app_database_service_impl.dart';
import 'package:fedi/app/emoji/picker/category/custom_image_url/local_preferences/emoji_picker_custom_image_url_category_local_preference_bloc.dart';
import 'package:fedi/app/emoji/picker/category/custom_image_url/local_preferences/emoji_picker_custom_image_url_category_local_preference_bloc_impl.dart';
import 'package:fedi/app/emoji/picker/category/recent/local_preferences/emoji_picker_recent_category_local_preference_bloc.dart';
import 'package:fedi/app/emoji/picker/category/recent/local_preferences/emoji_picker_recent_category_local_preference_bloc_impl.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/local_preferences/timelines_home_tab_storage_local_preference_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/local_preferences/timelines_home_tab_storage_local_preference_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_impl.dart';
import 'package:fedi/app/instance/announcement/settings/local_preferences/instance/instance_instance_announcement_settings_local_preference_bloc.dart';
import 'package:fedi/app/instance/announcement/settings/local_preferences/instance/instance_instance_announcement_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/settings/local_preferences/instance_announcement_settings_local_preference_bloc.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service_impl.dart';
import 'package:fedi/app/media/settings/local_preferences/global/global_media_settings_local_preference_bloc.dart';
import 'package:fedi/app/media/settings/local_preferences/instance/instance_media_settings_local_preference_bloc.dart';
import 'package:fedi/app/media/settings/local_preferences/instance/instance_media_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_bloc_impl.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preference_bloc.dart';
import 'package:fedi/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preference_bloc.dart';
import 'package:fedi/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc_impl.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_bloc.dart';
import 'package:fedi/app/push/permission/ask/local_preferences/ask_push_permission_local_preference_bloc.dart';
import 'package:fedi/app/push/permission/ask/local_preferences/ask_push_permission_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/permission/checker/push_permission_checker_bloc.dart';
import 'package:fedi/app/push/permission/checker/push_permission_checker_bloc_impl.dart';
import 'package:fedi/app/push/settings/local_preferences/instance/instance_push_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preference_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc_impl.dart';
import 'package:fedi/app/search/recent/local_preferences/recent_search_local_preference_bloc.dart';
import 'package:fedi/app/search/recent/local_preferences/recent_search_local_preference_bloc_impl.dart';
import 'package:fedi/app/share/select_account/recent/local_preferences/recent_share_select_account_local_preference_bloc.dart';
import 'package:fedi/app/share/select_account/recent/local_preferences/recent_share_select_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_impl.dart';
import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preference_bloc.dart';
import 'package:fedi/app/status/post/settings/local_preferences/instance/instance_post_status_settings_local_preference_bloc.dart';
import 'package:fedi/app/status/post/settings/local_preferences/instance/instance_post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_impl.dart';
import 'package:fedi/app/status/sensitive/display_time_storage/status_sensitive_display_time_storage_bloc.dart';
import 'package:fedi/app/status/sensitive/display_time_storage/status_sensitive_display_time_storage_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preference_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preference_bloc.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/instance/instance_web_sockets_settings_local_preference_bloc.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/instance/instance_web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc_impl.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/database/database_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/mastodon/api/emoji/mastodon_api_custom_emoji_service.dart';
import 'package:fedi/mastodon/api/emoji/mastodon_api_custom_emoji_service_impl.dart';
import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service.dart';
import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service_impl.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service_impl.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_service.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_service_impl.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_service.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_service_impl.dart';
import 'package:fedi/pleroma/api/captcha/pleroma_api_captcha_service.dart';
import 'package:fedi/pleroma/api/captcha/pleroma_api_captcha_service_impl.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service_impl.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_service.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_service_impl.dart';
import 'package:fedi/pleroma/api/directory/pleroma_api_directory_service.dart';
import 'package:fedi/pleroma/api/directory/pleroma_api_directory_service_impl.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_service.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_service_impl.dart';
import 'package:fedi/pleroma/api/endorsements/pleroma_api_endorsements_service.dart';
import 'package:fedi/pleroma/api/endorsements/pleroma_api_endorsements_service_impl.dart';
import 'package:fedi/pleroma/api/featured_tags/pleroma_api_featured_tags_service.dart';
import 'package:fedi/pleroma/api/featured_tags/pleroma_api_featured_tags_service_impl.dart';
import 'package:fedi/pleroma/api/filter/pleroma_api_filter_service.dart';
import 'package:fedi/pleroma/api/filter/pleroma_api_filter_service_impl.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service_impl.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_service.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_service_impl.dart';
import 'package:fedi/pleroma/api/markers/pleroma_api_markers_service.dart';
import 'package:fedi/pleroma/api/markers/pleroma_api_markers_service_impl.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_service.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_service_impl.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_service.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_service_impl.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_service.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_service_impl.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_service.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_service_impl.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service_impl.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service_impl.dart';
import 'package:fedi/pleroma/api/search/pleroma_api_search_service.dart';
import 'package:fedi/pleroma/api/search/pleroma_api_search_service_impl.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service_impl.dart';
import 'package:fedi/pleroma/api/status/emoji_reaction/pleroma_api_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/api/status/emoji_reaction/pleroma_api_status_emoji_reaction_service_impl.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_service.dart';
import 'package:fedi/pleroma/api/status/scheduled/pleroma_api_scheduled_status_service.dart';
import 'package:fedi/pleroma/api/status/scheduled/pleroma_api_scheduled_status_service_impl.dart';
import 'package:fedi/pleroma/api/suggestions/pleroma_api_suggestions_service.dart';
import 'package:fedi/pleroma/api/suggestions/pleroma_api_suggestions_service_impl.dart';
import 'package:fedi/pleroma/api/timeline/auth/pleroma_api_auth_timeline_service.dart';
import 'package:fedi/pleroma/api/timeline/auth/pleroma_api_auth_timeline_service_impl.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_service.dart';
import 'package:fedi/pleroma/api/trends/pleroma_api_trends_service.dart';
import 'package:fedi/pleroma/api/trends/pleroma_api_trends_service_impl.dart';
import 'package:fedi/pleroma/api/web_sockets/pleroma_api_web_sockets_service.dart';
import 'package:fedi/pleroma/api/web_sockets/pleroma_api_web_sockets_service_impl.dart';
import 'package:fedi/provider/provider_context_bloc_impl.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:fedi/web_sockets/service/web_sockets_service.dart';
import 'package:fedi/web_sockets/service/web_sockets_service_impl.dart';
import 'package:logging/logging.dart';

var _logger = Logger('current_auth_instance_context_bloc_imp.dart');

class CurrentAuthInstanceContextBloc extends ProviderContextBloc
    implements ICurrentAuthInstanceContextBloc {
  final AuthInstance currentInstance;
  final IAppContextBloc appContextBloc;

  bool get isPleromaInstance => currentInstance.isPleroma;

  CurrentAuthInstanceContextBloc({
    required this.currentInstance,
    required this.appContextBloc,
  });

  @override
  // todo: refactor
  // ignore: long-method
  Future internalAsyncInit() async {
    _logger.fine(() => 'internalAsyncInit');

    var preferencesService = appContextBloc.get<ILocalPreferencesService>();
    var connectionService = appContextBloc.get<IConnectionService>();
    var configService = appContextBloc.get<IConfigService>();

    var globalProviderService = this;

    var userAtHost = currentInstance.userAtHost;

    var askPushPermissionLocalPreferenceBloc =
        AskPushPermissionLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IAskPushPermissionLocalPreferenceBloc>(
      askPushPermissionLocalPreferenceBloc,
    );

    var recentSearchLocalPreferenceBloc = RecentSearchLocalPreferenceBloc(
      preferencesService,
      userAtHost: currentInstance.userAtHost,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IRecentSearchLocalPreferenceBloc>(recentSearchLocalPreferenceBloc);

    var moorDatabaseService = AppDatabaseService.forUserAtHost(
      userAtHost: userAtHost,
      configService: configService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<AppDatabaseService>(moorDatabaseService);
    await globalProviderService
        .asyncInitAndRegister<IDatabaseService>(moorDatabaseService);

    var accountRepository =
        AccountRepository(appDatabase: moorDatabaseService.appDatabase)
          ..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IAccountRepository>(accountRepository);

    var statusRepository = StatusRepository(
      appDatabase: moorDatabaseService.appDatabase,
      accountRepository: accountRepository,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IStatusRepository>(statusRepository);

    var scheduledStatusRepository =
        ScheduledStatusRepository(appDatabase: moorDatabaseService.appDatabase)
          ..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IScheduledStatusRepository>(scheduledStatusRepository);

    var draftStatusRepository =
        DraftStatusRepository(appDatabase: moorDatabaseService.appDatabase)
          ..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IDraftStatusRepository>(draftStatusRepository);

    var conversationRepository = ConversationChatRepository(
      appDatabase: moorDatabaseService.appDatabase,
      accountRepository: accountRepository,
      statusRepository: statusRepository,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IConversationChatRepository>(conversationRepository);

    var chatMessageRepository = PleromaChatMessageRepository(
      appDatabase: moorDatabaseService.appDatabase,
      accountRepository: accountRepository,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IPleromaChatMessageRepository>(chatMessageRepository);

    var chatRepository = PleromaChatRepository(
      appDatabase: moorDatabaseService.appDatabase,
      accountRepository: accountRepository,
      chatMessageRepository: chatMessageRepository,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IPleromaChatRepository>(chatRepository);

    var notificationRepository = NotificationRepository(
      appDatabase: moorDatabaseService.appDatabase,
      accountRepository: accountRepository,
      statusRepository: statusRepository,
      chatMessageRepository: chatMessageRepository,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<INotificationRepository>(notificationRepository);

    var pleromaChatWithLastMessageRepository =
        PleromaChatWithLastMessageRepository(
      chatRepository: chatRepository,
      chatMessageRepository: chatMessageRepository,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IPleromaChatWithLastMessageRepository>(
      pleromaChatWithLastMessageRepository,
    );

    var conversationChatWithLastMessageRepository =
        ConversationChatWithLastMessageRepository(
      conversationChatRepository: conversationRepository,
      statusRepository: statusRepository,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IConversationChatWithLastMessageRepository>(
      conversationChatWithLastMessageRepository,
    );

    var restService = RestService(baseUri: currentInstance.uri)
      ..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<IRestService>(restService);

    var pleromaRestService = PleromaApiRestService(
      restService: restService,
      connectionService: connectionService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IPleromaApiRestService>(pleromaRestService);

    var pleromaAuthRestService = PleromaApiAuthRestService(
      restService: restService,
      connectionService: connectionService,
      accessToken: currentInstance.token!.accessToken,
      isPleroma: isPleromaInstance,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IPleromaApiAuthRestService>(pleromaAuthRestService);

    var pleromaCaptchaService =
        PleromaApiCaptchaService(restService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiCaptchaService>(pleromaCaptchaService);

    var pleromaAnnouncementsService =
        PleromaApiAnnouncementService(restService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiAnnouncementService>(pleromaAnnouncementsService);

    var pleromaMediaAttachmentService =
        PleromaApiMediaAttachmentService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiMediaAttachmentService>(pleromaMediaAttachmentService);

    var pleromaListService =
        PleromaApiListService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiListService>(pleromaListService);

    var pleromaMyAccountService =
        PleromaApiMyAccountService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiMyAccountService>(
      pleromaMyAccountService,
    );

    var pleromaAccountPublicService =
        PleromaApiAccountPublicService(restService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiAccountPublicService>(pleromaAccountPublicService);

    var pleromaAccountService =
        PleromaApiAuthAccountService(authRestService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiAccountService>(pleromaAccountService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiAuthAccountService>(pleromaAccountService);

    var pleromaApiAuthTimelineService =
        PleromaApiAuthTimelineService(authRestService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiAuthTimelineService>(pleromaApiAuthTimelineService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiTimelineService>(pleromaApiAuthTimelineService);

    var pleromaStatusService =
        PleromaApiAuthStatusService(authRestService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiStatusService>(pleromaStatusService);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiAuthStatusService>(pleromaStatusService);

    var pleromaScheduledStatusService = PleromaApiScheduledStatusService(
      authRestService: pleromaAuthRestService,
    )..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiScheduledStatusService>(pleromaScheduledStatusService);

    var pleromaApiStatusEmojiReactionService =
        PleromaApiStatusEmojiReactionService(
      authRestService: pleromaAuthRestService,
    )..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiStatusEmojiReactionService>(
      pleromaApiStatusEmojiReactionService,
    );

    var pleromaConversationService =
        PleromaApiConversationService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiConversationService>(pleromaConversationService);

    var pleromaChatService =
        PleromaApiChatService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiChatService>(pleromaChatService);

    var pleromaInstanceService =
        PleromaApiInstanceService(restService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiInstanceService>(pleromaInstanceService);

    var pleromaSearchService =
        PleromaApiSearchService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiSearchService>(pleromaSearchService);

    var pleromaNotificationService =
        PleromaApiNotificationService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiNotificationService>(pleromaNotificationService);

    var pleromaDirectoryService =
        PleromaApiDirectoryService(restService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiDirectoryService>(pleromaDirectoryService);

    var pleromaEndorsementsService =
        PleromaApiEndorsementsService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiEndorsementsService>(pleromaEndorsementsService);

    var pleromaFeaturedTagsService =
        PleromaApiFeaturedTagsService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiFeaturedTagsService>(pleromaFeaturedTagsService);

    var pleromaMarkersService =
        PleromaApiMarkersService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiMarkersService>(pleromaMarkersService);

    var pleromaSuggestionsService =
        PleromaApiSuggestionsService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IPleromaApiSuggestionsService>(pleromaSuggestionsService);

    var pleromaTrendsService =
        PleromaApiTrendsService(restService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiTrendsService>(pleromaTrendsService);

    var pleromaPollService =
        PleromaApiPollService(restService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiPollService>(pleromaPollService);

    var pleromaEmojiService =
        PleromaApiEmojiService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IPleromaApiEmojiService>(pleromaEmojiService);

    var mastodonApiEmojiService =
        MastodonApiEmojiService(restApiAuthService: pleromaAuthRestService)
          ..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<IMastodonApiEmojiService>(
      mastodonApiEmojiService,
    );

    var myAccountLocalPreferenceBloc = MyAccountLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IMyAccountLocalPreferenceBloc>(myAccountLocalPreferenceBloc);

    var emojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc =
        EmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc>(
      emojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc,
    );

    var customEmojiPickerRecentCategoryLocalPreferenceBloc =
        EmojiPickerRecentCategoryLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IEmojiPickerRecentCategoryLocalPreferenceBloc>(
      customEmojiPickerRecentCategoryLocalPreferenceBloc,
    );

    var timelinesHomeTabStorageLocalPreferencesBloc =
        TimelinesHomeTabStorageLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<ITimelinesHomeTabStorageLocalPreferenceBloc>(
      timelinesHomeTabStorageLocalPreferencesBloc,
    );

    var instancePushSettingsLocalPreferenceBloc =
        InstancePushSettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IPushSettingsLocalPreferenceBloc>(
      instancePushSettingsLocalPreferenceBloc,
    );

    var myAccountBloc = MyAccountBloc(
      pleromaMyAccountService: pleromaMyAccountService,
      myAccountLocalPreferenceBloc: myAccountLocalPreferenceBloc,
      accountRepository: accountRepository,
      instance: currentInstance,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IMyAccountBloc>(myAccountBloc);

    var currentPleromaChatBloc = PleromaChatCurrentBloc()..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IPleromaChatCurrentBloc>(currentPleromaChatBloc);

    var currentConversationChatBloc = ConversationChatCurrentBloc()
      ..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IConversationChatCurrentBloc>(currentConversationChatBloc);

    var chatNewMessagesHandlerBloc = PleromaChatNewMessagesHandlerBloc(
      chatRepository: chatRepository,
      currentChatBloc: currentPleromaChatBloc,
      pleromaChatService: pleromaChatService,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IPleromaChatNewMessagesHandlerBloc>(chatNewMessagesHandlerBloc);

    var conversationChatNewMessagesHandlerBloc =
        ConversationChatNewMessagesHandlerBloc(
      conversationRepository: conversationRepository,
      currentChatBloc: currentConversationChatBloc,
      conversationChatService: pleromaConversationService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IConversationChatNewMessagesHandlerBloc>(
      conversationChatNewMessagesHandlerBloc,
    );

    if (configService.pushFcmEnabled) {
      var pushRelayService = appContextBloc.get<IPushRelayService>();
      var fcmPushService = appContextBloc.get<IFcmPushService>();
      var notificationsPushHandlerBloc =
          appContextBloc.get<INotificationsPushHandlerBloc>();

      var pleromaPushService = PleromaApiPushService(
        keys: PleromaApiPushSubscriptionKeys(
          p256dh: configService.pushSubscriptionKeysP256dh!,
          auth: configService.pushSubscriptionKeysAuth!,
        ),
        restService: pleromaAuthRestService,
      )..disposeWith(this);
      await globalProviderService
          .asyncInitAndRegister<IPleromaApiPushService>(pleromaPushService);

      var pushSettingsBloc = PushSettingsBloc(
        pushRelayService: pushRelayService,
        instanceLocalPreferencesBloc: instancePushSettingsLocalPreferenceBloc,
        pleromaPushService: pleromaPushService,
        currentInstance: currentInstance,
        fcmPushService: fcmPushService,
      )..disposeWith(this);

      await globalProviderService
          .asyncInitAndRegister<IPushSettingsBloc>(pushSettingsBloc);

      var pushPermissionCheckerBloc = PushPermissionCheckerBloc(
        fcmPushService: fcmPushService,
        askPushPermissionLocalPreferenceBloc:
            askPushPermissionLocalPreferenceBloc,
        pushSettingsBloc: pushSettingsBloc,
      )..disposeWith(this);

      await globalProviderService.asyncInitAndRegister<
          IPushPermissionCheckerBloc>(pushPermissionCheckerBloc);

      var notificationPushLoaderBloc = NotificationPushLoaderBloc(
        currentInstance: currentInstance,
        notificationsPushHandlerBloc: notificationsPushHandlerBloc,
        notificationRepository: notificationRepository,
        pleromaNotificationService: pleromaNotificationService,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        myAccountBloc: myAccountBloc,
        pleromaApiMyAccountService: pleromaMyAccountService,
        accountRepository: accountRepository,
        statusRepository: statusRepository,
        chatMessageRepository: chatMessageRepository,
        pleromaApiAuthStatusService: pleromaStatusService,
        pleromaApiChatService: pleromaChatService,
      )..disposeWith(this);

      await globalProviderService.asyncInitAndRegister<
          INotificationPushLoaderBloc>(notificationPushLoaderBloc);
    }

    if (!timelinesHomeTabStorageLocalPreferencesBloc
        .value.timelineIds.isNotEmpty) {
      var remoteLists = await pleromaListService.getLists();

      var timelines = [
        Timeline.home(
          label: null,
          id: 'home',
          isPossibleToDelete: false,
          settings: TimelineSettings.createDefaultHomeSettings(),
        ),
        Timeline.public(
          label: null,
          id: 'local',
          settings: TimelineSettings.createDefaultPublicSettings().copyWith(
            onlyLocal: true,
          ),
        ),
        Timeline.public(
          label: null,
          id: 'public',
          settings: TimelineSettings.createDefaultPublicSettings().copyWith(
            onlyLocal: false,
          ),
        ),
        if (remoteLists.isNotEmpty)
          ...remoteLists.map(
            (remoteList) => Timeline.customList(
              remoteList: remoteList,
              settings: TimelineSettings.createDefaultCustomListSettings(
                onlyInRemoteList: remoteList,
              ),
            ),
          ),
      ];
      var storage = TimelinesHomeTabStorage(
        timelineIds: timelines
            .map(
              (timeline) => timeline.id,
            )
            .toList(),
      );

      for (var timeline in timelines) {
        var timelineLocalPreferencesBloc = TimelineLocalPreferenceBloc.byId(
          preferencesService,
          userAtHost: currentInstance.userAtHost,
          timelineId: timeline.id,
          defaultPreferenceValue: null,
        );
        await timelineLocalPreferencesBloc.performAsyncInit();
        await timelineLocalPreferencesBloc.setValue(timeline);
        await timelineLocalPreferencesBloc.dispose();
      }

      await timelinesHomeTabStorageLocalPreferencesBloc.setValue(storage);
    }
    var instanceChatSettingsLocalPreferencesBloc =
        InstanceChatSettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstanceChatSettingsLocalPreferenceBloc>(
      instanceChatSettingsLocalPreferencesBloc,
    );

    var instanceMediaSettingsLocalPreferencesBloc =
        InstanceMediaSettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IInstanceMediaSettingsLocalPreferenceBloc>(
      instanceMediaSettingsLocalPreferencesBloc,
    );

    var instanceToastSettingsLocalPreferencesBloc =
        InstanceToastSettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstanceToastSettingsLocalPreferenceBloc>(
      instanceToastSettingsLocalPreferencesBloc,
    );

    var instancePostStatusSettingsLocalPreferencesBloc =
        InstancePostStatusSettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstancePostStatusSettingsLocalPreferenceBloc>(
      instancePostStatusSettingsLocalPreferencesBloc,
    );

    var instanceStatusSensitiveSettingsLocalPreferencesBloc =
        InstanceStatusSensitiveSettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IInstanceStatusSensitiveSettingsLocalPreferenceBloc>(
      instanceStatusSensitiveSettingsLocalPreferencesBloc,
    );

    var instanceWebSocketsSettingsLocalPreferencesBloc =
        InstanceWebSocketsSettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstanceWebSocketsSettingsLocalPreferenceBloc>(
      instanceWebSocketsSettingsLocalPreferencesBloc,
    );

    var instancePaginationSettingsLocalPreferencesBloc =
        InstancePaginationSettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstancePaginationSettingsLocalPreferenceBloc>(
      instancePaginationSettingsLocalPreferencesBloc,
    );

    var instanceFilesCacheSettingsLocalPreferencesBloc =
        InstanceFilesCacheSettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstanceFilesCacheSettingsLocalPreferenceBloc>(
      instanceFilesCacheSettingsLocalPreferencesBloc,
    );

    var instanceDatabaseCacheSettingsLocalPreferencesBloc =
        InstanceDatabaseCacheSettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IInstanceDatabaseCacheSettingsLocalPreferenceBloc>(
      instanceDatabaseCacheSettingsLocalPreferencesBloc,
    );

    var chatSettingsBloc = ChatSettingsBloc(
      instanceLocalPreferencesBloc: instanceChatSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalChatSettingsLocalPreferenceBloc>(),
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IChatSettingsBloc>(chatSettingsBloc);

    var mediaSettingsBloc = MediaSettingsBloc(
      instanceLocalPreferencesBloc: instanceMediaSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalMediaSettingsLocalPreferenceBloc>(),
    )..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IMediaSettingsBloc>(mediaSettingsBloc);

    var toastSettingsBloc = ToastSettingsBloc(
      instanceLocalPreferencesBloc: instanceToastSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalToastSettingsLocalPreferenceBloc>(),
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IToastSettingsBloc>(toastSettingsBloc);

    var postStatusSettingsBloc = PostStatusSettingsBloc(
      instanceLocalPreferencesBloc:
          instancePostStatusSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalPostStatusSettingsLocalPreferenceBloc>(),
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IPostStatusSettingsBloc>(postStatusSettingsBloc);

    var statusSensitiveSettingsBloc = StatusSensitiveSettingsBloc(
      instanceLocalPreferencesBloc:
          instanceStatusSensitiveSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc: appContextBloc
          .get<IGlobalStatusSensitiveSettingsLocalPreferenceBloc>(),
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IStatusSensitiveSettingsBloc>(statusSensitiveSettingsBloc);

    var webSocketsSettingsBloc = WebSocketsSettingsBloc(
      instanceLocalPreferencesBloc:
          instanceWebSocketsSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalWebSocketsSettingsLocalPreferenceBloc>(),
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IWebSocketsSettingsBloc>(webSocketsSettingsBloc);

    var paginationSettingsBloc = PaginationSettingsBloc(
      instanceLocalPreferencesBloc:
          instancePaginationSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalPaginationSettingsLocalPreferenceBloc>(),
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IPaginationSettingsBloc>(paginationSettingsBloc);

    var databaseCacheSettingsBloc = DatabaseCacheSettingsBloc(
      instanceLocalPreferencesBloc:
          instanceDatabaseCacheSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalDatabaseCacheSettingsLocalPreferenceBloc>(),
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IDatabaseCacheSettingsBloc>(databaseCacheSettingsBloc);

    var filesCacheSettingsBloc = FilesCacheSettingsBloc(
      instanceLocalPreferencesBloc:
          instanceFilesCacheSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalFilesCacheSettingsLocalPreferencesBloc>(),
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IFilesCacheSettingsBloc>(filesCacheSettingsBloc);

    var statusSensitiveDisplayTimeStorageBloc =
        StatusSensitiveDisplayTimeStorageBloc()..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IStatusSensitiveDisplayTimeStorageBloc>(
      statusSensitiveDisplayTimeStorageBloc,
    );

    var webSocketsService =
        WebSocketsService(configBloc: webSocketsSettingsBloc)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IWebSocketsService>(webSocketsService);

    var pleromaWebSocketsService = PleromaApiWebSocketsService(
      webSocketsService: webSocketsService,
      accessToken: currentInstance.token!.accessToken,
      baseUri: currentInstance.uri,
      connectionService: connectionService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IPleromaApiWebSocketsService>(
      pleromaWebSocketsService,
    );

    var instanceAnnouncementRepository = InstanceAnnouncementRepository(
      appDatabase: moorDatabaseService.appDatabase,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IInstanceAnnouncementRepository>(instanceAnnouncementRepository);

    var webSocketsHandlerManagerBloc = WebSocketsHandlerManagerBloc(
      pleromaWebSocketsService: pleromaWebSocketsService,
      conversationRepository: conversationRepository,
      notificationRepository: notificationRepository,
      instanceAnnouncementRepository: instanceAnnouncementRepository,
      statusRepository: statusRepository,
      chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
      conversationChatNewMessagesHandlerBloc:
          conversationChatNewMessagesHandlerBloc,
      myAccountBloc: myAccountBloc,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IWebSocketsHandlerManagerBloc>(webSocketsHandlerManagerBloc);

    var timelinesHomeTabStorageBloc = TimelinesHomeTabStorageBloc(
      preferences: timelinesHomeTabStorageLocalPreferencesBloc,
      authInstance: currentInstance,
      preferencesService: preferencesService,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        ITimelinesHomeTabStorageBloc>(timelinesHomeTabStorageBloc);

    var recentShareSelectAccountLocalPreferenceBloc =
        RecentShareSelectAccountLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IRecentShareSelectAccountLocalPreferenceBloc>(
      recentShareSelectAccountLocalPreferenceBloc,
    );

    var pleromaFilterService = PleromaApiFilterService(
      restApiAuthService: pleromaAuthRestService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IPleromaApiFilterService>(pleromaFilterService);

    var filterRepository = FilterRepository(
      appDatabase: moorDatabaseService.appDatabase,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IFilterRepository>(filterRepository);

    var filesCacheService = FilesCacheService(
      connectionService: connectionService,
      key: userAtHost,
      stalePeriod: filesCacheSettingsBloc.ageLimitType.toDurationOrNull(),
      maxNrOfCacheObjects:
          filesCacheSettingsBloc.sizeLimitCountType.toCountOrNull(),
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IFilesCacheService>(filesCacheService);

    var mediaAttachmentReuploadService = MediaAttachmentReuploadService(
      pleromaMediaAttachmentService: pleromaMediaAttachmentService,
      filesCacheService: filesCacheService,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IMediaAttachmentReuploadService>(mediaAttachmentReuploadService);

    await moorDatabaseService.clearByLimits(
      ageLimit: databaseCacheSettingsBloc.ageLimitType.toDurationOrNull(),
      entriesCountByTypeLimit:
          databaseCacheSettingsBloc.entriesCountByTypeLimitType.toCountOrNull(),
    );

    var instanceInstanceAnnouncementSettingsLocalPreferenceBloc =
        InstanceInstanceAnnouncementSettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstanceAnnouncementSettingsLocalPreferenceBloc>(
      instanceInstanceAnnouncementSettingsLocalPreferenceBloc,
    );
    await globalProviderService.asyncInitAndRegister<
        IInstanceInstanceAnnouncementSettingsLocalPreferenceBloc>(
      instanceInstanceAnnouncementSettingsLocalPreferenceBloc,
    );
  }
}
