import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/host/access_token/auth_host_access_token_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/host/application/auth_host_application_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/local_preferences/current_auth_instance_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/instance/list/local_preferences/auth_instance_list_local_preference_bloc_impl.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/emoji/picker/category/custom_image_url/local_preferences/emoji_picker_custom_image_url_category_local_preference_bloc_impl.dart';
import 'package:fedi/app/emoji/picker/category/recent/local_preferences/emoji_picker_recent_category_local_preference_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/local_preferences/timelines_home_tab_storage_local_preference_bloc_impl.dart';
import 'package:fedi/app/localization/settings/local_preferences/global/global_localization_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/media/settings/local_preferences/global/global_media_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/media/settings/local_preferences/instance/instance_media_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/handler/unhandled/local_preferences/push_handler_unhandled_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/permission/ask/local_preferences/ask_push_permission_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/settings/local_preferences/instance/instance_push_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/search/recent/local_preferences/recent_search_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/local_preferences/instance/instance_post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc_impl.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/ui/settings/local_preference/global/global_ui_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/instance/instance_web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/local_preferences_service_migration_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service_migration_bloc_impl.dart';
import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc_impl.dart';

class FediLocalPreferencesServiceMigrationBloc
    extends LocalPreferencesServiceMigrationBloc {
  FediLocalPreferencesServiceMigrationBloc({
    required ILocalPreferencesService inputService,
    required ILocalPreferencesService outputService,
  }) : super(
          inputService: inputService,
          outputService: outputService,
        );

  @override
  Future<List<LocalPreferencesBlocCreator>>
      calculateAllMigrationLocalPreferencesBlocCreators(
    ILocalPreferencesService inputService,
  ) async {
    var instanceListLocalPreferenceBloc =
        AuthInstanceListLocalPreferenceBloc(inputService);
    await instanceListLocalPreferenceBloc.performAsyncInit();
    var authInstanceList = instanceListLocalPreferenceBloc.value!;

    var authInstancesBlocCreators = <LocalPreferencesBlocCreator>[];

    for (var authInstance in authInstanceList.instances) {
      var host = authInstance.urlHost;
      var userAtHost = authInstance.userAtHost;

      authInstancesBlocCreators.addAll([
        (lps) => AuthHostAccessTokenLocalPreferenceBloc(lps, host: host),
        (lps) => AuthHostApplicationLocalPreferenceBloc(lps, host: host),
      ]);
      authInstancesBlocCreators
          .addAll(calculateUserAtHostLocalPreferencesBlocCreators(userAtHost));

      var timelinesHomeTabStorageLocalPreferencesBloc =
          TimelinesHomeTabStorageLocalPreferenceBloc(
        inputService,
        userAtHost: userAtHost,
      );
      await timelinesHomeTabStorageLocalPreferencesBloc.performAsyncInit();

      authInstancesBlocCreators.addAll(
        timelinesHomeTabStorageLocalPreferencesBloc.value.timelineIds.map(
              (timelineId) => (lps) => TimelineLocalPreferenceBloc.byId(
                    lps,
                    userAtHost: userAtHost,
                    timelineId: timelineId,
                    defaultPreferenceValue: null,
                  ),
            ),
      );

      await timelinesHomeTabStorageLocalPreferencesBloc.dispose();
    }

    return [
      (lps) => AuthInstanceListLocalPreferenceBloc(lps),
      (lps) => CurrentAuthInstanceLocalPreferenceBloc(lps),
      (lps) => PushHandlerUnhandledLocalPreferenceBloc(lps),
      (lps) => AuthOAuthLastLaunchedHostToLoginLocalPreferenceBloc(lps),
      (lps) => GlobalChatSettingsLocalPreferenceBloc(lps),
      (lps) => GlobalMediaSettingsLocalPreferenceBloc(lps),
      (lps) => GlobalToastSettingsLocalPreferenceBloc(lps),
      (lps) => GlobalPostStatusSettingsLocalPreferenceBloc(lps),
      (lps) => GlobalStatusSensitiveSettingsLocalPreferenceBloc(lps),
      (lps) => GlobalWebSocketsSettingsLocalPreferenceBloc(lps),
      (lps) => GlobalLocalizationSettingsLocalPreferenceBloc(lps),
      (lps) => GlobalUiSettingsLocalPreferenceBloc(lps),
      (lps) => GlobalPaginationSettingsLocalPreferenceBloc(lps),
      (lps) => AppAnalyticsLocalPreferenceBloc(lps),
      ...authInstancesBlocCreators,
    ];
  }

  static List<LocalPreferencesBlocCreator>
      calculateUserAtHostLocalPreferencesBlocCreators(String userAtHost) => [
            (lps) => EmojiPickerRecentCategoryLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
            (lps) => EmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
            (lps) => MyAccountLocalPreferenceBloc(lps, userAtHost: userAtHost),
            (lps) =>
                RecentSearchLocalPreferenceBloc(lps, userAtHost: userAtHost),
            (lps) => AskPushPermissionLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
            (lps) => TimelinesHomeTabStorageLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
            (lps) => InstancePushSettingsLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
            (lps) => InstanceChatSettingsLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
            (lps) => InstanceMediaSettingsLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
            (lps) => InstanceToastSettingsLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
            (lps) => InstancePostStatusSettingsLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
            (lps) => InstanceStatusSensitiveSettingsLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
            (lps) => InstanceWebSocketsSettingsLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
            (lps) => InstancePaginationSettingsLocalPreferenceBloc(
                  lps,
                  userAtHost: userAtHost,
                ),
          ];
}
