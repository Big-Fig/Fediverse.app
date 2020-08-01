import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/my/settings'
    '/my_account_settings_model'
    '.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_model.dart';
import 'package:fedi/app/hive/hive_service.dart';
import 'package:fedi/app/push/handler/push_handler_model.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_model.dart';
import 'package:fedi/app/push/subscription_settings/local_preferences/push_subscription_settings_local_preferences_model.dart';
import 'package:fedi/app/search/recent/recent_search_model.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/mastodon/instance/mastodon_instance_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/push/push_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService extends AsyncInitLoadingBloc implements IHiveService {
  @override
  Future internalAsyncInit() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.registerAdapter(PleromaFieldAdapter(), 37);
    Hive.registerAdapter(PleromaEmojiAdapter(), 38);
    Hive.registerAdapter(PleromaMyAccountPleromaPartAdapter(), 40);
    Hive.registerAdapter(
        PleromaMyAccountPleromaPartNotificationsSettingsAdapter(), 41);
    Hive.registerAdapter(PleromaAccountRelationshipAdapter(), 42);
    Hive.registerAdapter(PleromaMyAccountSourceAdapter(), 43);
    Hive.registerAdapter(PleromaMyAccountSourcePleromaPartAdapter(), 44);
    Hive.registerAdapter(TimelineSettingsLocalPreferencesAdapter(), 46);
    Hive.registerAdapter(PushSubscriptionSettingsLocalPreferencesAdapter(), 47);

    Hive.registerAdapter(AuthInstanceListAdapter(), 49);
    Hive.registerAdapter(AuthInstanceAdapter(), 50);
    Hive.registerAdapter(PleromaOAuthTokenAdapter(), 51);
    Hive.registerAdapter(PleromaClientApplicationAdapter(), 52);
    Hive.registerAdapter(MyAccountRemoteWrapperAdapter(), 53);
    Hive.registerAdapter(PleromaMyAccountAdapter(), 54);
    Hive.registerAdapter(PushHandlerUnhandledListAdapter(), 55);
    Hive.registerAdapter(PleromaPushMessageBodyAdapter(), 56);
    Hive.registerAdapter(MyAccountSettingsAdapter(), 57);
    Hive.registerAdapter(PleromaInstancePleromaPartAdapter(), 58);
    Hive.registerAdapter(PleromaInstanceAdapter(), 59);
    Hive.registerAdapter(PleromaInstancePleromaPartMetadataAdapter(), 60);
    Hive.registerAdapter(MastodonInstanceStatsAdapter(), 61);
    Hive.registerAdapter(MastodonUrlsAdapter(), 62);
    Hive.registerAdapter(PleromaInstancePollLimitsAdapter(), 63);
    Hive.registerAdapter(PleromaAccountAdapter(), 64);
    Hive.registerAdapter(RecentSearchListAdapter(), 65);
    Hive.registerAdapter(PushHandlerMessageAdapter(), 66);
    Hive.registerAdapter(PushMessageAdapter(), 67);

    Hive.init(directory.path);
  }
}
