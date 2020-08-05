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
        case 0:
          obj.type = reader.read() as PushMessageType;
          break;
        case 1:
          obj.notification = reader.read() as PushNotification;
          break;
        case 2:
          obj.data = (reader.read() as Map)?.cast<String, dynamic>();
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PushMessage obj) {
    writer.writeByte(3);
    writer.writeByte(0);
    writer.write(obj.type);
    writer.writeByte(1);
    writer.write(obj.notification);
    writer.writeByte(2);
    writer.write(obj.data);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotification _$PushNotificationFromJson(Map<String, dynamic> json) {
  return PushNotification(
    json['title'] as String,
    json['body'] as String,
  );
}

Map<String, dynamic> _$PushNotificationToJson(PushNotification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };
