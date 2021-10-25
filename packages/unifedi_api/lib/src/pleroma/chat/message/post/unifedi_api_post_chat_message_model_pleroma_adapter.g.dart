// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_post_chat_message_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPostChatMessagePleromaAdapterAdapter
    extends TypeAdapter<UnifediApiPostChatMessagePleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPostChatMessagePleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPostChatMessagePleromaAdapter(
      fields[0] as PleromaApiPostChatMessage,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPostChatMessagePleromaAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiPostChatMessagePleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPostChatMessagePleromaAdapter
    _$$_UnifediApiPostChatMessagePleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPostChatMessagePleromaAdapter(
          PleromaApiPostChatMessage.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPostChatMessagePleromaAdapterToJson(
        _$_UnifediApiPostChatMessagePleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
