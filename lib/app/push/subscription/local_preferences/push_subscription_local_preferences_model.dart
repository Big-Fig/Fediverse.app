import 'dart:convert';

import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_subscription_local_preferences_model.g.dart';

@JsonSerializable()
@HiveType()
class PushSubscriptionLocalPreferences extends IPreferencesObject {
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
  PushSubscriptionLocalPreferences({
    this.favourite,
    this.follow,
    this.mention,
    this.reblog,
    this.poll,
    this.chat,
  });

  PushSubscriptionLocalPreferences.defaultAllEnabled()
      : this(
          favourite: true,
          follow: true,
          mention: true,
          reblog: true,
          poll: true,
          chat: true,
        );

  PushSubscriptionLocalPreferences copyWith({
    bool favourite,
    bool follow,
    bool mention,
    bool reblog,
    bool poll,
    bool chat,
  }) =>
      PushSubscriptionLocalPreferences(
        favourite: favourite ?? this.favourite,
        follow: follow ?? this.follow,
        mention: mention ?? this.mention,
        reblog: reblog ?? this.reblog,
        poll: poll ?? this.poll,
        chat: chat ?? this.chat,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushSubscriptionLocalPreferences &&
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

  factory PushSubscriptionLocalPreferences.fromJson(
          Map<String, dynamic> json) =>
      _$PushSubscriptionLocalPreferencesFromJson(json);

  factory PushSubscriptionLocalPreferences.fromJsonString(String jsonString) =>
      _$PushSubscriptionLocalPreferencesFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() =>
      _$PushSubscriptionLocalPreferencesToJson(this);
  String toJsonString() =>
      jsonEncode(_$PushSubscriptionLocalPreferencesToJson(this));
}
