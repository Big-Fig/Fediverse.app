import 'package:fedi/app/settings/settings_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'instance_announcement_settings_model.g.dart';

@JsonSerializable()
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 101)
class InstanceAnnouncementSettings
    extends ISettings<InstanceAnnouncementSettings> {
  @HiveField(1)
  final bool withDismissed;

  InstanceAnnouncementSettings({
    required this.withDismissed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceAnnouncementSettings &&
          runtimeType == other.runtimeType &&
          withDismissed == other.withDismissed;

  @override
  int get hashCode => withDismissed.hashCode;

  @override
  String toString() {
    return 'InstanceAnnouncementSettings{'
        'withDismissed: $withDismissed'
        '}';
  }

  static InstanceAnnouncementSettings fromJson(Map<String, dynamic> json) =>
      _$InstanceAnnouncementSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InstanceAnnouncementSettingsToJson(this);

  // ignore: long-parameter-list
  InstanceAnnouncementSettings copyWith({
    bool? withDismissed,
  }) =>
      InstanceAnnouncementSettings(
        withDismissed: withDismissed ?? this.withDismissed,
      );

  @override
  InstanceAnnouncementSettings clone() => copyWith();
}
