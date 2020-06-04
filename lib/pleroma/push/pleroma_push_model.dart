import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_push_model.g.dart';

@JsonSerializable(explicitToJson: true)
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

@JsonSerializable(explicitToJson: true)
class PleromaPushSubscription {
  // todo: pleroma id is string but mastodon is int
  final dynamic id;
  final String endpoint;
  final PleromaPushSettingsDataAlerts alerts;
  @JsonKey(name: "server_key")
  final String serverKey;
  PleromaPushSubscribeRequestSubscription subscription;

  PleromaPushSubscription(
      {@required this.id,
      @required this.endpoint,
      @required this.alerts,
      @required this.serverKey,
      @required this.subscription});

  @override
  String toString() {
    return 'PleromaPushSubscription{id: $id, endpoint: $endpoint,'
        ' alerts: $alerts, serverKey: $serverKey, subscription: $subscription}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPushSubscription &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          endpoint == other.endpoint &&
          alerts == other.alerts &&
          serverKey == other.serverKey &&
          subscription == other.subscription;

  @override
  int get hashCode =>
      id.hashCode ^
      endpoint.hashCode ^
      alerts.hashCode ^
      serverKey.hashCode ^
      subscription.hashCode;

  factory PleromaPushSubscription.fromJson(Map<String, dynamic> json) =>
      _$PleromaPushSubscriptionFromJson(json);

  factory PleromaPushSubscription.fromJsonString(String jsonString) =>
      _$PleromaPushSubscriptionFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPushSubscriptionToJson(this);

  String toJsonString() => jsonEncode(_$PleromaPushSubscriptionToJson(this));
}

@JsonSerializable(explicitToJson: true)
class PleromaPushSubscribeData {
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
class PleromaPushSettingsDataAlertsPleromaPart {
  @JsonKey(name: "chat_mention")
  final bool chatMention;
  PleromaPushSettingsDataAlertsPleromaPart({@required this.chatMention});

  factory PleromaPushSettingsDataAlertsPleromaPart.fromJson(
          Map<String, dynamic> json) =>
      _$PleromaPushSettingsDataAlertsPleromaPartFromJson(json);

  factory PleromaPushSettingsDataAlertsPleromaPart.fromJsonString(
          String jsonString) =>
      _$PleromaPushSettingsDataAlertsPleromaPartFromJson(
          jsonDecode(jsonString));

  Map<String, dynamic> toJson() =>
      _$PleromaPushSettingsDataAlertsPleromaPartToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaPushSettingsDataAlertsPleromaPartToJson(this));
}

@JsonSerializable(explicitToJson: true)
class PleromaPushSettingsDataAlerts {
  final bool favourite;

  final bool follow;

  final bool mention;

  final bool reblog;

  final bool poll;

  final PleromaPushSettingsDataAlertsPleromaPart pleroma;

  PleromaPushSettingsDataAlerts({
    @required this.favourite,
    @required this.follow,
    @required this.mention,
    @required this.reblog,
    @required this.poll,
    @required this.pleroma,
  });

  PleromaPushSettingsDataAlerts.defaultAllEnabled()
      : this(
          favourite: true,
          follow: true,
          mention: true,
          reblog: true,
          poll: true,
          pleroma: PleromaPushSettingsDataAlertsPleromaPart(
            chatMention: true,
          ),
        );


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPushSettingsDataAlerts &&
          runtimeType == other.runtimeType &&
          favourite == other.favourite &&
          follow == other.follow &&
          mention == other.mention &&
          reblog == other.reblog &&
          poll == other.poll &&
          pleroma == other.pleroma;
  @override
  int get hashCode =>
      favourite.hashCode ^
      follow.hashCode ^
      mention.hashCode ^
      reblog.hashCode ^
      poll.hashCode ^
      pleroma.hashCode;


  @override
  String toString() {
    return 'PleromaPushSettingsDataAlerts{favourite: $favourite, follow: $follow, mention: $mention, reblog: $reblog, poll: $poll, pleroma: $pleroma}';
  }

  factory PleromaPushSettingsDataAlerts.fromJson(Map<String, dynamic> json) =>
      _$PleromaPushSettingsDataAlertsFromJson(json);

  factory PleromaPushSettingsDataAlerts.fromJsonString(String jsonString) =>
      _$PleromaPushSettingsDataAlertsFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPushSettingsDataAlertsToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaPushSettingsDataAlertsToJson(this));
}

@JsonSerializable(explicitToJson: true)
class PleromaPushSubscribeRequestSubscription {
  /// Endpoint URL that is called when a notification event occurs.
  String endpoint;
  PleromaPushSubscriptionKeys keys;

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
class PleromaPushSubscriptionKeys {
  /// User agent public key.
  /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
  String p256dh;

  /// Auth secret. Base64 encoded string of 16 bytes of random data.
  String auth;

  PleromaPushSubscriptionKeys({@required this.p256dh, @required this.auth});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPushSubscriptionKeys &&
          runtimeType == other.runtimeType &&
          p256dh == other.p256dh &&
          auth == other.auth;

  @override
  int get hashCode => p256dh.hashCode ^ auth.hashCode;

  @override
  String toString() {
    return 'PleromaPushSubscriptionKeys{p256dh: $p256dh,'
        ' auth: $auth}';
  }

  factory PleromaPushSubscriptionKeys.fromJson(Map<String, dynamic> json) =>
      _$PleromaPushSubscriptionKeysFromJson(json);

  factory PleromaPushSubscriptionKeys.fromJsonString(String jsonString) =>
      _$PleromaPushSubscriptionKeysFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPushSubscriptionKeysToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaPushSubscriptionKeysToJson(this));
}

@HiveType()
@JsonSerializable()
class PleromaPushMessage {
  @HiveField(0)
  @JsonKey(name: "notification_id")
  String notificationId;
  @HiveField(1)
  String server;
  @HiveField(2)
  String account;
  @JsonKey(name: "notification_type")
  @HiveField(3)
  String notificationType;

  PleromaPushMessage(
      {this.notificationId, this.server, this.account, this.notificationType});

  factory PleromaPushMessage.fromJson(Map<String, dynamic> json) =>
      _$PleromaPushMessageFromJson(json);

  factory PleromaPushMessage.fromJsonString(String jsonString) =>
      _$PleromaPushMessageFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPushMessageToJson(this);

  String toJsonString() => jsonEncode(_$PleromaPushMessageToJson(this));

  @override
  String toString() {
    return 'PleromaPushMessage{notificationId: $notificationId,'
        ' server: $server, account: $account,'
        ' notificationType: $notificationType}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPushMessage &&
          runtimeType == other.runtimeType &&
          notificationId == other.notificationId &&
          server == other.server &&
          account == other.account &&
          notificationType == other.notificationType;

  @override
  int get hashCode =>
      notificationId.hashCode ^
      server.hashCode ^
      account.hashCode ^
      notificationType.hashCode;
}
