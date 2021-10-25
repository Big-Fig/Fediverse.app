// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_announcement_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAnnouncementPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAnnouncementPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAnnouncementPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAnnouncementPleromaAdapter(
      fields[0] as PleromaApiAnnouncement,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAnnouncementPleromaAdapter obj) {
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
      other is UnifediApiAnnouncementPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAnnouncementPleromaAdapter
    _$$_UnifediApiAnnouncementPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAnnouncementPleromaAdapter(
          PleromaApiAnnouncement.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAnnouncementPleromaAdapterToJson(
        _$_UnifediApiAnnouncementPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
