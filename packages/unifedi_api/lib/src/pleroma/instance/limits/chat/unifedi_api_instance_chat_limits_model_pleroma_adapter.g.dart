// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_chat_limits_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceChatLimitsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiInstanceChatLimitsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceChatLimitsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceChatLimitsPleromaAdapter(
      fields[0] as PleromaApiInstance,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiInstanceChatLimitsPleromaAdapter obj) {
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
      other is UnifediApiInstanceChatLimitsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceChatLimitsPleromaAdapter
    _$$_UnifediApiInstanceChatLimitsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceChatLimitsPleromaAdapter(
          PleromaApiInstance.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstanceChatLimitsPleromaAdapterToJson(
        _$_UnifediApiInstanceChatLimitsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
