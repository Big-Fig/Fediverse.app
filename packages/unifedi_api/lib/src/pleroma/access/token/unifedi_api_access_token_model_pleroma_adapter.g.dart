// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_token_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessTokenPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccessTokenPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessTokenPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessTokenPleromaAdapter(
      fields[0] as PleromaApiAccessToken,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessTokenPleromaAdapter obj) {
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
      other is UnifediApiAccessTokenPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessTokenPleromaAdapter
    _$$_UnifediApiAccessTokenPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessTokenPleromaAdapter(
          PleromaApiAccessToken.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessTokenPleromaAdapterToJson(
        _$_UnifediApiAccessTokenPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
