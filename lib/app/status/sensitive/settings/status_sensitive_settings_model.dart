import 'dart:convert';

import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status_sensitive_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 85)
class StatusSensitiveSettings
    implements IJsonObject, ISettings<StatusSensitiveSettings> {
  @HiveField(0)
  @JsonKey(name: "is_always_show_spoiler")
  final bool? isAlwaysShowSpoiler;
  @HiveField(1)
  @JsonKey(name: "is_always_show_nsfw")
  final bool? isAlwaysShowNsfw;

  @HiveField(2)
  @JsonKey(name: "nsfw_display_delay_duration_seconds_total")
  final int? nsfwDisplayDelayDurationMicrosecondsTotal;

  Duration get nsfwDisplayDelayDuration => Duration(
        microseconds: nsfwDisplayDelayDurationMicrosecondsTotal!,
      );

  StatusSensitiveSettings({
    required this.isAlwaysShowSpoiler,
    required this.isAlwaysShowNsfw,
    required this.nsfwDisplayDelayDurationMicrosecondsTotal,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusSensitiveSettings &&
          runtimeType == other.runtimeType &&
          isAlwaysShowSpoiler == other.isAlwaysShowSpoiler &&
          isAlwaysShowNsfw == other.isAlwaysShowNsfw &&
          nsfwDisplayDelayDurationMicrosecondsTotal ==
              other.nsfwDisplayDelayDurationMicrosecondsTotal;

  @override
  int get hashCode =>
      isAlwaysShowSpoiler.hashCode ^
      isAlwaysShowNsfw.hashCode ^
      nsfwDisplayDelayDurationMicrosecondsTotal.hashCode;

  @override
  String toString() {
    return 'StatusSensitiveSettings{'
        'isAlwaysShowSpoiler: $isAlwaysShowSpoiler,'
        ' isAlwaysShowNsfw: $isAlwaysShowNsfw,'
        ' nsfwDisplayDelayDurationMicrosecondsTotal:'
        ' $nsfwDisplayDelayDurationMicrosecondsTotal}';
  }

  factory StatusSensitiveSettings.fromJson(Map<String, dynamic> json) =>
      _$StatusSensitiveSettingsFromJson(json);

  factory StatusSensitiveSettings.fromJsonString(String jsonString) =>
      _$StatusSensitiveSettingsFromJson(jsonDecode(jsonString));

  static List<StatusSensitiveSettings> listFromJsonString(String str) =>
      List<StatusSensitiveSettings>.from(
        json.decode(str).map((x) => StatusSensitiveSettings.fromJson(x)),
      );

  @override
  Map<String, dynamic> toJson() => _$StatusSensitiveSettingsToJson(this);

  String toJsonString() => jsonEncode(_$StatusSensitiveSettingsToJson(this));

  @override
  StatusSensitiveSettings clone() => copyWith();

  StatusSensitiveSettings copyWith({
    bool? isAlwaysShowSpoiler,
    bool? isAlwaysShowNsfw,
    int? nsfwDisplayDelayDurationMicrosecondsTotal,
  }) =>
      StatusSensitiveSettings(
        isAlwaysShowSpoiler: isAlwaysShowSpoiler ?? this.isAlwaysShowSpoiler,
        isAlwaysShowNsfw: isAlwaysShowNsfw ?? this.isAlwaysShowNsfw,
        nsfwDisplayDelayDurationMicrosecondsTotal:
            nsfwDisplayDelayDurationMicrosecondsTotal ??
                this.nsfwDisplayDelayDurationMicrosecondsTotal,
      );
}
