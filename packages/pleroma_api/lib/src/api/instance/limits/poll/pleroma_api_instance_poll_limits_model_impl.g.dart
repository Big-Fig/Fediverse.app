// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_instance_poll_limits_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiInstancePollLimitsAdapter
    extends TypeAdapter<PleromaApiInstancePollLimits> {
  @override
  final int typeId = 0;

  @override
  PleromaApiInstancePollLimits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstancePollLimits(
      maxExpiration: fields[0] as int?,
      maxOptionChars: fields[1] as int?,
      maxOptions: fields[2] as int?,
      minExpiration: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiInstancePollLimits obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.maxExpiration)
      ..writeByte(1)
      ..write(obj.maxOptionChars)
      ..writeByte(2)
      ..write(obj.maxOptions)
      ..writeByte(3)
      ..write(obj.minExpiration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePollLimitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiInstancePollLimits _$$_PleromaApiInstancePollLimitsFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiInstancePollLimits(
      maxExpiration: json['max_expiration'] as int?,
      maxOptionChars: json['max_option_chars'] as int?,
      maxOptions: json['max_options'] as int?,
      minExpiration: json['min_expiration'] as int?,
    );

Map<String, dynamic> _$$_PleromaApiInstancePollLimitsToJson(
    _$_PleromaApiInstancePollLimits instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('max_expiration', instance.maxExpiration);
  writeNotNull('max_option_chars', instance.maxOptionChars);
  writeNotNull('max_options', instance.maxOptions);
  writeNotNull('min_expiration', instance.minExpiration);
  return val;
}
