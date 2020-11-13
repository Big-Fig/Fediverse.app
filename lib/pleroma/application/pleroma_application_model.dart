import 'dart:convert';

import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/mastodon/application/mastodon_application_model.dart';
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

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 52)
@JsonSerializable(explicitToJson: true)
class PleromaClientApplication
    implements IPleromaClientApplication, IPreferencesObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String website;
  @JsonKey(name: "vapid_key")
  @HiveField(2)
  final String vapidKey;
  @override
  @JsonKey(name: "client_id")
  @HiveField(3)
  final String clientId;
  @override
  @JsonKey(name: "client_secret")
  @HiveField(4)
  final String clientSecret;

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

  @override
  Map<String, dynamic> toJson() => _$PleromaClientApplicationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaClientApplicationToJson(this));
}
