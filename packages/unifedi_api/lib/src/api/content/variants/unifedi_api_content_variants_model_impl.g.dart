// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_content_variants_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiContentVariantsAdapter
    extends TypeAdapter<UnifediApiContentVariants> {
  @override
  final int typeId = 0;

  @override
  UnifediApiContentVariants read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiContentVariants(
      textPlain: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiContentVariants obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.textPlain);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiContentVariantsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiContentVariants _$$_UnifediApiContentVariantsFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiContentVariants(
      textPlain: json['text/plain'] as String?,
    );

Map<String, dynamic> _$$_UnifediApiContentVariantsToJson(
    _$_UnifediApiContentVariants instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text/plain', instance.textPlain);
  return val;
}
