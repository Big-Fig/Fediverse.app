import 'dart:convert';

import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timeline_settings_local_preferences_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
@HiveType()
// @HiveType(typeId: -32 + 46)
@JsonSerializable(explicitToJson: true)
class TimelineSettingsLocalPreferences extends IPreferencesObject {
  @HiveField(1)
  @JsonKey(name: "only_with_media")
  final bool onlyWithMedia;
  @HiveField(2)
  @JsonKey(name: "only_no_replies")
  final bool onlyNoReplies;
  @HiveField(3)
  @JsonKey(name: "only_no_nsfw_sensitive")
  final bool onlyNoNsfwSensitive;

  TimelineSettingsLocalPreferences({
    this.onlyWithMedia,
    this.onlyNoReplies,
    this.onlyNoNsfwSensitive,
  });

  TimelineSettingsLocalPreferences copyWith(
      {bool onlyWithMedia, bool onlyNoReplies, bool onlyNoNsfwSensitive}) {
    return TimelineSettingsLocalPreferences(
      onlyWithMedia: onlyWithMedia ?? this.onlyWithMedia,
      onlyNoReplies: onlyNoReplies ?? this.onlyNoReplies,
      onlyNoNsfwSensitive: onlyNoNsfwSensitive ?? this.onlyNoNsfwSensitive,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineSettingsLocalPreferences &&
          runtimeType == other.runtimeType &&
          onlyWithMedia == other.onlyWithMedia &&
          onlyNoReplies == other.onlyNoReplies &&
          onlyNoNsfwSensitive == other.onlyNoNsfwSensitive;

  @override
  int get hashCode =>
      onlyWithMedia.hashCode ^
      onlyNoReplies.hashCode ^
      onlyNoNsfwSensitive.hashCode;

  @override
  String toString() {
    return 'TimelineLocalPreferences{onlyWithMedia: $onlyWithMedia,'
        ' onlyNoReplies: $onlyNoReplies, onlyNoNsfwSensitive: $onlyNoNsfwSensitive}';
  }

  factory TimelineSettingsLocalPreferences.fromJson(
          Map<String, dynamic> json) =>
      _$TimelineSettingsLocalPreferencesFromJson(json);

  factory TimelineSettingsLocalPreferences.fromJsonString(String jsonString) =>
      _$TimelineSettingsLocalPreferencesFromJson(jsonDecode(jsonString));

  static List<TimelineSettingsLocalPreferences> listFromJsonString(
          String str) =>
      List<TimelineSettingsLocalPreferences>.from(json
          .decode(str)
          .map((x) => TimelineSettingsLocalPreferences.fromJson(x)));

  @override
  Map<String, dynamic> toJson() =>
      _$TimelineSettingsLocalPreferencesToJson(this);

  String toJsonString() =>
      jsonEncode(_$TimelineSettingsLocalPreferencesToJson(this));
}
