// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_my_account_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMyAccountPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiMyAccountPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMyAccountPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMyAccountPleromaAdapter(
      fields[0] as PleromaApiMyAccount,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMyAccountPleromaAdapter obj) {
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
      other is UnifediApiMyAccountPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMyAccountPleromaAdapter
    _$$_UnifediApiMyAccountPleromaAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiMyAccountPleromaAdapter(
          PleromaApiMyAccount.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiMyAccountPleromaAdapterToJson(
        _$_UnifediApiMyAccountPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
