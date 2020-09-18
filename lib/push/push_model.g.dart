// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushMessageAdapter extends TypeAdapter<PushMessage> {
  @override
  PushMessage read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushMessage(
      typeString: fields[3] as String,
      notification: fields[1] as PushNotification,
      data: (fields[2] as Map)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, PushMessage obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.notification)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.typeString);
  }
}

class PushNotificationAdapter extends TypeAdapter<PushNotification> {
  @override
  PushNotification read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushNotification(
      title: fields[0] as String,
      body: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PushNotification obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.body);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushMessage _$PushMessageFromJson(Map<String, dynamic> json) {
  return PushMessage(
    typeString: json['typeString'] as String,
    notification: json['notification'] == null
        ? null
        : PushNotification.fromJson(
            json['notification'] as Map<String, dynamic>),
    data: json['data'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$PushMessageToJson(PushMessage instance) =>
    <String, dynamic>{
      'notification': instance.notification?.toJson(),
      'data': instance.data,
      'typeString': instance.typeString,
    };

PushNotification _$PushNotificationFromJson(Map<String, dynamic> json) {
  return PushNotification(
    title: json['title'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$PushNotificationToJson(PushNotification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };
