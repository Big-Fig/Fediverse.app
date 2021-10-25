// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_mention_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMentionPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiMentionPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMentionPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMentionPleromaAdapter(
      fields[0] as PleromaApiMention,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMentionPleromaAdapter obj) {
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
      other is UnifediApiMentionPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMentionPleromaAdapter _$$_UnifediApiMentionPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiMentionPleromaAdapter(
      PleromaApiMention.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiMentionPleromaAdapterToJson(
        _$_UnifediApiMentionPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
