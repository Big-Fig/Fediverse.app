// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_status_context_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiStatusContextMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiStatusContextMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiStatusContextMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiStatusContextMastodonAdapter(
      fields[0] as MastodonApiStatusContext,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiStatusContextMastodonAdapter obj) {
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
      other is UnifediApiStatusContextMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiStatusContextMastodonAdapter
    _$$_UnifediApiStatusContextMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiStatusContextMastodonAdapter(
          MastodonApiStatusContext.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiStatusContextMastodonAdapterToJson(
        _$_UnifediApiStatusContextMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
