// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_content_variants_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiContentVariantsAdapter
    extends TypeAdapter<PleromaApiContentVariants> {
  @override
  final int typeId = 0;

  @override
  PleromaApiContentVariants read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiContentVariants(
      textPlain: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiContentVariants obj) {
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
      other is PleromaApiContentVariantsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiContentVariants _$$_PleromaApiContentVariantsFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiContentVariants(
      textPlain: json['text/plain'] as String?,
    );

Map<String, dynamic> _$$_PleromaApiContentVariantsToJson(
    _$_PleromaApiContentVariants instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text/plain', instance.textPlain);
  return val;
}
