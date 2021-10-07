// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushMessageAdapter extends TypeAdapter<PushMessage> {
  @override
  final int typeId = 35;

  @override
  PushMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushMessage(
      notification: fields[1] as PushNotification?,
      data: (fields[2] as Map?)?.cast<String, dynamic>(),
      typeString: fields[3] as String,
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

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PushNotificationAdapter extends TypeAdapter<PushNotification> {
  @override
  final int typeId = 41;

  @override
  PushNotification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushNotification(
      title: fields[0] as String?,
      body: fields[1] as String?,
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

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushNotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PushMessage _$$_PushMessageFromJson(Map<String, dynamic> json) =>
    _$_PushMessage(
      notification: json['notification'] == null
          ? null
          : PushNotification.fromJson(
              json['notification'] as Map<String, dynamic>),
      data: json['data'] as Map<String, dynamic>?,
      typeString: json['typeString'] as String,
    );

Map<String, dynamic> _$$_PushMessageToJson(_$_PushMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('notification', instance.notification?.toJson());
  writeNotNull('data', instance.data);
  val['typeString'] = instance.typeString;
  return val;
}

_$_PushNotification _$$_PushNotificationFromJson(Map<String, dynamic> json) =>
    _$_PushNotification(
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$$_PushNotificationToJson(_$_PushNotification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('body', instance.body);
  return val;
}
