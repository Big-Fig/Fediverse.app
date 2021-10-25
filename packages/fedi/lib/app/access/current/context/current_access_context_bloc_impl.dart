import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/current/context/current_access_context_bloc.dart';
import 'package:fedi/app/access/local_preferences/access_local_preference_bloc.dart';
import 'package:fedi/app/access/local_preferences/access_local_preference_bloc_impl.dart';
import 'package:fedi/app/access/local_preferences_access_bloc_impl.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/app_model.dart';
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
import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc_impl.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc.dart';
import 'package:fedi/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preference_bloc.dart';
import 'package:fedi/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/current/unifedi_chat_current_bloc.dart';
import 'package:fedi/app/chat/unifedi/current/unifedi_chat_current_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/message/repository/unifedi_chat_message_repository.dart';
import 'package:fedi/app/chat/unifedi/message/repository/unifedi_chat_message_repository_impl.dart';
import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository_impl.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_new_messages_handler_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/with_last_message/repository/unifedi_chat_with_last_message_repository.dart';
import 'package:fedi/app/chat/unifedi/with_last_message/repository/unifedi_chat_with_last_message_repository_impl.dart';
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
import 'package:fedi/app/instance/frontend_configurations/instance_frontend_configurations_bloc.dart';
import 'package:fedi/app/instance/frontend_configurations/instance_frontend_configurations_bloc_impl.dart';
import 'package:fedi/app/instance/frontend_configurations/local_preferences/instance_frontend_configurations_local_preference_bloc.dart';
import 'package:fedi/app/instance/frontend_configurations/local_preferences/instance_frontend_configurations_local_preference_bloc_impl.dart';
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
import 'package:fedi/app/push/settings/filter/push_filter_settings_bloc.dart';
import 'package:fedi/app/push/settings/filter/push_filter_settings_bloc_impl.dart';
import 'package:fedi/app/push/settings/local_preferences/instance/instance_push_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preference_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc_impl.dart';
import 'package:fedi/app/push/settings/relay/local_preferences/instance/instance_push_relay_settings_local_preference_bloc.dart';
import 'package:fedi/app/push/settings/relay/local_preferences/instance/instance_push_relay_settings_local_preference_bloc_impl.dart';
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
import 'package:fedi/provider/provider_context_bloc_impl.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

// ignore_for_file: avoid-ignoring-return-values

var _logger = Logger('current_access_context_bloc_imp.dart');

class CurrentUnifediApiAccessContextBloc extends ProviderContextBloc
    implements ICurrentUnifediApiAccessContextBloc {
  final UnifediApiAccess currentInstance;
  final IAppContextBloc appContextBloc;

  bool get isPleromaInstance => currentInstance.isPleroma;

  CurrentUnifediApiAccessContextBloc({
    required this.currentInstance,
    required this.appContextBloc,
  });

  @override
  // todo: refactor
  // ignore: long-method
  Future<void> internalAsyncInit() async {
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

    await moorDatabaseService.performAsyncInit();

    if (configService.appLaunchType == AppLaunchType.mock) {
      await moorDatabaseService.clearAll();
    }

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

    var chatMessageRepository = UnifediChatMessageRepository(
      appDatabase: moorDatabaseService.appDatabase,
      accountRepository: accountRepository,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IUnifediChatMessageRepository>(chatMessageRepository);

    var chatRepository = UnifediChatRepository(
      appDatabase: moorDatabaseService.appDatabase,
      accountRepository: accountRepository,
      chatMessageRepository: chatMessageRepository,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IUnifediChatRepository>(chatRepository);

    var notificationRepository = NotificationRepository(
      appDatabase: moorDatabaseService.appDatabase,
      accountRepository: accountRepository,
      statusRepository: statusRepository,
      chatMessageRepository: chatMessageRepository,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<INotificationRepository>(notificationRepository);

    var unifediChatWithLastMessageRepository =
        UnifediChatWithLastMessageRepository(
      chatRepository: chatRepository,
      chatMessageRepository: chatMessageRepository,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IUnifediChatWithLastMessageRepository>(
      unifediChatWithLastMessageRepository,
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

    var unifediApiAccessLocalPreferenceBloc =
        UnifediApiAccessLocalPreferenceBloc(
      preferencesService: preferencesService,
      userAtHost: currentInstance.userAtHost,
    );

    await unifediApiAccessLocalPreferenceBloc.performAsyncInit();
    await globalProviderService
        .asyncInitAndRegister<IUnifediApiAccessLocalPreferenceBloc>(
      unifediApiAccessLocalPreferenceBloc,
    );

    var localPreferencesUnifediApiAccessBloc =
        LocalPreferencesUnifediApiAccessBloc(
      accessLocalPreferenceBloc: unifediApiAccessLocalPreferenceBloc,
    );

    await globalProviderService.asyncInitAndRegister<IUnifediApiAccessBloc>(
      localPreferencesUnifediApiAccessBloc,
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

    var webSocketsSettingsBloc = WebSocketsSettingsBloc(
      instanceLocalPreferencesBloc:
          instanceWebSocketsSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          appContextBloc.get<IGlobalWebSocketsSettingsLocalPreferenceBloc>(),
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IWebSocketsSettingsBloc>(webSocketsSettingsBloc);

    var unifediApiManager =
        currentInstance.info!.typeAsUnifediApi.createApiManager(
      apiAccessBloc: localPreferencesUnifediApiAccessBloc,
      computeImpl: null,
      webSocketsModeSettingsBloc: webSocketsSettingsBloc,
    );
    await globalProviderService
        .asyncInitAndRegister<IUnifediApiManager>(unifediApiManager);

    //
    // var unifediAuthRestService = UnifediApiAuthRestService(
    //   restService: restService,
    //   connectionService: connectionService,
    //   accessToken: currentInstance.token!.accessToken,
    //   isPleroma: isPleromaInstance,
    // )..disposeWith(this);

    var unifediApiAnnouncementsService =
        unifediApiManager.createAnnouncementService()..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IUnifediApiAnnouncementService>(unifediApiAnnouncementsService);

    var unifediApiMediaAttachmentService =
        unifediApiManager.createMediaAttachmentService()..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IUnifediApiMediaAttachmentService>(unifediApiMediaAttachmentService);

    await globalProviderService.asyncInitAndRegister<IUnifediApiListService>(
      unifediApiManager.createListService()..disposeWith(this),
    );

    await globalProviderService
        .asyncInitAndRegister<IUnifediApiMyAccountService>(
      unifediApiManager.createMyAccountService()..disposeWith(this),
    );

    await globalProviderService.asyncInitAndRegister<IUnifediApiAccountService>(
      unifediApiManager.createAccountService()..disposeWith(this),
    );

    await globalProviderService
        .asyncInitAndRegister<IUnifediApiTimelineService>(
      unifediApiManager.createTimelineService()..disposeWith(this),
    );

    await globalProviderService.asyncInitAndRegister<IUnifediApiStatusService>(
      unifediApiManager.createStatusService()..disposeWith(this),
    );

    await globalProviderService
        .asyncInitAndRegister<IUnifediApiConversationService>(
      unifediApiManager.createConversationService()..disposeWith(this),
    );

    await globalProviderService.asyncInitAndRegister<IUnifediApiChatService>(
      unifediApiManager.createChatService()..disposeWith(this),
    );

    await globalProviderService
        .asyncInitAndRegister<IUnifediApiInstanceService>(
      unifediApiManager.createInstanceService()..disposeWith(this),
    );

    await globalProviderService.asyncInitAndRegister<IUnifediApiSearchService>(
      unifediApiManager.createSearchService()..disposeWith(this),
    );

    await globalProviderService
        .asyncInitAndRegister<IUnifediApiNotificationService>(
      unifediApiManager.createNotificationService()..disposeWith(this),
    );

    await globalProviderService.asyncInitAndRegister<IUnifediApiMarkerService>(
      unifediApiManager.createMarkerService()..disposeWith(this),
    );

    await globalProviderService.asyncInitAndRegister<IUnifediApiPollService>(
      unifediApiManager.createPollService()..disposeWith(this),
    );

    var instanceFrontendConfigurationsLocalPreferenceBloc =
        InstanceFrontendConfigurationsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IInstanceFrontendConfigurationsLocalPreferenceBloc>(
      instanceFrontendConfigurationsLocalPreferenceBloc,
    );

    var instanceFrontendConfigurationsBloc = InstanceFrontendConfigurationsBloc(
      unifediApiInstanceService:
          globalProviderService.get<IUnifediApiInstanceService>(),
      instanceFrontendConfigurationsLocalPreferenceBloc:
          instanceFrontendConfigurationsLocalPreferenceBloc,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstanceFrontendConfigurationsBloc>(
      instanceFrontendConfigurationsBloc,
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

    var instancePushRelaySettingsLocalPreferenceBloc =
        InstancePushRelaySettingsLocalPreferenceBloc(
      preferencesService,
      userAtHost: userAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstancePushRelaySettingsLocalPreferenceBloc>(
      instancePushRelaySettingsLocalPreferenceBloc,
    );

    var myAccountBloc = MyAccountBloc(
      apiMyAccountService:
          globalProviderService.get<IUnifediApiMyAccountService>(),
      myAccountLocalPreferenceBloc: myAccountLocalPreferenceBloc,
      accountRepository: accountRepository,
      instance: currentInstance,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IMyAccountBloc>(myAccountBloc);

    var currentUnifediChatBloc = UnifediChatCurrentBloc()..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IUnifediChatCurrentBloc>(currentUnifediChatBloc);

    var currentConversationChatBloc = ConversationChatCurrentBloc()
      ..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IConversationChatCurrentBloc>(currentConversationChatBloc);

    var chatNewMessagesHandlerBloc = UnifediChatNewMessagesHandlerBloc(
      chatRepository: chatRepository,
      currentChatBloc: currentUnifediChatBloc,
      unifediApiChatService:
          globalProviderService.get<IUnifediApiChatService>(),
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IUnifediChatNewMessagesHandlerBloc>(chatNewMessagesHandlerBloc);

    var conversationChatNewMessagesHandlerBloc =
        ConversationChatNewMessagesHandlerBloc(
      conversationRepository: conversationRepository,
      currentChatBloc: currentConversationChatBloc,
      conversationChatService:
          globalProviderService.get<IUnifediApiConversationService>(),
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

      var unifediPushService = unifediApiManager.createPushSubscriptionService()
        ..disposeWith(this);
      await globalProviderService.asyncInitAndRegister<
          IUnifediApiPushSubscriptionService>(unifediPushService);

      var pushSettingsBloc = PushSettingsBloc(
        connectionService: connectionService,
        pushSubscriptionKeysP256dh: configService.pushSubscriptionKeysP256dh!,
        pushSubscriptionKeysAuth: configService.pushSubscriptionKeysAuth!,
        pushRelayService: pushRelayService,
        instancePushSettingsLocalPreferenceBloc:
            instancePushSettingsLocalPreferenceBloc,
        instancePushRelaySettingsLocalPreferenceBloc:
            instancePushRelaySettingsLocalPreferenceBloc,
        unifediApiPushSubscriptionService: unifediPushService,
        currentInstance: currentInstance,
        fcmPushService: fcmPushService,
      )..disposeWith(this);

      // check is push config changed after app update and resubscribes in the background
      // ignore: unawaited_futures, cascade_invocations
      pushSettingsBloc.reSubscribeIfNeeded();

      await globalProviderService
          .asyncInitAndRegister<IPushSettingsBloc>(pushSettingsBloc);

      var pushFilterSettingsBloc = PushFilterSettingsBloc(
        myAccountBloc: myAccountBloc,
        unifediApiMyAccountService:
            globalProviderService.get<IUnifediApiMyAccountService>(),
        currentInstance: currentInstance,
      )..disposeWith(this);

      await globalProviderService.asyncInitAndRegister<IPushFilterSettingsBloc>(
        pushFilterSettingsBloc,
      );

      var pushPermissionCheckerBloc = PushPermissionCheckerBloc(
        fcmPushService: fcmPushService,
        askPushPermissionLocalPreferenceBloc:
            askPushPermissionLocalPreferenceBloc,
        pushSettingsBloc: pushSettingsBloc,
        configService: configService,
      )..disposeWith(this);

      await globalProviderService.asyncInitAndRegister<
          IPushPermissionCheckerBloc>(pushPermissionCheckerBloc);

      var notificationPushLoaderBloc = NotificationPushLoaderBloc(
        currentInstance: currentInstance,
        notificationsPushHandlerBloc: notificationsPushHandlerBloc,
        notificationRepository: notificationRepository,
        unifediNotificationService:
            globalProviderService.get<IUnifediApiNotificationService>(),
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        myAccountBloc: myAccountBloc,
        unifediApiMyAccountService:
            globalProviderService.get<IUnifediApiMyAccountService>(),
        accountRepository: accountRepository,
        statusRepository: statusRepository,
        chatMessageRepository: chatMessageRepository,
        unifediApiStatusService:
            globalProviderService.get<IUnifediApiStatusService>(),
        unifediApiChatService:
            globalProviderService.get<IUnifediApiChatService>(),
      )..disposeWith(this);

      await globalProviderService.asyncInitAndRegister<
          INotificationPushLoaderBloc>(notificationPushLoaderBloc);
    }

    if (!timelinesHomeTabStorageLocalPreferencesBloc
        .value.timelineIds.isNotEmpty) {
      var unifediListService =
          globalProviderService.get<IUnifediApiListService>();
      var remoteLists = await unifediListService.getLists();

      var timelines = <Timeline>[
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

      for (final timeline in timelines) {
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
    var unifediApiWebSocketsService =
        unifediApiManager.createWebSocketsService();

    await globalProviderService
        .asyncInitAndRegister<IUnifediApiWebSocketsService>(
      unifediApiWebSocketsService,
    );

    //
    // var webSocketsService =
    //     WebSocketsService(configBloc: webSocketsSettingsBloc)
    //       ..disposeWith(this);
    // await globalProviderService
    //     .asyncInitAndRegister<IWebSocketsService>(webSocketsService);
    //
    // var unifediApiWebSocketsService = UnifediApiWebSocketsService(
    //   webSocketsService: webSocketsService,
    //   accessToken: currentInstance.token!.accessToken,
    //   baseUri: currentInstance.uri,
    //   connectionService: connectionService,
    // )..disposeWith(this);

    var instanceAnnouncementRepository = InstanceAnnouncementRepository(
      appDatabase: moorDatabaseService.appDatabase,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IInstanceAnnouncementRepository>(instanceAnnouncementRepository);

    var webSocketsHandlerManagerBloc = WebSocketsHandlerManagerBloc(
      unifediApiWebSocketsService: unifediApiWebSocketsService,
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

    var unifediApiFilterService = unifediApiManager.createFilterService()
      ..disposeWith(
        this,
      );

    await globalProviderService.asyncInitAndRegister<IUnifediApiFilterService>(
      unifediApiFilterService,
    );

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
      unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
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
