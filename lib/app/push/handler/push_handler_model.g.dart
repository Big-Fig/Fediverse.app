// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_handler_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushHandlerMessageAdapter extends TypeAdapter<PushHandlerMessage> {
  @override
  PushHandlerMessage read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushHandlerMessage(
      body: fields[0] as PleromaPushMessageBody,
      pushMessage: fields[1] as PushMessage,
    );
  }

  @override
  void write(BinaryWriter writer, PushHandlerMessage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.body)
      ..writeByte(1)
      ..write(obj.pushMessage);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushHandlerMessage _$PushHandlerMessageFromJson(Map<String, dynamic> json) {
  return PushHandlerMessage(
    body: json['body'] == null
        ? null
        : PleromaPushMessageBody.fromJson(json['body'] as Map<String, dynamic>),
    pushMessage: json['push_message'] == null
        ? null
        : PushMessage.fromJson(json['push_message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PushHandlerMessageToJson(PushHandlerMessage instance) =>
    <String, dynamic>{
      'body': instance.body?.toJson(),
      'push_message': instance.pushMessage?.toJson(),
    };
