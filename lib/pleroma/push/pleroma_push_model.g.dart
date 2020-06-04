// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_push_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaPushMessageAdapter extends TypeAdapter<PleromaPushMessage> {
  @override
  PleromaPushMessage read(BinaryReader reader) {
    var obj = PleromaPushMessage();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.notificationId = reader.read() as String;
          break;
        case 1:
          obj.server = reader.read() as String;
          break;
        case 2:
          obj.account = reader.read() as String;
          break;
        case 3:
          obj.notificationType = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaPushMessage obj) {
    writer.writeByte(4);
    writer.writeByte(0);
    writer.write(obj.notificationId);
    writer.writeByte(1);
    writer.write(obj.server);
    writer.writeByte(2);
    writer.write(obj.account);
    writer.writeByte(3);
    writer.write(obj.notificationType);
  }
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
    endpoint: json['endpoint'] as String,
    alerts: json['alerts'] == null
        ? null
        : PleromaPushSettingsDataAlerts.fromJson(
            json['alerts'] as Map<String, dynamic>),
    serverKey: json['server_key'] as String,
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
    favourite: json['favourite'] as bool,
    follow: json['follow'] as bool,
    mention: json['mention'] as bool,
    reblog: json['reblog'] as bool,
    poll: json['poll'] as bool,
    pleromaChatMention: json['pleroma:chat_mention'] as bool,
  );
}

Map<String, dynamic> _$PleromaPushSettingsDataAlertsToJson(
        PleromaPushSettingsDataAlerts instance) =>
    <String, dynamic>{
      'favourite': instance.favourite,
      'follow': instance.follow,
      'mention': instance.mention,
      'reblog': instance.reblog,
      'poll': instance.poll,
      'pleroma:chat_mention': instance.pleromaChatMention,
    };

PleromaPushSubscribeRequestSubscription
    _$PleromaPushSubscribeRequestSubscriptionFromJson(
        Map<String, dynamic> json) {
  return PleromaPushSubscribeRequestSubscription(
    endpoint: json['endpoint'] as String,
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
    p256dh: json['p256dh'] as String,
    auth: json['auth'] as String,
  );
}

Map<String, dynamic> _$PleromaPushSubscriptionKeysToJson(
        PleromaPushSubscriptionKeys instance) =>
    <String, dynamic>{
      'p256dh': instance.p256dh,
      'auth': instance.auth,
    };

PleromaPushMessage _$PleromaPushMessageFromJson(Map<String, dynamic> json) {
  return PleromaPushMessage(
    notificationId: json['notification_id'] as String,
    server: json['server'] as String,
    account: json['account'] as String,
    notificationType: json['notification_type'] as String,
  );
}

Map<String, dynamic> _$PleromaPushMessageToJson(PleromaPushMessage instance) =>
    <String, dynamic>{
      'notification_id': instance.notificationId,
      'server': instance.server,
      'account': instance.account,
      'notification_type': instance.notificationType,
    };
