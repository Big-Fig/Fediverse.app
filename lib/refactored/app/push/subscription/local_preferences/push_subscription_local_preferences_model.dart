import 'dart:convert';

import 'package:fedi/refactored/local_preferences/local_preferences_model.dart';
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
  PushSubscriptionLocalPreferences({
    this.favourite,
    this.follow,
    this.mention,
    this.reblog,
    this.poll,
  });

  PushSubscriptionLocalPreferences.defaultAllDisabled()
      : this(
          favourite: false,
          follow: false,
          mention: false,
          reblog: false,
          poll: false,
        );

  PushSubscriptionLocalPreferences copyWith(
          {bool favourite,
          bool follow,
          bool mention,
          bool reblog,
          bool poll}) =>
      PushSubscriptionLocalPreferences(
        favourite: favourite ?? this.favourite,
        follow: follow ?? this.follow,
        mention: mention ?? this.mention,
        reblog: reblog ?? this.reblog,
        poll: poll ?? this.poll,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushSubscriptionLocalPreferences &&
          runtimeType == other.runtimeType &&
          favourite == other.favourite &&
          follow == other.follow &&
          mention == other.mention &&
          reblog == other.reblog;
  @override
  int get hashCode =>
      favourite.hashCode ^ follow.hashCode ^ mention.hashCode ^ reblog.hashCode;

  @override
  String toString() {
    return 'PushSubscriptionLocalPreferences{favourite: $favourite,'
        ' follow: $follow, mention: $mention, reblog: $reblog, poll: $poll}';
  }

  factory PushSubscriptionLocalPreferences.fromJson(Map<String, dynamic> json) =>
      _$PushSubscriptionLocalPreferencesFromJson(json);

  factory PushSubscriptionLocalPreferences.fromJsonString(String jsonString) =>
      _$PushSubscriptionLocalPreferencesFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PushSubscriptionLocalPreferencesToJson(this);
  String toJsonString() => jsonEncode(_$PushSubscriptionLocalPreferencesToJson(this));
}
