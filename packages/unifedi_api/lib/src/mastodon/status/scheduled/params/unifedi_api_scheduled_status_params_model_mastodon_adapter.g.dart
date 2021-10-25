// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_scheduled_status_params_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiScheduledStatusParamsMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiScheduledStatusParamsMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiScheduledStatusParamsMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiScheduledStatusParamsMastodonAdapter(
      fields[0] as MastodonApiScheduledStatusParams,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiScheduledStatusParamsMastodonAdapter obj) {
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
      other is UnifediApiScheduledStatusParamsMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiScheduledStatusParamsMastodonAdapter
    _$$_UnifediApiScheduledStatusParamsMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiScheduledStatusParamsMastodonAdapter(
          MastodonApiScheduledStatusParams.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiScheduledStatusParamsMastodonAdapterToJson(
        _$_UnifediApiScheduledStatusParamsMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
