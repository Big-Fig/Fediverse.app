// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_application_token_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessApplicationTokenMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccessApplicationTokenMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessApplicationTokenMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessApplicationTokenMastodonAdapter(
      fields[0] as MastodonApiAccessApplicationToken,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiAccessApplicationTokenMastodonAdapter obj) {
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
      other is UnifediApiAccessApplicationTokenMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessApplicationTokenMastodonAdapter
    _$$_UnifediApiAccessApplicationTokenMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessApplicationTokenMastodonAdapter(
          MastodonApiAccessApplicationToken.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessApplicationTokenMastodonAdapterToJson(
        _$_UnifediApiAccessApplicationTokenMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
