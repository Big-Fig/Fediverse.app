// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_status_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiStatusMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiStatusMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiStatusMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiStatusMastodonAdapter(
      fields[0] as MastodonApiStatus,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiStatusMastodonAdapter obj) {
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
      other is UnifediApiStatusMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiStatusMastodonAdapter _$$_UnifediApiStatusMastodonAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiStatusMastodonAdapter(
      MastodonApiStatus.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiStatusMastodonAdapterToJson(
        _$_UnifediApiStatusMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
