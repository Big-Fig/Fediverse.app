import 'dart:convert';

import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/application/mastodon_api_application_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_application_model.g.dart';

abstract class IPleromaApiApplication implements IMastodonApiApplication {}

abstract class IPleromaApiClientApplication implements IMastodonApiClientApplication {
}

extension IPleromaApiApplicationExtension on IPleromaApiApplication {
  PleromaApiApplication toPleromaApiApplication() {
    if (this is PleromaApiApplication) {
      return this as PleromaApiApplication;
    } else {
      return PleromaApiApplication(
        name: name,
        website: website,
        vapidKey: vapidKey,
      );
    }
  }
}

@JsonSerializable()
class PleromaApiApplication implements IPleromaApiApplication {
  @override
  final String? name;
  @override
  final String? website;
  @override
  @JsonKey(name: "vapid_key")
  @HiveField(2)
  final String? vapidKey;

  PleromaApiApplication({
    required this.name,
    required this.website,
    required this.vapidKey,
  });

  factory PleromaApiApplication.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiApplicationFromJson(json);

  factory PleromaApiApplication.fromJsonString(String jsonString) =>
      _$PleromaApiApplicationFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaApiApplicationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiApplicationToJson(this));

  @override
  String toString() {
    return 'PleromaApiApplication{'
        'name: $name, '
        'website: $website, '
        'vapidKey: $vapidKey'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiApplication &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          website == other.website &&
          vapidKey == other.vapidKey;

  @override
  int get hashCode => name.hashCode ^ website.hashCode ^ vapidKey.hashCode;
}

extension IPleromaApiClientApplicationExtension on IPleromaApiClientApplication {
  PleromaApiClientApplication toPleromaApiClientApplication() {
    if (this is PleromaApiClientApplication) {
      return this as PleromaApiClientApplication;
    } else {
      return PleromaApiClientApplication(
        name: name,
        website: website,
        vapidKey: vapidKey,
        clientId: clientId,
        clientSecret: clientSecret,
      );
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 52)
@JsonSerializable(explicitToJson: true)
class PleromaApiClientApplication
    implements IPleromaApiClientApplication, IJsonObject {
  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  final String? website;
  @override
  @JsonKey(name: "vapid_key")
  @HiveField(2)
  final String? vapidKey;
  @override
  @JsonKey(name: "client_id")
  @HiveField(3)
  final String? clientId;
  @override
  @JsonKey(name: "client_secret")
  @HiveField(4)
  final String? clientSecret;

  PleromaApiClientApplication({
    required this.name,
    required this.website,
    required this.vapidKey,
    required this.clientId,
    required this.clientSecret,
  });

  factory PleromaApiClientApplication.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiClientApplicationFromJson(json);

  factory PleromaApiClientApplication.fromJsonString(String jsonString) =>
      _$PleromaApiClientApplicationFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaApiClientApplicationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiClientApplicationToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiClientApplication &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          website == other.website &&
          vapidKey == other.vapidKey &&
          clientId == other.clientId &&
          clientSecret == other.clientSecret;

  @override
  int get hashCode =>
      name.hashCode ^
      website.hashCode ^
      vapidKey.hashCode ^
      clientId.hashCode ^
      clientSecret.hashCode;

  @override
  String toString() {
    return 'PleromaApiClientApplication{'
        'name: $name, '
        'website: $website, '
        'vapidKey: $vapidKey, '
        'clientId: $clientId, '
        'clientSecret: $clientSecret'
        '}';
  }
}
