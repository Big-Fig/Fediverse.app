// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_application_token_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessApplicationTokenPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccessApplicationTokenPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessApplicationTokenPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessApplicationTokenPleromaAdapter(
      fields[0] as PleromaApiAccessApplicationToken,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiAccessApplicationTokenPleromaAdapter obj) {
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
      other is UnifediApiAccessApplicationTokenPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessApplicationTokenPleromaAdapter
    _$$_UnifediApiAccessApplicationTokenPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessApplicationTokenPleromaAdapter(
          PleromaApiAccessApplicationToken.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessApplicationTokenPleromaAdapterToJson(
        _$_UnifediApiAccessApplicationTokenPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
