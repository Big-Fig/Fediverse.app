// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_poll_option_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiPollOptionAdapter extends TypeAdapter<PleromaApiPollOption> {
  @override
  final int typeId = 0;

  @override
  PleromaApiPollOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiPollOption(
      title: fields[0] as String,
      votesCount: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiPollOption obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.votesCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPollOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiPollOption _$$_PleromaApiPollOptionFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiPollOption(
      title: json['title'] as String,
      votesCount: json['votes_count'] as int?,
    );

Map<String, dynamic> _$$_PleromaApiPollOptionToJson(
    _$_PleromaApiPollOption instance) {
  final val = <String, dynamic>{
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('votes_count', instance.votesCount);
  return val;
}
