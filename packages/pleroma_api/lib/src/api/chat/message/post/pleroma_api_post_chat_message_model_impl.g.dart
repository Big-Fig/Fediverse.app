// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_post_chat_message_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiPostChatMessageAdapter
    extends TypeAdapter<PleromaApiPostChatMessage> {
  @override
  final int typeId = 0;

  @override
  PleromaApiPostChatMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiPostChatMessage(
      content: fields[0] as String?,
      mediaId: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiPostChatMessage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.mediaId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPostChatMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiPostChatMessage _$$_PleromaApiPostChatMessageFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiPostChatMessage(
      content: json['content'] as String?,
      mediaId: json['media_id'] as String?,
    );

Map<String, dynamic> _$$_PleromaApiPostChatMessageToJson(
    _$_PleromaApiPostChatMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('media_id', instance.mediaId);
  return val;
}
