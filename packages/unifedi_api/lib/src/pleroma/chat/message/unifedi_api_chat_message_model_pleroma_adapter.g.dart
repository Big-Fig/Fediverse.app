// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_chat_message_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiChatMessagePleromaAdapterAdapter
    extends TypeAdapter<UnifediApiChatMessagePleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiChatMessagePleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiChatMessagePleromaAdapter(
      fields[0] as PleromaApiChatMessage,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiChatMessagePleromaAdapter obj) {
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
      other is UnifediApiChatMessagePleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiChatMessagePleromaAdapter
    _$$_UnifediApiChatMessagePleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiChatMessagePleromaAdapter(
          PleromaApiChatMessage.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiChatMessagePleromaAdapterToJson(
        _$_UnifediApiChatMessagePleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
