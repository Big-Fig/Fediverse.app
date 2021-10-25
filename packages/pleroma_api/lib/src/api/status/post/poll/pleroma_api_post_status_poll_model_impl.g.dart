// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_post_status_poll_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiPostStatusPollAdapter
    extends TypeAdapter<PleromaApiPostStatusPoll> {
  @override
  final int typeId = 0;

  @override
  PleromaApiPostStatusPoll read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiPostStatusPoll(
      expiresInSeconds: fields[0] as int,
      hideTotals: fields[1] as bool,
      multiple: fields[2] as bool,
      options: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiPostStatusPoll obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.options)
      ..writeByte(0)
      ..write(obj.expiresInSeconds)
      ..writeByte(2)
      ..write(obj.multiple)
      ..writeByte(1)
      ..write(obj.hideTotals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPostStatusPollAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiPostStatusPoll _$$_PleromaApiPostStatusPollFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiPostStatusPoll(
      expiresInSeconds: json['expires_in'] as int,
      hideTotals: json['hide_totals'] as bool,
      multiple: json['multiple'] as bool,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_PleromaApiPostStatusPollToJson(
        _$_PleromaApiPostStatusPoll instance) =>
    <String, dynamic>{
      'expires_in': instance.expiresInSeconds,
      'hide_totals': instance.hideTotals,
      'multiple': instance.multiple,
      'options': instance.options,
    };
