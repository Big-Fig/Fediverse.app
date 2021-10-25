import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_my_account_notifications_settings_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_my_account_notifications_settings_model_impl.freezed.dart';
part 'pleroma_api_my_account_notifications_settings_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiMyAccountNotificationsSettings
    with _$PleromaApiMyAccountNotificationsSettings
    implements IPleromaApiMyAccountNotificationsSettings {
  const factory PleromaApiMyAccountNotificationsSettings({
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
  }) = _PleromaApiMyAccountNotificationsSettings;

  factory PleromaApiMyAccountNotificationsSettings.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMyAccountNotificationsSettingsFromJson(
        json,
      );
}

extension IPleromaApiMyAccountNotificationsSettingsExtension
    on IPleromaApiMyAccountNotificationsSettings {
  PleromaApiMyAccountNotificationsSettings
      toPleromaApiMyAccountNotificationsSettings({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => PleromaApiMyAccountNotificationsSettings(
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
