// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_feature_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiFeaturePleromaAdapterAdapter
    extends TypeAdapter<UnifediApiFeaturePleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiFeaturePleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiFeaturePleromaAdapter(
      fields[0] as PleromaApiFeature,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiFeaturePleromaAdapter obj) {
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
      other is UnifediApiFeaturePleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiFeaturePleromaAdapter _$$_UnifediApiFeaturePleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiFeaturePleromaAdapter(
      PleromaApiFeature.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiFeaturePleromaAdapterToJson(
        _$_UnifediApiFeaturePleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
