import 'package:fedi/app/settings/settings_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'instance_announcement_settings_model.g.dart';

part 'instance_announcement_settings_model.freezed.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 101)
@freezed
class InstanceAnnouncementSettings
    with _$InstanceAnnouncementSettings
    implements ISettings<InstanceAnnouncementSettings> {
  const InstanceAnnouncementSettings._();
  const factory InstanceAnnouncementSettings({
    @HiveField(1) required bool withDismissed,
  }) = _InstanceAnnouncementSettings;

  factory InstanceAnnouncementSettings.fromJson(Map<String, dynamic> json) =>
      _$InstanceAnnouncementSettingsFromJson(json);

  @override
  InstanceAnnouncementSettings clone() => copyWith();
}
