import 'dart:convert';

import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_settings_model.g.dart';

@JsonSerializable()
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 47)
class PushSettingsLocalPreferences extends IJsonObject {
  @HiveField(1)
  final bool favourite;
  @HiveField(2)
  final bool follow;
  @HiveField(3)
  final bool mention;
  @HiveField(4)
  final bool reblog;
  @HiveField(5)
  final bool poll;
  @HiveField(6)
  final bool chat;
  PushSettingsLocalPreferences({
    this.favourite,
    this.follow,
    this.mention,
    this.reblog,
    this.poll,
    this.chat,
  });

  PushSettingsLocalPreferences.defaultAllEnabled()
      : this(
          favourite: true,
          follow: true,
          mention: true,
          reblog: true,
          poll: true,
          chat: true,
        );
  PushSettingsLocalPreferences.defaultAllDisabled()
      : this(
          favourite: false,
          follow: false,
          mention: false,
          reblog: false,
          poll: false,
          chat: false,
        );

  PushSettingsLocalPreferences copyWith({
    bool favourite,
    bool follow,
    bool mention,
    bool reblog,
    bool poll,
    bool chat,
  }) =>
      PushSettingsLocalPreferences(
        favourite: favourite ?? this.favourite,
        follow: follow ?? this.follow,
        mention: mention ?? this.mention,
        reblog: reblog ?? this.reblog,
        poll: poll ?? this.poll,
        chat: chat ?? this.chat,
      );


  @override
  String toString() {
    return 'PushSettingsLocalPreferences{favourite: $favourite,'
        ' follow: $follow, mention: $mention,'
        ' reblog: $reblog, poll: $poll, chat: $chat}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushSettingsLocalPreferences &&
          runtimeType == other.runtimeType &&
          favourite == other.favourite &&
          follow == other.follow &&
          mention == other.mention &&
          reblog == other.reblog &&
          poll == other.poll &&
          chat == other.chat;

  @override
  int get hashCode =>
      favourite.hashCode ^
      follow.hashCode ^
      mention.hashCode ^
      reblog.hashCode ^
      poll.hashCode ^
      chat.hashCode;

  factory PushSettingsLocalPreferences.fromJson(
          Map<String, dynamic> json) =>
      _$PushSettingsLocalPreferencesFromJson(json);

  factory PushSettingsLocalPreferences.fromJsonString(String jsonString) =>
      _$PushSettingsLocalPreferencesFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() =>
      _$PushSettingsLocalPreferencesToJson(this);
  String toJsonString() =>
      jsonEncode(_$PushSettingsLocalPreferencesToJson(this));
}
