// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_chat_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiChatPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiChatPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiChatPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiChatPleromaAdapter(
      fields[0] as PleromaApiChat,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiChatPleromaAdapter obj) {
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
      other is UnifediApiChatPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiChatPleromaAdapter _$$_UnifediApiChatPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiChatPleromaAdapter(
      PleromaApiChat.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiChatPleromaAdapterToJson(
        _$_UnifediApiChatPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
