// ignore_for_file: no-magic-number, no-equal-arguments

import 'pleroma_api_my_account_notifications_settings_model_impl.dart';

class PleromaApiMyAccountNotificationsSettingsMockHelper {
  static PleromaApiMyAccountNotificationsSettings generate({
    required String seed,
  }) =>
      PleromaApiMyAccountNotificationsSettings(
        followers: seed.hashCode % 2 == 1,
        follows: seed.hashCode % 2 == 0,
        nonFollowers: seed.hashCode % 2 == 1,
        nonFollows: seed.hashCode % 2 == 0,
        blockFromStrangers: seed.hashCode % 2 == 1,
        hideNotificationContents: seed.hashCode % 2 == 0,
      );
}
