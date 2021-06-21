// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_push_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiPushMessageBodyAdapter
    extends TypeAdapter<PleromaApiPushMessageBody> {
  @override
  final int typeId = 24;

  @override
  PleromaApiPushMessageBody read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiPushMessageBody(
      notificationId: fields[0] as String,
      server: fields[1] as String,
      account: fields[2] as String,
      notificationType: fields[3] as String,
      pleromaApiNotification: fields[4] as PleromaApiNotification?,
      notificationAction: fields[5] as String?,
      notificationActionInput: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiPushMessageBody obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.notificationId)
      ..writeByte(1)
      ..write(obj.server)
      ..writeByte(2)
      ..write(obj.account)
      ..writeByte(3)
      ..write(obj.notificationType)
      ..writeByte(4)
      ..write(obj.pleromaApiNotification)
      ..writeByte(5)
      ..write(obj.notificationAction)
      ..writeByte(6)
      ..write(obj.notificationActionInput);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPushMessageBodyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiPushSubscribeRequest _$PleromaApiPushSubscribeRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaApiPushSubscribeRequest(
    data: json['data'] == null
        ? null
        : PleromaApiPushSubscribeData.fromJson(
            json['data'] as Map<String, dynamic>),
    subscription: json['subscription'] == null
        ? null
        : PleromaApiPushSubscribeRequestSubscription.fromJson(
            json['subscription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiPushSubscribeRequestToJson(
        PleromaApiPushSubscribeRequest instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'subscription': instance.subscription?.toJson(),
    };

PleromaApiPushSubscription _$PleromaApiPushSubscriptionFromJson(
    Map<String, dynamic> json) {
  return PleromaApiPushSubscription(
    id: json['id'],
    endpoint: json['endpoint'] as String?,
    alerts: json['alerts'] == null
        ? null
        : PleromaApiPushSubscribeRequestDataAlerts.fromJson(
            json['alerts'] as Map<String, dynamic>),
    serverKey: json['server_key'] as String?,
    subscription: json['subscription'] == null
        ? null
        : PleromaApiPushSubscribeRequestSubscription.fromJson(
            json['subscription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiPushSubscriptionToJson(
        PleromaApiPushSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endpoint': instance.endpoint,
      'alerts': instance.alerts?.toJson(),
      'server_key': instance.serverKey,
      'subscription': instance.subscription?.toJson(),
    };

PleromaApiPushSubscribeData _$PleromaApiPushSubscribeDataFromJson(
    Map<String, dynamic> json) {
  return PleromaApiPushSubscribeData(
    alerts: json['alerts'] == null
        ? null
        : PleromaApiPushSubscribeRequestDataAlerts.fromJson(
            json['alerts'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiPushSubscribeDataToJson(
        PleromaApiPushSubscribeData instance) =>
    <String, dynamic>{
      'alerts': instance.alerts?.toJson(),
    };

PleromaApiPushSubscribeRequestDataAlerts
    _$PleromaApiPushSubscribeRequestDataAlertsFromJson(
        Map<String, dynamic> json) {
  return PleromaApiPushSubscribeRequestDataAlerts(
    favourite: json['favourite'] as bool?,
    follow: json['follow'] as bool?,
    mention: json['mention'] as bool?,
    reblog: json['reblog'] as bool?,
    poll: json['poll'] as bool?,
    pleromaChatMention: json['pleroma:chat_mention'] as bool?,
    pleromaEmojiReaction: json['pleroma:emoji_reaction'] as bool?,
  );
}

Map<String, dynamic> _$PleromaApiPushSubscribeRequestDataAlertsToJson(
    PleromaApiPushSubscribeRequestDataAlerts instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('favourite', instance.favourite);
  writeNotNull('follow', instance.follow);
  writeNotNull('mention', instance.mention);
  writeNotNull('reblog', instance.reblog);
  writeNotNull('poll', instance.poll);
  writeNotNull('pleroma:chat_mention', instance.pleromaChatMention);
  writeNotNull('pleroma:emoji_reaction', instance.pleromaEmojiReaction);
  return val;
}

PleromaApiPushSubscribeRequestSubscription
    _$PleromaApiPushSubscribeRequestSubscriptionFromJson(
        Map<String, dynamic> json) {
  return PleromaApiPushSubscribeRequestSubscription(
    endpoint: json['endpoint'] as String?,
    keys: json['keys'] == null
        ? null
        : PleromaApiPushSubscriptionKeys.fromJson(
            json['keys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiPushSubscribeRequestSubscriptionToJson(
        PleromaApiPushSubscribeRequestSubscription instance) =>
    <String, dynamic>{
      'endpoint': instance.endpoint,
      'keys': instance.keys?.toJson(),
    };

PleromaApiPushSubscriptionKeys _$PleromaApiPushSubscriptionKeysFromJson(
    Map<String, dynamic> json) {
  return PleromaApiPushSubscriptionKeys(
    p256dh: json['p256dh'] as String,
    auth: json['auth'] as String,
  );
}

Map<String, dynamic> _$PleromaApiPushSubscriptionKeysToJson(
        PleromaApiPushSubscriptionKeys instance) =>
    <String, dynamic>{
      'p256dh': instance.p256dh,
      'auth': instance.auth,
    };

PleromaApiPushMessageBody _$PleromaApiPushMessageBodyFromJson(
    Map<String, dynamic> json) {
  return PleromaApiPushMessageBody(
    notificationId: json['notification_id'] as String,
    server: json['server'] as String,
    account: json['account'] as String,
    notificationType: json['notification_type'] as String,
    pleromaApiNotification: json['notification'] == null
        ? null
        : PleromaApiNotification.fromJson(
            json['notification'] as Map<String, dynamic>),
    notificationAction: json['notificationAction'] as String?,
    notificationActionInput: json['notificationActionInput'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiPushMessageBodyToJson(
        PleromaApiPushMessageBody instance) =>
    <String, dynamic>{
      'notification_id': instance.notificationId,
      'server': instance.server,
      'account': instance.account,
      'notification_type': instance.notificationType,
      'notification': instance.pleromaApiNotification?.toJson(),
      'notificationAction': instance.notificationAction,
      'notificationActionInput': instance.notificationActionInput,
    };
