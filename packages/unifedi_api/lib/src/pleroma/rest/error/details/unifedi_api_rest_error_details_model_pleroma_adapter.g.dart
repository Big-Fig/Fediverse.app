// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_rest_error_details_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiRestErrorDetailsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiRestErrorDetailsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiRestErrorDetailsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiRestErrorDetailsPleromaAdapter(
      fields[0] as PleromaApiRestErrorDetails,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiRestErrorDetailsPleromaAdapter obj) {
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
      other is UnifediApiRestErrorDetailsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiRestErrorDetailsPleromaAdapter
    _$$_UnifediApiRestErrorDetailsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiRestErrorDetailsPleromaAdapter(
          PleromaApiRestErrorDetails.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiRestErrorDetailsPleromaAdapterToJson(
        _$_UnifediApiRestErrorDetailsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
