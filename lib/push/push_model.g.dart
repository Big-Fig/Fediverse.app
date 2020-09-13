// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushMessageAdapter extends TypeAdapter<PushMessage> {
  @override
  PushMessage read(BinaryReader reader) {
    var obj = PushMessage();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 1:
          obj.notification = reader.read() as PushNotification;
          break;
        case 2:
          obj.data = (reader.read() as Map)?.cast<String, dynamic>();
          break;
        case 3:
          obj.typeString = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PushMessage obj) {
    writer.writeByte(3);
    writer.writeByte(1);
    writer.write(obj.notification);
    writer.writeByte(2);
    writer.write(obj.data);
    writer.writeByte(3);
    writer.write(obj.typeString);
  }
}

class PushNotificationAdapter extends TypeAdapter<PushNotification> {
  @override
  PushNotification read(BinaryReader reader) {
    var obj = PushNotification();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.title = reader.read() as String;
          break;
        case 1:
          obj.body = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PushNotification obj) {
    writer.writeByte(2);
    writer.writeByte(0);
    writer.write(obj.title);
    writer.writeByte(1);
    writer.write(obj.body);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
