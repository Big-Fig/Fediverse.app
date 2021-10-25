// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_oauth_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiOAuthTokenPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiOAuthTokenPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiOAuthTokenPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiOAuthTokenPleromaAdapter(
      fields[0] as PleromaApiOAuthToken,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiOAuthTokenPleromaAdapter obj) {
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
      other is UnifediApiOAuthTokenPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiOAuthTokenPleromaAdapter
    _$$_UnifediApiOAuthTokenPleromaAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiOAuthTokenPleromaAdapter(
          PleromaApiOAuthToken.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiOAuthTokenPleromaAdapterToJson(
        _$_UnifediApiOAuthTokenPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
