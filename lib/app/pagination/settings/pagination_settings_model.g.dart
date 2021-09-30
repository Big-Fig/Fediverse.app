// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaginationSettingsAdapter extends TypeAdapter<PaginationSettings> {
  @override
  final int typeId = 63;

  @override
  PaginationSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaginationSettings(
      pageSizeString: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PaginationSettings obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pageSizeString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationSettings _$PaginationSettingsFromJson(Map<String, dynamic> json) =>
    PaginationSettings(
      pageSizeString: json['page_size'] as String,
    );

Map<String, dynamic> _$PaginationSettingsToJson(PaginationSettings instance) =>
    <String, dynamic>{
      'page_size': instance.pageSizeString,
    };
