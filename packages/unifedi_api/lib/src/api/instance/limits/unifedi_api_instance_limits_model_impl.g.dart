// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_limits_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceLimitsAdapter
    extends TypeAdapter<UnifediApiInstanceLimits> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceLimits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceLimits(
      poll: fields[0] as UnifediApiInstancePollLimits?,
      field: fields[1] as UnifediApiInstanceFieldLimits?,
      media: fields[2] as UnifediApiInstanceMediaLimits?,
      chat: fields[3] as UnifediApiInstanceChatLimits?,
      status: fields[4] as UnifediApiInstanceStatusLimits?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceLimits obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.poll)
      ..writeByte(1)
      ..write(obj.field)
      ..writeByte(2)
      ..write(obj.media)
      ..writeByte(3)
      ..write(obj.chat)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiInstanceLimitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceLimits _$$_UnifediApiInstanceLimitsFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiInstanceLimits(
      poll: json['poll'] == null
          ? null
          : UnifediApiInstancePollLimits.fromJson(
              json['poll'] as Map<String, dynamic>),
      field: json['field'] == null
          ? null
          : UnifediApiInstanceFieldLimits.fromJson(
              json['field'] as Map<String, dynamic>),
      media: json['media'] == null
          ? null
          : UnifediApiInstanceMediaLimits.fromJson(
              json['media'] as Map<String, dynamic>),
      chat: json['chat'] == null
          ? null
          : UnifediApiInstanceChatLimits.fromJson(
              json['chat'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : UnifediApiInstanceStatusLimits.fromJson(
              json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiInstanceLimitsToJson(
    _$_UnifediApiInstanceLimits instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('poll', instance.poll?.toJson());
  writeNotNull('field', instance.field?.toJson());
  writeNotNull('media', instance.media?.toJson());
  writeNotNull('chat', instance.chat?.toJson());
  writeNotNull('status', instance.status?.toJson());
  return val;
}
