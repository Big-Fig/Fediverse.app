// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_schedule_post_status_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiSchedulePostStatusMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiSchedulePostStatusMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiSchedulePostStatusMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiSchedulePostStatusMastodonAdapter(
      fields[0] as MastodonApiSchedulePostStatus,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiSchedulePostStatusMastodonAdapter obj) {
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
      other is UnifediApiSchedulePostStatusMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiSchedulePostStatusMastodonAdapter
    _$$_UnifediApiSchedulePostStatusMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiSchedulePostStatusMastodonAdapter(
          MastodonApiSchedulePostStatus.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiSchedulePostStatusMastodonAdapterToJson(
        _$_UnifediApiSchedulePostStatusMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
