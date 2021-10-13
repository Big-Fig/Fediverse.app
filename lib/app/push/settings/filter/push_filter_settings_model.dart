import 'package:fedi/app/settings/settings_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'push_filter_settings_model.freezed.dart';

part 'push_filter_settings_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 47)
@freezed
class PushFilterSettings
    with _$PushFilterSettings
    implements ISettings<PushFilterSettings> {
  const PushFilterSettings._();

  const factory PushFilterSettings({
    @HiveField(1) required bool? blockFromStrangers,
    @HiveField(2) required bool? hideNotificationContents,
  }) = _PushFilterSettings;

  factory PushFilterSettings.fromJson(Map<String, dynamic> json) =>
      _$PushFilterSettingsFromJson(json);

  static const allDisabled = PushFilterSettings(
    blockFromStrangers: false,
    hideNotificationContents: false,
  );
}

extension PushFilterSettingsUnifediAdapter
    on IUnifediApiMyAccountNotificationsSettings {
  PushFilterSettings toPushFilterSettings() => PushFilterSettings(
        blockFromStrangers: blockFromStrangers,
        hideNotificationContents: hideNotificationContents,
      );
}
