// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_chat_limits_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceChatLimitsAdapter
    extends TypeAdapter<UnifediApiInstanceChatLimits> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceChatLimits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceChatLimits(
      messageLimit: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceChatLimits obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.messageLimit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiInstanceChatLimitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceChatLimits _$$_UnifediApiInstanceChatLimitsFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiInstanceChatLimits(
      messageLimit: json['message_limit'] as int?,
    );

Map<String, dynamic> _$$_UnifediApiInstanceChatLimitsToJson(
    _$_UnifediApiInstanceChatLimits instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message_limit', instance.messageLimit);
  return val;
}
