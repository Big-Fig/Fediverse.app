// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_poll_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPollMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiPollMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPollMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPollMastodonAdapter(
      fields[0] as MastodonApiPoll,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPollMastodonAdapter obj) {
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
      other is UnifediApiPollMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPollMastodonAdapter _$$_UnifediApiPollMastodonAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiPollMastodonAdapter(
      MastodonApiPoll.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiPollMastodonAdapterToJson(
        _$_UnifediApiPollMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
