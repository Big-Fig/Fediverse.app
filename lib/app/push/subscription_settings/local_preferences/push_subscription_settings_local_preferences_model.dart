import 'dart:convert';

import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_subscription_settings_local_preferences_model.g.dart';

@JsonSerializable()
@HiveType()
class PushSubscriptionSettingsLocalPreferences extends IPreferencesObject {
  @HiveField(1)
  bool favourite;
  @HiveField(2)
  bool follow;
  @HiveField(3)
  bool mention;
  @HiveField(4)
  bool reblog;
  @HiveField(5)
  bool poll;
  @HiveField(6)
  bool chat;
  PushSubscriptionSettingsLocalPreferences({
    this.favourite,
    this.follow,
    this.mention,
    this.reblog,
    this.poll,
    this.chat,
  });

  PushSubscriptionSettingsLocalPreferences.defaultAllEnabled()
      : this(
          favourite: true,
          follow: true,
          mention: true,
          reblog: true,
          poll: true,
          chat: true,
        );

  PushSubscriptionSettingsLocalPreferences copyWith({
    bool favourite,
    bool follow,
    bool mention,
    bool reblog,
    bool poll,
    bool chat,
  }) =>
      PushSubscriptionSettingsLocalPreferences(
        favourite: favourite ?? this.favourite,
        follow: follow ?? this.follow,
        mention: mention ?? this.mention,
        reblog: reblog ?? this.reblog,
        poll: poll ?? this.poll,
        chat: chat ?? this.chat,
      );


  @override
  String toString() {
    return 'PushSubscriptionSettingsLocalPreferences{favourite: $favourite,'
        ' follow: $follow, mention: $mention,'
        ' reblog: $reblog, poll: $poll, chat: $chat}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushSubscriptionSettingsLocalPreferences &&
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

  factory PushSubscriptionSettingsLocalPreferences.fromJson(
          Map<String, dynamic> json) =>
      _$PushSubscriptionSettingsLocalPreferencesFromJson(json);

  factory PushSubscriptionSettingsLocalPreferences.fromJsonString(String jsonString) =>
      _$PushSubscriptionSettingsLocalPreferencesFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() =>
      _$PushSubscriptionSettingsLocalPreferencesToJson(this);
  String toJsonString() =>
      jsonEncode(_$PushSubscriptionSettingsLocalPreferencesToJson(this));
}
