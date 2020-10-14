import 'package:fedi/app/account/my/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_access_token_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_application_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_local_preference_bloc_impl.dart';
import 'package:fedi/app/emoji/picker/category/custom/emoji_picker_custom_image_url_category_local_preference_bloc_impl.dart';
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc_impl.dart';
import 'package:fedi/app/push/subscription_settings/local_preferences/push_subscription_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/search/recent/recent_search_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/local_preferences_service_migration_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service_migration_bloc_impl.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_last_launched_host_to_login_local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class FediLocalPreferencesServiceMigrationBloc
    extends LocalPreferencesServiceMigrationBloc {
  FediLocalPreferencesServiceMigrationBloc({
    @required ILocalPreferencesService inputService,
    @required ILocalPreferencesService outputService,
  }) : super(
          inputService: inputService,
          outputService: outputService,
        );

  @override
  Future<List<LocalPreferencesBlocCreator>>
      calculateAllMigrationLocalPreferencesBlocCreators(
          ILocalPreferencesService inputService) async {
    var instanceListLocalPreferenceBloc =
        AuthInstanceListLocalPreferenceBloc(inputService);
    await instanceListLocalPreferenceBloc.performAsyncInit();
    var authInstanceList = instanceListLocalPreferenceBloc.value;

    var authInstancesBlocCreators = <LocalPreferencesBlocCreator>[];

    for (var authInstance in authInstanceList.instances) {
      var host = authInstance.urlHost;
      var userAtHost = authInstance.userAtHost;

      authInstancesBlocCreators.addAll([
        (lps) => AuthHostAccessTokenLocalPreferenceBloc(lps, host),
        (lps) => AuthHostApplicationLocalPreferenceBloc(lps, host),
        (lps) => EmojiPickerRecentCategoryLocalPreferenceBloc(lps, userAtHost),
        (lps) => EmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc(
            lps, userAtHost),
        (lps) => MyAccountLocalPreferenceBloc(lps, userAtHost),
        (lps) => MyAccountSettingsLocalPreferenceBloc(lps, userAtHost),
        (lps) => RecentSearchLocalPreferenceBloc(lps, userAtHost),
        (lps) => PushSubscriptionSettingsLocalPreferencesBloc(lps, userAtHost),
      ]);
    }

    return [
      (lps) => AuthInstanceListLocalPreferenceBloc(lps),
      (lps) => CurrentAuthInstanceLocalPreferenceBloc(lps),
      (lps) => PushHandlerUnhandledLocalPreferencesBloc(lps),
      (lps) => PleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc(lps),
      ...authInstancesBlocCreators
    ];
  }
}
