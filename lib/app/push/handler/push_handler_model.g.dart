// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_handler_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushHandlerMessageAdapter extends TypeAdapter<PushHandlerMessage> {
  @override
  final int typeId = 34;

  @override
  PushHandlerMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushHandlerMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
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
