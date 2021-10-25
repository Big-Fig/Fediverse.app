// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_application_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiApplicationMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiApplicationMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiApplicationMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiApplicationMastodonAdapter(
      fields[0] as MastodonApiApplication,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiApplicationMastodonAdapter obj) {
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
      other is UnifediApiApplicationMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiApplicationMastodonAdapter
    _$$_UnifediApiApplicationMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiApplicationMastodonAdapter(
          MastodonApiApplication.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiApplicationMastodonAdapterToJson(
        _$_UnifediApiApplicationMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
