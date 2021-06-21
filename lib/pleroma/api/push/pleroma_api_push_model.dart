import 'package:fedi/json/json_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_push_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PleromaApiPushSubscribeRequest implements IJsonObject {
  final PleromaApiPushSubscribeData? data;
  final PleromaApiPushSubscribeRequestSubscription? subscription;

  PleromaApiPushSubscribeRequest({
    required this.data,
    required this.subscription,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPushSubscribeRequest &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          subscription == other.subscription;

  @override
  int get hashCode => data.hashCode ^ subscription.hashCode;

  @override
  String toString() {
    return 'PleromaApiPushSubscribeRequest{'
        'data: $data, '
        'subscription: $subscription'
        '}';
  }

  static PleromaApiPushSubscribeRequest fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPushSubscribeRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiPushSubscribeRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PleromaApiPushSubscription {
  // todo: pleroma id is string but mastodon is int
  final dynamic id;
  final String? endpoint;
  final PleromaApiPushSubscribeRequestDataAlerts? alerts;
  @JsonKey(name: 'server_key')
  final String? serverKey;
  final PleromaApiPushSubscribeRequestSubscription? subscription;

  PleromaApiPushSubscription({
    required this.id,
    required this.endpoint,
    required this.alerts,
    required this.serverKey,
    required this.subscription,
  });

  @override
  String toString() {
    return 'PleromaApiPushSubscription{'
        'id: $id, endpoint: $endpoint, '
        'alerts: $alerts, '
        'serverKey: $serverKey, '
        'subscription: $subscription'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPushSubscription &&
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

  static PleromaApiPushSubscription fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPushSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiPushSubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PleromaApiPushSubscribeData {
  final PleromaApiPushSubscribeRequestDataAlerts? alerts;

  PleromaApiPushSubscribeData({
    required this.alerts,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPushSubscribeData &&
          runtimeType == other.runtimeType &&
          alerts == other.alerts;

  @override
  int get hashCode => alerts.hashCode;

  @override
  String toString() {
    return 'PleromaApiPushSubscribeRequestData{alerts: $alerts}';
  }

  static PleromaApiPushSubscribeData fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPushSubscribeDataFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiPushSubscribeDataToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class PleromaApiPushSubscribeRequestDataAlerts {
  final bool? favourite;

  final bool? follow;

  final bool? mention;

  final bool? reblog;

  final bool? poll;

  @JsonKey(name: 'pleroma:chat_mention')
  final bool? pleromaChatMention;
  @JsonKey(name: 'pleroma:emoji_reaction')
  final bool? pleromaEmojiReaction;

  PleromaApiPushSubscribeRequestDataAlerts({
    required this.favourite,
    required this.follow,
    required this.mention,
    required this.reblog,
    required this.poll,
    required this.pleromaChatMention,
    required this.pleromaEmojiReaction,
  });

  PleromaApiPushSubscribeRequestDataAlerts.defaultAllEnabled()
      : this(
          favourite: true,
          follow: true,
          mention: true,
          reblog: true,
          poll: true,
          pleromaChatMention: true,
          pleromaEmojiReaction: true,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPushSubscribeRequestDataAlerts &&
          runtimeType == other.runtimeType &&
          favourite == other.favourite &&
          follow == other.follow &&
          mention == other.mention &&
          reblog == other.reblog &&
          poll == other.poll &&
          pleromaChatMention == other.pleromaChatMention &&
          pleromaEmojiReaction == other.pleromaEmojiReaction;

  @override
  int get hashCode =>
      favourite.hashCode ^
      follow.hashCode ^
      mention.hashCode ^
      reblog.hashCode ^
      poll.hashCode ^
      pleromaChatMention.hashCode ^
      pleromaEmojiReaction.hashCode;

  @override
  String toString() {
    return 'PleromaApiPushSubscribeRequestDataAlerts{'
        'favourite: $favourite,'
        'follow: $follow, '
        'mention: $mention, '
        'reblog: $reblog, '
        'poll: $poll, '
        'pleromaChatMention: $pleromaChatMention, '
        'pleromaEmojiReaction: $pleromaEmojiReaction'
        '}';
  }

  static PleromaApiPushSubscribeRequestDataAlerts fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiPushSubscribeRequestDataAlertsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PleromaApiPushSubscribeRequestDataAlertsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PleromaApiPushSubscribeRequestSubscription {
  /// Endpoint URL that is called when a notification event occurs.
  final String? endpoint;
  final PleromaApiPushSubscriptionKeys? keys;

  PleromaApiPushSubscribeRequestSubscription({
    required this.endpoint,
    required this.keys,
  });

  @override
  String toString() {
    return 'PleromaApiPushSubscribeRequestSubscription{'
        'endpoint: $endpoint,'
        'keys: $keys'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPushSubscribeRequestSubscription &&
          runtimeType == other.runtimeType &&
          endpoint == other.endpoint &&
          keys == other.keys;

  @override
  int get hashCode => endpoint.hashCode ^ keys.hashCode;

  static PleromaApiPushSubscribeRequestSubscription fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiPushSubscribeRequestSubscriptionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PleromaApiPushSubscribeRequestSubscriptionToJson(this);
}

@JsonSerializable()
class PleromaApiPushSubscriptionKeys {
  /// User agent public key.
  /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
  final String p256dh;

  /// Auth secret. Base64 encoded string of 16 bytes of random data.
  final String auth;

  PleromaApiPushSubscriptionKeys({
    required this.p256dh,
    required this.auth,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPushSubscriptionKeys &&
          runtimeType == other.runtimeType &&
          p256dh == other.p256dh &&
          auth == other.auth;

  @override
  int get hashCode => p256dh.hashCode ^ auth.hashCode;

  @override
  String toString() {
    return 'PleromaApiPushSubscriptionKeys{'
        'p256dh: $p256dh, '
        'auth: $auth'
        '}';
  }

  static PleromaApiPushSubscriptionKeys fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPushSubscriptionKeysFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiPushSubscriptionKeysToJson(this);
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 56)
@JsonSerializable(explicitToJson: true)
class PleromaApiPushMessageBody implements IJsonObject {
  @HiveField(0)
  @JsonKey(name: 'notification_id')
  final String notificationId;
  @HiveField(1)
  final String server;
  @HiveField(2)
  final String account;
  @JsonKey(name: 'notification_type')
  @HiveField(3)
  final String notificationType;
  @JsonKey(name: 'notification')
  @HiveField(4)
  final PleromaApiNotification? pleromaApiNotification;

  // action when user clicked on action from reach notification
  @HiveField(5)
  final String? notificationAction;
  // entered string when reply action used
  @HiveField(6)
  final String? notificationActionInput;

  PleromaApiPushMessageBody({
    required this.notificationId,
    required this.server,
    required this.account,
    required this.notificationType,
    required this.pleromaApiNotification,
    required this.notificationAction,
    required this.notificationActionInput,
  });

  static PleromaApiPushMessageBody fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPushMessageBodyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiPushMessageBodyToJson(this);

  @override
  String toString() {
    return 'PleromaApiPushMessageBody{'
        'notificationId: $notificationId, '
        'server: $server, '
        'account: $account, '
        'notificationType: $notificationType'
        'notificationAction: $notificationAction'
        'notificationActionInput: $notificationActionInput'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPushMessageBody &&
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
