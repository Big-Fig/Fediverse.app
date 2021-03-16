// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_push_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaPushMessageBodyAdapter
    extends TypeAdapter<PleromaPushMessageBody> {
  @override
  final int typeId = 24;

  @override
  PleromaPushMessageBody read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaPushMessageBody(
      notificationId: fields[0] as String?,
      server: fields[1] as String?,
      account: fields[2] as String?,
      notificationType: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaPushMessageBody obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.notificationId)
      ..writeByte(1)
      ..write(obj.server)
      ..writeByte(2)
      ..write(obj.account)
      ..writeByte(3)
      ..write(obj.notificationType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPushMessageBodyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaPushSubscribeRequest _$PleromaPushSubscribeRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaPushSubscribeRequest(
    data: json['data'] == null
        ? null
        : PleromaPushSubscribeData.fromJson(
            json['data'] as Map<String, dynamic>),
    subscription: json['subscription'] == null
        ? null
        : PleromaPushSubscribeRequestSubscription.fromJson(
            json['subscription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaPushSubscribeRequestToJson(
        PleromaPushSubscribeRequest instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'subscription': instance.subscription?.toJson(),
    };

PleromaPushSubscription _$PleromaPushSubscriptionFromJson(
    Map<String, dynamic> json) {
  return PleromaPushSubscription(
    id: json['id'],
    endpoint: json['endpoint'] as String?,
    alerts: json['alerts'] == null
        ? null
        : PleromaPushSettingsDataAlerts.fromJson(
            json['alerts'] as Map<String, dynamic>),
    serverKey: json['server_key'] as String?,
    subscription: json['subscription'] == null
        ? null
        : PleromaPushSubscribeRequestSubscription.fromJson(
            json['subscription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaPushSubscriptionToJson(
        PleromaPushSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endpoint': instance.endpoint,
      'alerts': instance.alerts?.toJson(),
      'server_key': instance.serverKey,
      'subscription': instance.subscription?.toJson(),
    };

PleromaPushSubscribeData _$PleromaPushSubscribeDataFromJson(
    Map<String, dynamic> json) {
  return PleromaPushSubscribeData(
    alerts: json['alerts'] == null
        ? null
        : PleromaPushSettingsDataAlerts.fromJson(
            json['alerts'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaPushSubscribeDataToJson(
        PleromaPushSubscribeData instance) =>
    <String, dynamic>{
      'alerts': instance.alerts?.toJson(),
    };

PleromaPushSettingsDataAlerts _$PleromaPushSettingsDataAlertsFromJson(
    Map<String, dynamic> json) {
  return PleromaPushSettingsDataAlerts(
    favourite: json['favourite'] as bool?,
    follow: json['follow'] as bool?,
    mention: json['mention'] as bool?,
    reblog: json['reblog'] as bool?,
    poll: json['poll'] as bool?,
    pleromaChatMention: json['pleroma:chat_mention'] as bool?,
    pleromaEmojiReaction: json['pleroma:emoji_reaction'] as bool?,
  );
}

Map<String, dynamic> _$PleromaPushSettingsDataAlertsToJson(
    PleromaPushSettingsDataAlerts instance) {
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

PleromaPushSubscribeRequestSubscription
    _$PleromaPushSubscribeRequestSubscriptionFromJson(
        Map<String, dynamic> json) {
  return PleromaPushSubscribeRequestSubscription(
    endpoint: json['endpoint'] as String?,
    keys: json['keys'] == null
        ? null
        : PleromaPushSubscriptionKeys.fromJson(
            json['keys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaPushSubscribeRequestSubscriptionToJson(
        PleromaPushSubscribeRequestSubscription instance) =>
    <String, dynamic>{
      'endpoint': instance.endpoint,
      'keys': instance.keys?.toJson(),
    };

PleromaPushSubscriptionKeys _$PleromaPushSubscriptionKeysFromJson(
    Map<String, dynamic> json) {
  return PleromaPushSubscriptionKeys(
    p256dh: json['p256dh'] as String?,
    auth: json['auth'] as String?,
  );
}

Map<String, dynamic> _$PleromaPushSubscriptionKeysToJson(
        PleromaPushSubscriptionKeys instance) =>
    <String, dynamic>{
      'p256dh': instance.p256dh,
      'auth': instance.auth,
    };

PleromaPushMessageBody _$PleromaPushMessageBodyFromJson(
    Map<String, dynamic> json) {
  return PleromaPushMessageBody(
    notificationId: json['notification_id'] as String?,
    server: json['server'] as String?,
    account: json['account'] as String?,
    notificationType: json['notification_type'] as String?,
  );
}

Map<String, dynamic> _$PleromaPushMessageBodyToJson(
        PleromaPushMessageBody instance) =>
    <String, dynamic>{
      'notification_id': instance.notificationId,
      'server': instance.server,
      'account': instance.account,
      'notification_type': instance.notificationType,
    };
