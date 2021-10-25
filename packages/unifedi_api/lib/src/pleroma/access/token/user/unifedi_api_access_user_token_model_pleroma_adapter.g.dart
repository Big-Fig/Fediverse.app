// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_user_token_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessUserTokenPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccessUserTokenPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessUserTokenPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessUserTokenPleromaAdapter(
      fields[0] as PleromaApiAccessUserToken,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessUserTokenPleromaAdapter obj) {
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
      other is UnifediApiAccessUserTokenPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessUserTokenPleromaAdapter
    _$$_UnifediApiAccessUserTokenPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessUserTokenPleromaAdapter(
          PleromaApiAccessUserToken.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessUserTokenPleromaAdapterToJson(
        _$_UnifediApiAccessUserTokenPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
