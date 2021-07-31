import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_application_model.g.dart';

abstract class IPleromaApiApplication implements IMastodonApiApplication {}

abstract class IPleromaApiClientApplication
    implements IMastodonApiClientApplication {}

extension IPleromaApiApplicationExtension on IPleromaApiApplication {
  PleromaApiApplication toPleromaApiApplication({bool forceNewObject = false}) {
    if (this is PleromaApiApplication && !forceNewObject) {
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
class PleromaApiApplication implements IPleromaApiApplication, IJsonObject {
  @override
  @HiveField(3)
  final String? name;
  @override
  @HiveField(4)
  final String? website;
  @override
  @JsonKey(name: 'vapid_key')
  @HiveField(2)
  final String? vapidKey;

  PleromaApiApplication({
    required this.name,
    required this.website,
    required this.vapidKey,
  });

  static PleromaApiApplication fromJson(Map<String, dynamic> json) =>
      _$PleromaApiApplicationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiApplicationToJson(this);

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

extension IPleromaApiClientApplicationExtension
    on IPleromaApiClientApplication {
  PleromaApiClientApplication toPleromaApiClientApplication({
    bool forceNewObject = false,
  }) {
    if (this is PleromaApiClientApplication && !forceNewObject) {
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
  @JsonKey(name: 'vapid_key')
  @HiveField(2)
  final String? vapidKey;
  @override
  @JsonKey(name: 'client_id')
  @HiveField(3)
  final String? clientId;
  @override
  @JsonKey(name: 'client_secret')
  @HiveField(4)
  final String? clientSecret;

  PleromaApiClientApplication({
    required this.name,
    required this.website,
    required this.vapidKey,
    required this.clientId,
    required this.clientSecret,
  });

  static PleromaApiClientApplication fromJson(Map<String, dynamic> json) =>
      _$PleromaApiClientApplicationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiClientApplicationToJson(this);

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
