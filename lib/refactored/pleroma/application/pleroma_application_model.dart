import 'dart:convert';

import 'package:fedi/refactored/local_preferences/local_preferences_model.dart';
import 'package:fedi/refactored/mastodon/application/mastodon_application_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_application_model.g.dart';

abstract class IPleromaApplication implements IMastodonApplication {}

abstract class IPleromaClientApplication implements IMastodonClientApplication {
}

@JsonSerializable()
class PleromaApplication implements IPleromaApplication {
  @override
  final String name;
  @override
  final String website;
  @override
  @JsonKey(name: "vapid_key")
  @HiveField(2)
  final String vapidKey;
  PleromaApplication({this.name, this.website, this.vapidKey});

  factory PleromaApplication.fromJson(Map<String, dynamic> json) =>
      _$PleromaApplicationFromJson(json);

  factory PleromaApplication.fromJsonString(String jsonString) =>
      _$PleromaApplicationFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaApplicationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApplicationToJson(this));
  @override
  String toString() {
    return 'PleromaApplication{name: $name, website: $website,'
        ' vapidKey: $vapidKey}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApplication &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          website == other.website &&
          vapidKey == other.vapidKey;
  @override
  int get hashCode => name.hashCode ^ website.hashCode ^ vapidKey.hashCode;
}

@HiveType()
@JsonSerializable()
class PleromaClientApplication
    implements IPleromaClientApplication, IPreferencesObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String website;
  @JsonKey(name: "vapid_key")
  @HiveField(2)
  String vapidKey;
  @override
  @JsonKey(name: "client_id")
  @HiveField(3)
  String clientId;
  @override
  @JsonKey(name: "client_secret")
  @HiveField(4)
  String clientSecret;

  PleromaClientApplication(
      {this.name,
      this.website,
      this.vapidKey,
      this.clientId,
      this.clientSecret});

  factory PleromaClientApplication.fromJson(Map<String, dynamic> json) =>
      _$PleromaClientApplicationFromJson(json);

  factory PleromaClientApplication.fromJsonString(String jsonString) =>
      _$PleromaClientApplicationFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaClientApplicationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaClientApplicationToJson(this));
}
