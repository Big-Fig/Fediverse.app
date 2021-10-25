// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_client_application_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiClientApplicationMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiClientApplicationMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiClientApplicationMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiClientApplicationMastodonAdapter(
      fields[0] as MastodonApiClientApplication,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiClientApplicationMastodonAdapter obj) {
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
      other is UnifediApiClientApplicationMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiClientApplicationMastodonAdapter
    _$$_UnifediApiClientApplicationMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiClientApplicationMastodonAdapter(
          MastodonApiClientApplication.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiClientApplicationMastodonAdapterToJson(
        _$_UnifediApiClientApplicationMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
