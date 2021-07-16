import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/select/recent/recent_select_account_model.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi/app/emoji/picker/category/custom_image_url/emoji_picker_custom_image_url_category_model.dart';
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_model.dart';
import 'package:fedi/app/hive/hive_service.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi/app/localization/settings/localization_settings_model.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:fedi/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/push/settings/relay/push_relay_settings_model.dart';
import 'package:fedi/app/search/recent/recent_search_model.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/emoji_picker/item/code/custom_emoji_picker_code_item_model.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/mastodon/api/instance/mastodon_api_instance_model.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/field/pleroma_api_field_model.dart';
import 'package:fedi/pleroma/api/filter/pleroma_api_filter_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_model.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_model.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';
import 'package:fedi/pleroma/api/tag/history/pleroma_api_tag_history_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:fedi/push/push_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService extends AsyncInitLoadingBloc implements IHiveService {
  @override
  Future internalAsyncInit() async {
    final directory = await getApplicationDocumentsDirectory();
    registerAdapters();
    Hive.init(directory.path);
  }

  // ignore: long-method
  static void registerAdapters() {
    //  PleromaApiFieldAdapter
    var adaptersRegistered = Hive.isAdapterRegistered(5);
    if (adaptersRegistered) {
      return;
    }
    Hive.registerAdapter(PleromaApiFieldAdapter());
    Hive.registerAdapter(PleromaApiEmojiAdapter());
    Hive.registerAdapter(PleromaApiMyAccountPleromaPartAdapter());
    Hive.registerAdapter(
      PleromaApiMyAccountPleromaPartNotificationsSettingsAdapter(),
    );
    Hive.registerAdapter(PleromaApiAccountRelationshipAdapter());
    Hive.registerAdapter(PleromaApiMyAccountSourceAdapter());
    Hive.registerAdapter(PleromaApiMyAccountSourcePleromaPartAdapter());
    Hive.registerAdapter(PushSettingsAdapter());
    Hive.registerAdapter(AuthInstanceListAdapter());
    Hive.registerAdapter(AuthInstanceAdapter());
    Hive.registerAdapter(PleromaApiOAuthTokenAdapter());
    Hive.registerAdapter(PleromaApiClientApplicationAdapter());
    Hive.registerAdapter(PleromaMyAccountWrapperAdapter());
    Hive.registerAdapter(PleromaApiMyAccountAdapter());
    Hive.registerAdapter(NotificationsPushHandlerUnhandledListAdapter());
    Hive.registerAdapter(PleromaApiPushMessageBodyAdapter());
    Hive.registerAdapter(PleromaApiInstancePleromaPartAdapter());
    Hive.registerAdapter(PleromaApiInstanceAdapter());
    Hive.registerAdapter(PleromaApiInstancePleromaPartMetadataAdapter());
    Hive.registerAdapter(MastodonApiInstanceStatsAdapter());
    Hive.registerAdapter(MastodonApiUrlsAdapter());
    Hive.registerAdapter(PleromaApiInstancePollLimitsAdapter());
    Hive.registerAdapter(PleromaApiAccountAdapter());
    Hive.registerAdapter(RecentSearchListAdapter());
    Hive.registerAdapter(NotificationsPushHandlerMessageAdapter());
    Hive.registerAdapter(PushMessageAdapter());
    Hive.registerAdapter(EmojiPickerCustomImageUrlCategoryItemsAdapter());
    Hive.registerAdapter(CustomEmojiPickerImageUrlItemAdapter());
    Hive.registerAdapter(EmojiPickerRecentCategoryItemsListAdapter());
    Hive.registerAdapter(CustomEmojiPickerCodeItemAdapter());
    Hive.registerAdapter(
      PleromaApiInstancePleromaPartMetadataFieldLimitsAdapter(),
    );
    Hive.registerAdapter(PushNotificationAdapter());
    Hive.registerAdapter(PleromaApiTagAdapter());
    Hive.registerAdapter(PleromaApiAccountPleromaPartAdapter());
    Hive.registerAdapter(PleromaApiCustomEmojiAdapter());
    Hive.registerAdapter(PleromaApiTagHistoryAdapter());
    Hive.registerAdapter(TimelineAdapter());
    Hive.registerAdapter(TimelineSettingsAdapter());
    Hive.registerAdapter(PleromaApiListAdapter());
    Hive.registerAdapter(TimelinesHomeTabStorageAdapter());
    Hive.registerAdapter(LocalizationLocaleAdapter());
    Hive.registerAdapter(PostStatusSettingsAdapter());
    Hive.registerAdapter(StatusSensitiveSettingsAdapter());
    Hive.registerAdapter(ToastSettingsAdapter());
    Hive.registerAdapter(MediaSettingsAdapter());
    Hive.registerAdapter(WebSocketsSettingsAdapter());
    Hive.registerAdapter(LocalizationSettingsAdapter());
    Hive.registerAdapter(UiSettingsAdapter());
    Hive.registerAdapter(ChatSettingsAdapter());
    Hive.registerAdapter(RecentSelectAccountListAdapter());
    Hive.registerAdapter(AppAnalyticsDataAdapter());
    Hive.registerAdapter(PaginationSettingsAdapter());
    Hive.registerAdapter(DatabaseCacheSettingsAdapter());
    Hive.registerAdapter(FilesCacheSettingsAdapter());
    Hive.registerAdapter(
      PleromaApiInstancePleromaPartMetadataFederationAdapter(),
    );
    Hive.registerAdapter(
      PleromaApiInstancePleromaPartMetadataFederationMfrObjectAgeAdapter(),
    );
    Hive.registerAdapter(PleromaApiFilterAdapter());
    Hive.registerAdapter(InstanceAnnouncementSettingsAdapter());
    Hive.registerAdapter(CrashReportingSettingsAdapter());
    Hive.registerAdapter(PushRelaySettingsAdapter());
  }
}
