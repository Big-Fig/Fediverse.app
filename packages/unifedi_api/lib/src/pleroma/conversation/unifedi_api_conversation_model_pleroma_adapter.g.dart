// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_conversation_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiConversationPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiConversationPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiConversationPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiConversationPleromaAdapter(
      fields[0] as PleromaApiConversation,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiConversationPleromaAdapter obj) {
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
      other is UnifediApiConversationPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiConversationPleromaAdapter
    _$$_UnifediApiConversationPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiConversationPleromaAdapter(
          PleromaApiConversation.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiConversationPleromaAdapterToJson(
        _$_UnifediApiConversationPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
