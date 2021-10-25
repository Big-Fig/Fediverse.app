import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_my_account_notifications_settings_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_my_account_notifications_settings_model_impl.freezed.dart';

part 'unifedi_api_my_account_notifications_settings_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiMyAccountNotificationsSettings
    with _$UnifediApiMyAccountNotificationsSettings
    implements IUnifediApiMyAccountNotificationsSettings {
  const factory UnifediApiMyAccountNotificationsSettings({
    @HiveField(0) required bool? followers,
    @HiveField(1) required bool? follows,
    @JsonKey(name: 'non_followers') @HiveField(2) required bool? nonFollowers,
    @JsonKey(name: 'non_follows') @HiveField(3) required bool? nonFollows,
    @JsonKey(name: 'block_from_strangers')
    @HiveField(4)
        required bool? blockFromStrangers,
    @JsonKey(name: 'hide_notification_contents')
    @HiveField(5)
        required bool? hideNotificationContents,
  }) = _UnifediApiMyAccountNotificationsSettings;

  factory UnifediApiMyAccountNotificationsSettings.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMyAccountNotificationsSettingsFromJson(
        json,
      );
}

extension IUnifediApiMyAccountNotificationsSettingsExtension
    on IUnifediApiMyAccountNotificationsSettings {
  UnifediApiMyAccountNotificationsSettings
      toUnifediApiMyAccountNotificationsSettings({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => UnifediApiMyAccountNotificationsSettings(
              followers: followers,
              follows: follows,
              nonFollowers: nonFollowers,
              nonFollows: nonFollows,
              blockFromStrangers: blockFromStrangers,
              hideNotificationContents: hideNotificationContents,
            ),
            forceNewObject: forceNewObject,
          );
}
