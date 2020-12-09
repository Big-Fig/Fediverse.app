import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/select/recent/recent_select_account_model.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_model.dart';
import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/emoji/picker/category/custom/emoji_picker_custom_image_url_category_model.dart';
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_model.dart';
import 'package:fedi/app/hive/hive_service.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/localization/settings/localization_settings_model.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/app/push/handler/push_handler_model.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_model.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
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
import 'package:fedi/mastodon/instance/mastodon_instance_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/pleroma/history/pleroma_history_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
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

  static void registerAdapters() {
    Hive.registerAdapter(PleromaFieldAdapter());
    Hive.registerAdapter(PleromaEmojiAdapter());
    Hive.registerAdapter(PleromaMyAccountPleromaPartAdapter());
    Hive.registerAdapter(
        PleromaMyAccountPleromaPartNotificationsSettingsAdapter());
    Hive.registerAdapter(PleromaAccountRelationshipAdapter());
    Hive.registerAdapter(PleromaMyAccountSourceAdapter());
    Hive.registerAdapter(PleromaMyAccountSourcePleromaPartAdapter());
    Hive.registerAdapter(PushSettingsAdapter());
    Hive.registerAdapter(AuthInstanceListAdapter());
    Hive.registerAdapter(AuthInstanceAdapter());
    Hive.registerAdapter(PleromaOAuthTokenAdapter());
    Hive.registerAdapter(PleromaClientApplicationAdapter());
    Hive.registerAdapter(MyAccountRemoteWrapperAdapter());
    Hive.registerAdapter(PleromaMyAccountAdapter());
    Hive.registerAdapter(PushHandlerUnhandledListAdapter());
    Hive.registerAdapter(PleromaPushMessageBodyAdapter());
    Hive.registerAdapter(PleromaInstancePleromaPartAdapter());
    Hive.registerAdapter(PleromaInstanceAdapter());
    Hive.registerAdapter(PleromaInstancePleromaPartMetadataAdapter());
    Hive.registerAdapter(MastodonInstanceStatsAdapter());
    Hive.registerAdapter(MastodonUrlsAdapter());
    Hive.registerAdapter(PleromaInstancePollLimitsAdapter());
    Hive.registerAdapter(PleromaAccountAdapter());
    Hive.registerAdapter(RecentSearchListAdapter());
    Hive.registerAdapter(PushHandlerMessageAdapter());
    Hive.registerAdapter(PushMessageAdapter());
    Hive.registerAdapter(EmojiPickerCustomImageUrlCategoryItemsAdapter());
    Hive.registerAdapter(CustomEmojiPickerImageUrlItemAdapter());
    Hive.registerAdapter(EmojiPickerRecentCategoryItemsListAdapter());
    Hive.registerAdapter(CustomEmojiPickerCodeItemAdapter());
    Hive.registerAdapter(
        PleromaInstancePleromaPartMetadataFieldLimitsAdapter());
    Hive.registerAdapter(PushNotificationAdapter());
    Hive.registerAdapter(PleromaTagAdapter());
    Hive.registerAdapter(PleromaAccountPleromaPartAdapter());
    Hive.registerAdapter(PleromaCustomEmojiAdapter());
    Hive.registerAdapter(PleromaHistoryAdapter());
    Hive.registerAdapter(TimelineAdapter());
    Hive.registerAdapter(TimelineSettingsAdapter());
    Hive.registerAdapter(PleromaListAdapter());
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
  }
}
