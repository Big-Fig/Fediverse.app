// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_push_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaPushSubscribeDataAdapter
    extends TypeAdapter<PleromaPushSubscribeData> {
  @override
  PleromaPushSubscribeData read(BinaryReader reader) {
    var obj = PleromaPushSubscribeData();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 1:
          obj.alerts = reader.read() as PleromaPushSettingsDataAlerts;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaPushSubscribeData obj) {
    writer.writeByte(1);
    writer.writeByte(1);
    writer.write(obj.alerts);
  }
}

class PleromaPushSettingsDataAlertsAdapter
    extends TypeAdapter<PleromaPushSettingsDataAlerts> {
  @override
  PleromaPushSettingsDataAlerts read(BinaryReader reader) {
    var obj = PleromaPushSettingsDataAlerts();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 1:
          obj.favourite = reader.read() as bool;
          break;
        case 2:
          obj.follow = reader.read() as bool;
          break;
        case 3:
          obj.mention = reader.read() as bool;
          break;
        case 4:
          obj.reblog = reader.read() as bool;
          break;
        case 5:
          obj.poll = reader.read() as bool;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaPushSettingsDataAlerts obj) {
    writer.writeByte(5);
    writer.writeByte(1);
    writer.write(obj.favourite);
    writer.writeByte(2);
    writer.write(obj.follow);
    writer.writeByte(3);
    writer.write(obj.mention);
    writer.writeByte(4);
    writer.write(obj.reblog);
    writer.writeByte(5);
    writer.write(obj.poll);
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
      'data': instance.data,
      'subscription': instance.subscription,
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
      'alerts': instance.alerts,
    };

PleromaPushSettingsDataAlerts _$PleromaPushSettingsDataAlertsFromJson(
    Map<String, dynamic> json) {
  return PleromaPushSettingsDataAlerts(
    favourite: json['favourite'] as bool,
    follow: json['follow'] as bool,
    mention: json['mention'] as bool,
    reblog: json['reblog'] as bool,
    poll: json['poll'] as bool,
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
    };

PleromaPushSubscribeRequestSubscription
    _$PleromaPushSubscribeRequestSubscriptionFromJson(
        Map<String, dynamic> json) {
  return PleromaPushSubscribeRequestSubscription(
    endpoint: json['endpoint'] as String,
    keys: json['keys'] == null
        ? null
        : PleromaPushSettingsSubscriptionKeys.fromJson(
            json['keys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaPushSubscribeRequestSubscriptionToJson(
        PleromaPushSubscribeRequestSubscription instance) =>
    <String, dynamic>{
      'endpoint': instance.endpoint,
      'keys': instance.keys,
    };

PleromaPushSettingsSubscriptionKeys
    _$PleromaPushSettingsSubscriptionKeysFromJson(Map<String, dynamic> json) {
  return PleromaPushSettingsSubscriptionKeys(
    p256dh: json['p256dh'] as String,
    auth: json['auth'] as String,
  );
}

Map<String, dynamic> _$PleromaPushSettingsSubscriptionKeysToJson(
        PleromaPushSettingsSubscriptionKeys instance) =>
    <String, dynamic>{
      'p256dh': instance.p256dh,
      'auth': instance.auth,
    };
