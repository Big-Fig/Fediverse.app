import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/account/my/notifications_settings/unifedi_api_my_account_notifications_settings_model.dart';

part 'unifedi_api_my_account_notifications_settings_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_my_account_notifications_settings_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMyAccountNotificationsSettingsPleromaAdapter
    with _$UnifediApiMyAccountNotificationsSettingsPleromaAdapter
    implements IUnifediApiMyAccountNotificationsSettings {
  const UnifediApiMyAccountNotificationsSettingsPleromaAdapter._();

  const factory UnifediApiMyAccountNotificationsSettingsPleromaAdapter(
    @HiveField(0) PleromaApiMyAccountNotificationsSettings value,
  ) = _UnifediApiMyAccountNotificationsSettingsPleromaAdapter;

  @override
  bool? get blockFromStrangers => value.blockFromStrangers;

  @override
  bool? get followers => value.followers;

  @override
  bool? get follows => value.follows;

  @override
  bool? get hideNotificationContents => value.hideNotificationContents;

  @override
  bool? get nonFollowers => value.nonFollowers;

  @override
  bool? get nonFollows => value.nonFollows;

  factory UnifediApiMyAccountNotificationsSettingsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMyAccountNotificationsSettingsPleromaAdapterFromJson(json);
}

extension PleromaApiMyAccountNotificationsSettingsUnifediExtension
    on IPleromaApiMyAccountNotificationsSettings {
  UnifediApiMyAccountNotificationsSettingsPleromaAdapter
      toUnifediApiMyAccountNotificationSettingsPleromaAdapter() =>
          UnifediApiMyAccountNotificationsSettingsPleromaAdapter(
            toPleromaApiMyAccountNotificationsSettings(),
          );
}

extension PleromaApiMyAccountNotificationsSettingsUnifediListExtension
    on List<IPleromaApiMyAccountNotificationsSettings> {
  List<UnifediApiMyAccountNotificationsSettingsPleromaAdapter>
      toUnifediApiMyAccountNotificationSettingsPleromaAdapterList() => map(
            (item) =>
                item.toUnifediApiMyAccountNotificationSettingsPleromaAdapter(),
          ).toList();
}

extension UnifediApiMyAccountNotificationsSettingsPleromaExtension
    on IUnifediApiMyAccountNotificationsSettings {
  PleromaApiMyAccountNotificationsSettings
      toPleromaApiMyAccountNotificationsSettings() =>
          PleromaApiMyAccountNotificationsSettings(
            followers: followers,
            follows: follows,
            nonFollowers: nonFollowers,
            nonFollows: nonFollows,
            blockFromStrangers: blockFromStrangers,
            hideNotificationContents: hideNotificationContents,
          );
}
