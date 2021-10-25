// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_marker_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMarkerPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiMarkerPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMarkerPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMarkerPleromaAdapter(
      fields[0] as PleromaApiMarker,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMarkerPleromaAdapter obj) {
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
      other is UnifediApiMarkerPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMarkerPleromaAdapter _$$_UnifediApiMarkerPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiMarkerPleromaAdapter(
      PleromaApiMarker.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiMarkerPleromaAdapterToJson(
        _$_UnifediApiMarkerPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
