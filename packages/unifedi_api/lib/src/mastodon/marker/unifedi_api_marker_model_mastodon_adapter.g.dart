// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_marker_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMarkerMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiMarkerMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMarkerMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMarkerMastodonAdapter(
      fields[0] as MastodonApiMarker,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMarkerMastodonAdapter obj) {
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
      other is UnifediApiMarkerMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMarkerMastodonAdapter _$$_UnifediApiMarkerMastodonAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiMarkerMastodonAdapter(
      MastodonApiMarker.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiMarkerMastodonAdapterToJson(
        _$_UnifediApiMarkerMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
