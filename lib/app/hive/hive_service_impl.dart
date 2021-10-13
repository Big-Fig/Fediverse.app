import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:fedi/app/access/list/access_list_model.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/select/recent/recent_select_account_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi/app/emoji/picker/category/custom_image_url/emoji_picker_custom_image_url_category_model.dart';
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_model.dart';
import 'package:fedi/app/hive/hive_service.dart';
import 'package:fedi/app/hive/old/auth_instance_list_old_model.dart';
import 'package:fedi/app/hive/old/auth_instance_old_model.dart';
import 'package:fedi/app/hive/old/my_account_old_model.dart';
import 'package:fedi/app/hive/old/timeline_old_model.dart';
import 'package:fedi/app/hive/old/timeline_settings_old_model.dart';
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
import 'package:fedi/push/push_model.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:hive/hive.dart';
// ignore: implementation_imports
import 'package:hive/src/registry/nested_type_registry_adapter_impl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pleroma_api/pleroma_api.dart';
import 'package:unifedi_api/unifedi_api.dart';

// ignore_for_file: no-magic-number

class HiveService extends AsyncInitLoadingBloc implements IHiveService {
  @override
  Future internalAsyncInit() async {
    final directory = await getApplicationDocumentsDirectory();
    registerAdapters();
    Hive.init(directory.path);
  }

  // ignore: long-method
  static void registerAdapters() {
    //  UnifediApiFieldAdapter
    // todo: remove hack
    var adaptersRegistered = Hive.isAdapterRegistered(15);
    if (adaptersRegistered) {
      return;
    }

    Hive
      ..registerAdapter(PushSettingsAdapter())
      ..registerAdapter(NotificationsPushHandlerUnhandledListAdapter())
      ..registerAdapter(RecentSearchListAdapter())
      ..registerAdapter(NotificationsPushHandlerMessageAdapter())
      ..registerAdapter(PushMessageAdapter())
      ..registerAdapter(EmojiPickerCustomImageUrlCategoryItemsAdapter())
      ..registerAdapter(CustomEmojiPickerImageUrlItemAdapter())
      ..registerAdapter(EmojiPickerRecentCategoryItemsListAdapter())
      ..registerAdapter(CustomEmojiPickerCodeItemAdapter())
      ..registerAdapter(PushNotificationAdapter())
      ..registerAdapter(TimelinesHomeTabStorageAdapter())
      ..registerAdapter(LocalizationLocaleAdapter())
      ..registerAdapter(PostStatusSettingsAdapter())
      ..registerAdapter(StatusSensitiveSettingsAdapter())
      ..registerAdapter(ToastSettingsAdapter())
      ..registerAdapter(MediaSettingsAdapter())
      ..registerAdapter(WebSocketsSettingsAdapter())
      ..registerAdapter(LocalizationSettingsAdapter())
      ..registerAdapter(UiSettingsAdapter())
      ..registerAdapter(ChatSettingsAdapter())
      ..registerAdapter(RecentSelectAccountListAdapter())
      ..registerAdapter(AppAnalyticsDataAdapter())
      ..registerAdapter(PaginationSettingsAdapter())
      ..registerAdapter(DatabaseCacheSettingsAdapter())
      ..registerAdapter(FilesCacheSettingsAdapter())
      ..registerAdapter(InstanceAnnouncementSettingsAdapter())
      ..registerAdapter(CrashReportingSettingsAdapter())
      ..registerAdapter(PushRelaySettingsAdapter());

    // updated ids
    // ignore: cascade_invocations
    Hive
      ..registerAdapter(UnifediApiMyAccountWrapperAdapter())
      ..registerAdapter(UnifediApiAccessListAdapter())
      ..registerAdapter(TimelineAdapter())
      ..registerAdapter(TimelineSettingsAdapter());
    // registered inside unifedi api package
    // ..registerAdapter(UnifediApiAccessAdapter())

    var fediverseAdapter = NestedTypeRegistryAdapterImpl(typeId: 150 + 0);
    FediverseHiveHelper.registerFediverseAdapters(fediverseAdapter);
    Hive.registerNestedTypeRegistryAdapter(fediverseAdapter);

    var mastodonAdapter = NestedTypeRegistryAdapterImpl(typeId: 150 + 1);
    UnifediHiveHelper.registerMastodonAdapters(mastodonAdapter);
    Hive.registerNestedTypeRegistryAdapter(mastodonAdapter);

    var pleromaAdapter = NestedTypeRegistryAdapterImpl(typeId: 150 + 2);
    UnifediHiveHelper.registerPleromaAdapters(pleromaAdapter);
    Hive.registerNestedTypeRegistryAdapter(pleromaAdapter);

    var unifediAdapter = NestedTypeRegistryAdapterImpl(typeId: 150 + 3);
    UnifediHiveHelper.registerUnifediAdapters(unifediAdapter);
    Hive.registerNestedTypeRegistryAdapter(unifediAdapter);

    var unifediMastodonAdapter = NestedTypeRegistryAdapterImpl(typeId: 150 + 4);
    UnifediHiveHelper.registerUnifediMastodonAdapters(unifediMastodonAdapter);
    Hive.registerNestedTypeRegistryAdapter(unifediMastodonAdapter);

    var unifediPleromaAdapter = NestedTypeRegistryAdapterImpl(typeId: 150 + 5);
    UnifediHiveHelper.registerUnifediPleromaAdapters(unifediPleromaAdapter);
    Hive.registerNestedTypeRegistryAdapter(unifediPleromaAdapter);

    registerOldAdapters();
  }

  static void registerOldAdapters() {
    _registerOverrideAdapter(AuthInstanceListOldAdapter(), 17);
    _registerOverrideAdapter(AuthInstanceOldAdapter(), 18);
    _registerOverrideAdapter(TimelineOldAdapter(), 46);
    _registerOverrideAdapter(TimelineSettingsOldAdapter(), 47);
    _registerOverrideAdapter(PleromaMyAccountWrapperOldAdapter(), 21);
    //
    // replaced with new adapter
    // _registerOverrideAdapter(PleromaApiPushMessageBodyAdapter())

    _registerOverrideAdapter(PleromaApiFieldAdapter(), 5);
    _registerOverrideAdapter(PleromaApiEmojiAdapter(), 6);
    _registerOverrideAdapter(PleromaApiMyAccountPleromaPartAdapter(), 8);
    _registerOverrideAdapter(
      PleromaApiMyAccountNotificationsSettingsAdapter(),
      9,
    );
    _registerOverrideAdapter(PleromaApiAccountRelationshipAdapter(), 10);
    _registerOverrideAdapter(PleromaApiMyAccountSourceAdapter(), 11);
    _registerOverrideAdapter(PleromaApiMyAccountSourcePleromaPartAdapter(), 12);
    _registerOverrideAdapter(PleromaApiOAuthTokenAdapter(), 19);
    _registerOverrideAdapter(PleromaApiClientApplicationAdapter(), 20);
    _registerOverrideAdapter(PleromaApiMyAccountAdapter(), 22);
    _registerOverrideAdapter(PleromaApiInstancePleromaPartAdapter(), 26);
    _registerOverrideAdapter(PleromaApiInstanceAdapter(), 27);
    _registerOverrideAdapter(PleromaApiInstanceMetadataAdapter(), 28);
    _registerOverrideAdapter(PleromaApiInstanceStatsAdapter(), 29);
    _registerOverrideAdapter(PleromaApiInstanceUrlsAdapter(), 30);
    _registerOverrideAdapter(PleromaApiInstancePollLimitsAdapter(), 31);
    _registerOverrideAdapter(PleromaApiAccountAdapter(), 32);
    _registerOverrideAdapter(
      PleromaApiInstanceFieldLimitsAdapter(),
      40,
    );
    _registerOverrideAdapter(PleromaApiTagAdapter(), 42);
    _registerOverrideAdapter(PleromaApiAccountPleromaPartAdapter(), 43);
    _registerOverrideAdapter(PleromaApiCustomEmojiAdapter(), 44);
    _registerOverrideAdapter(PleromaApiTagHistoryItemAdapter(), 45);
    _registerOverrideAdapter(PleromaApiListAdapter(), 48);
    _registerOverrideAdapter(
      PleromaApiInstanceFederationAdapter(),
      67,
    );
    _registerOverrideAdapter(
      PleromaApiInstanceFederationMfrObjectAgeAdapter(),
      66,
    );
    _registerOverrideAdapter(PleromaApiFilterAdapter(), 68);
    _registerOverrideAdapter(PleromaApiFrontendConfigurationsAdapter(), 72);
    _registerOverrideAdapter(
      PleromaApiFrontendConfigurationsMastoFeAdapter(),
      73,
    );
    _registerOverrideAdapter(
      PleromaApiFrontendConfigurationsPleromaFeAdapter(),
      74,
    );
    _registerOverrideAdapter(
      PleromaApiFrontendConfigurationsSoapboxFeAdapter(),
      75,
    );
  }

  static void _registerOverrideAdapter<T>(TypeAdapter<T> adapter, int id) {
    Hive.registerAdapter(
      OverrideIdAdapter(
        id,
        adapter,
      ),
    );
  }
}
