// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_urls_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceUrlsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiInstanceUrlsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceUrlsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceUrlsPleromaAdapter(
      fields[0] as PleromaApiInstanceUrls,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceUrlsPleromaAdapter obj) {
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
      other is UnifediApiInstanceUrlsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceUrlsPleromaAdapter
    _$$_UnifediApiInstanceUrlsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceUrlsPleromaAdapter(
          PleromaApiInstanceUrls.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstanceUrlsPleromaAdapterToJson(
        _$_UnifediApiInstanceUrlsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
