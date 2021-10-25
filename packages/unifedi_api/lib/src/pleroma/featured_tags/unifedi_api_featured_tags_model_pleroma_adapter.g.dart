// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_featured_tags_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiFeaturedTagPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiFeaturedTagPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiFeaturedTagPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiFeaturedTagPleromaAdapter(
      fields[0] as PleromaApiFeaturedTag,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiFeaturedTagPleromaAdapter obj) {
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
      other is UnifediApiFeaturedTagPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiFeaturedTagPleromaAdapter
    _$$_UnifediApiFeaturedTagPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiFeaturedTagPleromaAdapter(
          PleromaApiFeaturedTag.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiFeaturedTagPleromaAdapterToJson(
        _$_UnifediApiFeaturedTagPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
