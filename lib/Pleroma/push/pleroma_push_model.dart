import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_push_model.g.dart';

@JsonSerializable()
class PleromaPushSubscribeRequest {
  PleromaPushSubscribeData data;
  PleromaPushSubscribeRequestSubscription subscription;
  PleromaPushSubscribeRequest(
      {@required this.data, @required this.subscription});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPushSubscribeRequest &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          subscription == other.subscription;
  @override
  int get hashCode => data.hashCode ^ subscription.hashCode;
  @override
  String toString() {
    return 'PleromaPushSettings{data: $data, subscription: $subscription}';
  }

  factory PleromaPushSubscribeRequest.fromJson(Map<String, dynamic> json) =>
      _$PleromaPushSubscribeRequestFromJson(json);

  factory PleromaPushSubscribeRequest.fromJsonString(String jsonString) =>
      _$PleromaPushSubscribeRequestFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPushSubscribeRequestToJson(this);
  String toJsonString() =>
      jsonEncode(_$PleromaPushSubscribeRequestToJson(this));
}

@JsonSerializable()
@HiveType()
class PleromaPushSubscribeData {
  @HiveField(1)
  PleromaPushSettingsDataAlerts alerts;
  PleromaPushSubscribeData({this.alerts});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPushSubscribeData &&
          runtimeType == other.runtimeType &&
          alerts == other.alerts;
  @override
  int get hashCode => alerts.hashCode;
  @override
  String toString() {
    return 'PleromaPushSettingsData{alerts: $alerts}';
  }

  factory PleromaPushSubscribeData.fromJson(Map<String, dynamic> json) =>
      _$PleromaPushSubscribeDataFromJson(json);

  factory PleromaPushSubscribeData.fromJsonString(String jsonString) =>
      _$PleromaPushSubscribeDataFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPushSubscribeDataToJson(this);
  String toJsonString() => jsonEncode(_$PleromaPushSubscribeDataToJson(this));
}

@JsonSerializable()
@HiveType()
class PleromaPushSettingsDataAlerts {
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
  PleromaPushSettingsDataAlerts({
    this.favourite,
    this.follow,
    this.mention,
    this.reblog,
    this.poll,
  });

  PleromaPushSettingsDataAlerts.defaultAllEnabled()
      : this(
          favourite: true,
          follow: true,
          mention: true,
          reblog: true,
          poll: true,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPushSettingsDataAlerts &&
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
    return 'PleromaPushSettingsDataAlerts{favourite: $favourite,'
        ' follow: $follow, mention: $mention, reblog: $reblog, poll: $poll}';
  }

  factory PleromaPushSettingsDataAlerts.fromJson(Map<String, dynamic> json) =>
      _$PleromaPushSettingsDataAlertsFromJson(json);

  factory PleromaPushSettingsDataAlerts.fromJsonString(String jsonString) =>
      _$PleromaPushSettingsDataAlertsFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPushSettingsDataAlertsToJson(this);
  String toJsonString() =>
      jsonEncode(_$PleromaPushSettingsDataAlertsToJson(this));
}

@JsonSerializable()
class PleromaPushSubscribeRequestSubscription {
  /// Endpoint URL that is called when a notification event occurs.
  String endpoint;
  PleromaPushSettingsSubscriptionKeys keys;
  PleromaPushSubscribeRequestSubscription(
      {@required this.endpoint, @required this.keys});

  @override
  String toString() {
    return 'PleromaPushSettingsSubscription{endpoint: $endpoint,'
        ' keys: $keys}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPushSubscribeRequestSubscription &&
          runtimeType == other.runtimeType &&
          endpoint == other.endpoint &&
          keys == other.keys;
  @override
  int get hashCode => endpoint.hashCode ^ keys.hashCode;

  factory PleromaPushSubscribeRequestSubscription.fromJson(
          Map<String, dynamic> json) =>
      _$PleromaPushSubscribeRequestSubscriptionFromJson(json);

  factory PleromaPushSubscribeRequestSubscription.fromJsonString(
          String jsonString) =>
      _$PleromaPushSubscribeRequestSubscriptionFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() =>
      _$PleromaPushSubscribeRequestSubscriptionToJson(this);
  String toJsonString() =>
      jsonEncode(_$PleromaPushSubscribeRequestSubscriptionToJson(this));
}

@JsonSerializable()
class PleromaPushSettingsSubscriptionKeys {
  /// User agent public key.
  /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
  String p256dh;

  /// Auth secret. Base64 encoded string of 16 bytes of random data.
  String auth;
  PleromaPushSettingsSubscriptionKeys(
      {@required this.p256dh, @required this.auth});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPushSettingsSubscriptionKeys &&
          runtimeType == other.runtimeType &&
          p256dh == other.p256dh &&
          auth == other.auth;
  @override
  int get hashCode => p256dh.hashCode ^ auth.hashCode;
  @override
  String toString() {
    return 'PleromaPushSettingsSubscriptionKeys{p256dh: $p256dh,'
        ' auth: $auth}';
  }

  factory PleromaPushSettingsSubscriptionKeys.fromJson(
          Map<String, dynamic> json) =>
      _$PleromaPushSettingsSubscriptionKeysFromJson(json);

  factory PleromaPushSettingsSubscriptionKeys.fromJsonString(
          String jsonString) =>
      _$PleromaPushSettingsSubscriptionKeysFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() =>
      _$PleromaPushSettingsSubscriptionKeysToJson(this);
  String toJsonString() =>
      jsonEncode(_$PleromaPushSettingsSubscriptionKeysToJson(this));
}
