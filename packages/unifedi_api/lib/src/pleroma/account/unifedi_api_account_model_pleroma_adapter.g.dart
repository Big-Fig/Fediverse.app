// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccountPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountPleromaAdapter(
      fields[0] as PleromaApiAccount,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccountPleromaAdapter obj) {
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
      other is UnifediApiAccountPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountPleromaAdapter _$$_UnifediApiAccountPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiAccountPleromaAdapter(
      PleromaApiAccount.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiAccountPleromaAdapterToJson(
        _$_UnifediApiAccountPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
