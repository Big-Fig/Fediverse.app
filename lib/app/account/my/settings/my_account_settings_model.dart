import 'dart:convert';

import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_account_settings_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 57)
@JsonSerializable(explicitToJson: true)
class MyAccountSettings implements IPreferencesObject {
  @HiveField(0)
  @JsonKey(name: "is_realtime_web_sockets_enabled")
  final bool isRealtimeWebSocketsEnabled;
  @HiveField(1)
  @JsonKey(name: "is_new_chats_enabled")
  final bool isNewChatsEnabled;
  @HiveField(2)
  @JsonKey(name: "is_always_show_spoiler")
  final bool isAlwaysShowSpoiler;
  @HiveField(3)
  @JsonKey(name: "is_always_show_nsfw")
  final bool isAlwaysShowNsfw;
  @HiveField(4)
  @JsonKey(name: "default_visibility")
  final String defaultVisibility;
  @HiveField(5)
  @JsonKey(name: "mark_media_nsfw_by_default")
  final bool markMediaNsfwByDefault;
  @HiveField(6)
  @JsonKey(name: "foreground_sound_for_chat_and_dm")
  final bool foregroundSoundForChatAndDm;
  @HiveField(7)
  @JsonKey(name: "foreground_sound_mention")
  final bool foregroundSoundForMention;

  @HiveField(8)
  @JsonKey(name: "media_auto_init")
  final bool mediaAutoInit;
  @HiveField(9)
  @JsonKey(name: "media_auto_play")
  final bool mediaAutoPlay;

  MyAccountSettings({
    this.isRealtimeWebSocketsEnabled,
    this.isNewChatsEnabled,
    this.isAlwaysShowSpoiler,
    this.isAlwaysShowNsfw,
    this.defaultVisibility,
    this.markMediaNsfwByDefault,
    this.foregroundSoundForChatAndDm,
    this.foregroundSoundForMention,
    this.mediaAutoInit,
    this.mediaAutoPlay,
  });

  MyAccountSettings copyWith({
    bool isRealtimeWebSocketsEnabled,
    bool isNewChatsEnabled,
    bool isAlwaysShowSpoiler,
    bool isAlwaysShowNsfw,
    String defaultVisibility,
    bool markMediaNsfwByDefault,
    bool foregroundSoundForChatAndDm,
    bool foregroundSoundForMention,
    bool mediaAutoInit,
    bool mediaAutoPlay,
  }) =>
      MyAccountSettings(
        isRealtimeWebSocketsEnabled:
            isRealtimeWebSocketsEnabled ?? this.isRealtimeWebSocketsEnabled,
        isNewChatsEnabled: isNewChatsEnabled ?? this.isNewChatsEnabled,
        isAlwaysShowSpoiler: isAlwaysShowSpoiler ?? this.isAlwaysShowSpoiler,
        isAlwaysShowNsfw: isAlwaysShowNsfw ?? this.isAlwaysShowNsfw,
        defaultVisibility: defaultVisibility ?? this.defaultVisibility,
        markMediaNsfwByDefault:
            markMediaNsfwByDefault ?? this.markMediaNsfwByDefault,
        foregroundSoundForChatAndDm:
            foregroundSoundForChatAndDm ?? this.foregroundSoundForChatAndDm,
        foregroundSoundForMention:
            foregroundSoundForMention ?? this.foregroundSoundForMention,
        mediaAutoInit: mediaAutoInit ?? this.mediaAutoInit,
        mediaAutoPlay: mediaAutoPlay ?? this.mediaAutoPlay,
      );

  factory MyAccountSettings.fromJson(Map<String, dynamic> json) =>
      _$MyAccountSettingsFromJson(json);

  factory MyAccountSettings.fromJsonString(String jsonString) =>
      _$MyAccountSettingsFromJson(jsonDecode(jsonString));

  static List<MyAccountSettings> listFromJsonString(String str) =>
      List<MyAccountSettings>.from(
          json.decode(str).map((x) => MyAccountSettings.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$MyAccountSettingsToJson(this);

  String toJsonString() => jsonEncode(_$MyAccountSettingsToJson(this));

  @override
  String toString() {
    return 'MyAccountSettings{'
        'isRealtimeWebSocketsEnabled: $isRealtimeWebSocketsEnabled,'
        ' isNewChatsEnabled: $isNewChatsEnabled,'
        ' isAlwaysShowSpoiler: $isAlwaysShowSpoiler,'
        ' isAlwaysShowNsfw: $isAlwaysShowNsfw,'
        ' defaultVisibility: $defaultVisibility,'
        ' markMediaNsfwByDefault: $markMediaNsfwByDefault,'
        ' foregroundSoundForChatAndDm: $foregroundSoundForChatAndDm,'
        ' mediaAutoPlay: $mediaAutoPlay,'
        ' mediaAutoInit: $mediaAutoInit,'
        ' foregroundSoundForMention: $foregroundSoundForMention}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyAccountSettings &&
          runtimeType == other.runtimeType &&
          isRealtimeWebSocketsEnabled == other.isRealtimeWebSocketsEnabled &&
          isNewChatsEnabled == other.isNewChatsEnabled &&
          isAlwaysShowSpoiler == other.isAlwaysShowSpoiler &&
          isAlwaysShowNsfw == other.isAlwaysShowNsfw &&
          defaultVisibility == other.defaultVisibility &&
          markMediaNsfwByDefault == other.markMediaNsfwByDefault &&
          foregroundSoundForChatAndDm == other.foregroundSoundForChatAndDm &&
          foregroundSoundForMention == other.foregroundSoundForMention &&
          mediaAutoInit == other.mediaAutoInit &&
          mediaAutoPlay == other.mediaAutoPlay;

  @override
  int get hashCode =>
      isRealtimeWebSocketsEnabled.hashCode ^
      isNewChatsEnabled.hashCode ^
      isAlwaysShowSpoiler.hashCode ^
      isAlwaysShowNsfw.hashCode ^
      defaultVisibility.hashCode ^
      markMediaNsfwByDefault.hashCode ^
      foregroundSoundForChatAndDm.hashCode ^
      foregroundSoundForMention.hashCode ^
      mediaAutoInit.hashCode ^
      mediaAutoPlay.hashCode;
}
