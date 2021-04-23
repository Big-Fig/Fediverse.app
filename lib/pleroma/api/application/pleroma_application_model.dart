import 'dart:convert';

import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/application/mastodon_api_application_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_application_model.g.dart';

abstract class IPleromaApplication implements IMastodonApiApplication {}

abstract class IPleromaClientApplication implements IMastodonApiClientApplication {
}

extension IPleromaApplicationExtension on IPleromaApplication {
  PleromaApplication toPleromaApplication() {
    if (this is PleromaApplication) {
      return this as PleromaApplication;
    } else {
      return PleromaApplication(
        name: name,
        website: website,
        vapidKey: vapidKey,
      );
    }
  }
}

@JsonSerializable()
class PleromaApplication implements IPleromaApplication {
  @override
  final String? name;
  @override
  final String? website;
  @override
  @JsonKey(name: "vapid_key")
  @HiveField(2)
  final String? vapidKey;

  PleromaApplication({
    required this.name,
    required this.website,
    required this.vapidKey,
  });

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

extension IPleromaClientApplicationExtension on IPleromaClientApplication {
  PleromaClientApplication toPleromaClientApplication() {
    if (this is PleromaClientApplication) {
      return this as PleromaClientApplication;
    } else {
      return PleromaClientApplication(
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
class PleromaClientApplication
    implements IPleromaClientApplication, IJsonObject {
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

  PleromaClientApplication({
    required this.name,
    required this.website,
    required this.vapidKey,
    required this.clientId,
    required this.clientSecret,
  });

  factory PleromaClientApplication.fromJson(Map<String, dynamic> json) =>
      _$PleromaClientApplicationFromJson(json);

  factory PleromaClientApplication.fromJsonString(String jsonString) =>
      _$PleromaClientApplicationFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaClientApplicationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaClientApplicationToJson(this));
}
