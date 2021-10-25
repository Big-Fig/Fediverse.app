// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_content_variants_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiContentVariantsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiContentVariantsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiContentVariantsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiContentVariantsPleromaAdapter(
      fields[0] as PleromaApiContentVariants,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiContentVariantsPleromaAdapter obj) {
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
      other is UnifediApiContentVariantsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiContentVariantsPleromaAdapter
    _$$_UnifediApiContentVariantsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiContentVariantsPleromaAdapter(
          PleromaApiContentVariants.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiContentVariantsPleromaAdapterToJson(
        _$_UnifediApiContentVariantsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
